import 'package:flutter/material.dart';

extension SliverUtils on Widget {
  SliverToBoxAdapter get sliver => SliverToBoxAdapter(child: this);

  SliverPadding padding(EdgeInsets insets) =>
      SliverPadding(padding: insets, sliver: this);
}