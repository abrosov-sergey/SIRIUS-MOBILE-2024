import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sirius_map/src/app/domain/providers/app_state_provider.dart';
import 'package:flutter_sirius_map/src/core/utils/context.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrScannerPage extends StatefulWidget {
  const QrScannerPage({super.key});

  @override
  State<QrScannerPage> createState() => _QrScannerPageState();
}

class _QrScannerPageState extends State<QrScannerPage> {
  late final MobileScannerController qrController;

  @override
  void initState() {
    qrController =
        MobileScannerController(detectionSpeed: DetectionSpeed.noDuplicates);
    super.initState();
  }

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.scan_qr),
        leading: BackButton(
          color: context.themeExtendColors.iconColor,
        ),
        backgroundColor: context.themeExtendColors.primaryColor,
      ),
      backgroundColor: context.themeExtendColors.primaryColor,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 100.h,
            ),
            Text(
              textAlign: TextAlign.center,
              context.localization.scan_qr_instruction,
              style: context.themeExtendTextStyles.bodyStyle,
            ),
            SizedBox(
              height: 40.h,
            ),
            Consumer(
              builder: (context, ref, child) => Center(
                child: AspectRatio(
                  aspectRatio: 1,
                  child: MobileScanner(
                    controller: qrController,
                    onDetect: (capture) => _onDetect(capture, context, ref),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void _onDetect(BarcodeCapture capture, BuildContext context, WidgetRef ref) {
  final List<Barcode> barcodes = capture.barcodes;

  for (var barcode in barcodes) {
    final url = barcode.rawValue;

    if (url != null && url.startsWith('http://sirius.map')) {
      final placeId = Uri.parse(url).queryParameters['placeId'];
      if (placeId != null) {
        Navigator.of(context).pop();
        ref
            .read(appStateNotifierProvider.notifier)
            .addPointById(placePointId: int.parse(placeId));
      }
    }
  }
}
