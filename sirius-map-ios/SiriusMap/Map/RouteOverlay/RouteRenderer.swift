// Copyright © 2024 Apple Inc.
//
// Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
//  RouteRenderer.swift
//  SiriusMap
//
//  Created by Egor on 24.03.2024.
//

import Foundation
import MapKit

class RouteRenderer: MKOverlayRenderer {
    private let routeOverlay: RouteOverlay

    /// This overlay renderer subclass works with the data a `BreadcrumbPath` provides.
    init(routeOverlay: RouteOverlay) {
        self.routeOverlay = routeOverlay
        super.init(overlay: routeOverlay)
    }

    /**
     MapKit calls this function before calling `draw(_:zoomScale:in:)`. This sample app customizes the implementation
     to check if the `pathBounds` of the `BreadcrumbPath` contains the `mapRect`. If there is no intersection, this function
     returns `false` so drawing for `mapRect` doesn't proceed to draw an empty rectangle, which is inefficient.
     */
    // - Tag: renderer_can_draw
    override func canDraw(_ mapRect: MKMapRect, zoomScale _: MKZoomScale) -> Bool {
        #if false
            route.pathBounds.intersects(mapRect)
        #endif
        return true
    }

    /**
      MapKit calls this function to render the overlay for the `mapRect` at a `zoomScale`.
      The drawing of an overlay may happen in a tile-based fashion, with multiple background threads simultaneously
      calling this function for each to render a different rectangle.
     */
    // - Tag: renderer_draw
    override func draw(_ mapRect: MKMapRect, zoomScale: MKZoomScale, in context: CGContext) {
        /// Scale the width of the line to match the width of a road.
        let lineWidth = MKRoadWidthAtZoomScale(zoomScale)

        /// Outset `mapRect` by the line width to include points just outside of the current rectangle in the generated path.
        let clipRect = mapRect.insetBy(dx: -lineWidth, dy: -lineWidth)

        /**
         Because the system might call this function on multiple background threads simultaneously,
         and the `locations` property of the `BreadcrumbPath` updates frequently,
         `locations` needs to guard against data races. See the comments in `BreadcrumbPath` for details.
         */
        let points = routeOverlay.locations.map { MKMapPoint(CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)) }
        if let path = pathForPoints(points, mapRect: clipRect, zoomScale: zoomScale) {
            context.addPath(path)
            context.setStrokeColor(UIColor.systemBlue.withAlphaComponent(0.5).cgColor)
            context.setLineJoin(.round)
            context.setLineCap(.round)
            context.setLineWidth(lineWidth)
            context.strokePath()
        }
    }

    /**
     - Parameter points: Two points defining a line.
     - Parameter rect: A map rectangle to test.
     - Returns: `true` if the line that the points define intersects `rect`.
     */
    private func lineBetween(points: (p0: MKMapPoint, p1: MKMapPoint), intersects rect: MKMapRect) -> Bool {
        let minX = Double.minimum(points.p0.x, points.p1.x)
        let minY = Double.minimum(points.p0.y, points.p1.y)
        let maxX = Double.maximum(points.p0.x, points.p1.x)
        let maxY = Double.maximum(points.p0.y, points.p1.y)

        let testRect = MKMapRect(x: minX, y: minY, width: maxX - minX, height: maxY - minY)
        return rect.intersects(testRect)
    }

    /**
     Manipulate a `CGMutablePath` by moving the pen to draw a line or move to a new point.
     - Parameter liftingPen: Pass `true` to move the pen to a new location for a  discontinuous line.
     */
    private func addLine(to path: CGMutablePath, with points: (p0: MKMapPoint, p1: MKMapPoint), liftingPen: Bool) {
        if liftingPen {
            let lastDrawingPoint = point(for: points.p1)
            path.move(to: lastDrawingPoint)
        }
        let drawingPoint = point(for: points.p0)
        path.addLine(to: drawingPoint)
    }

    /// Construct a `CGPath` from an array of map points.
    private func pathForPoints(_ points: [MKMapPoint], mapRect: MKMapRect, zoomScale: MKZoomScale) -> CGPath? {
        guard points.count > 1 else { return nil }

        // Simplify the geometry for the screen by eliding points that are too close together,
        // and to omit any line segments that don't intersect the clipping rectangle.
        let path = CGMutablePath()

        var needsToLiftPen = true

        // Calculate the minimum distance between any two points by applying the Pythagorean theorem to figure out
        // how many map points correspond to `minimumScreenPoints` at the current `zoomScale`.
        let minimumScreenPoints = 5.0
        let minPointDelta = minimumScreenPoints / zoomScale
        let cSquared = pow(minPointDelta, 2)

        var lastMapPoint = points.first!
        for (index, mapPoint) in points.enumerated() {
            if index == 0 { continue }

            let aSquaredBSquared = pow(mapPoint.x - lastMapPoint.x, 2) + pow(mapPoint.y - lastMapPoint.y, 2)
            if aSquaredBSquared >= cSquared {
                if lineBetween(points: (mapPoint, lastMapPoint), intersects: mapRect) {
                    addLine(to: path, with: (mapPoint, lastMapPoint), liftingPen: needsToLiftPen)
                    needsToLiftPen = false
                } else {
                    // Discontinuity, lift the pen.
                    needsToLiftPen = true
                }
                lastMapPoint = mapPoint
            }
        }

        // If the last line segment intersects the `mapRect` at all, add it unconditionally.
        let mapPoint = points.last!
        if lineBetween(points: (mapPoint, lastMapPoint), intersects: mapRect) {
            addLine(to: path, with: (mapPoint, lastMapPoint), liftingPen: needsToLiftPen)
        }

        return path
    }
}
