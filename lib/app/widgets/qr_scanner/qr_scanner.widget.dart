import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';


class CustomQrScanner extends StatelessWidget{
  final Function(String value) onDetect;

  const CustomQrScanner({super.key, required this.onDetect});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MobileScanner(
        scanWindow: Rect.largest,
         fit: BoxFit.contain,
       // overlay: Container(color: Colors.amber, child: Text("Hola")),
        controller: MobileScannerController(
          detectionSpeed: DetectionSpeed.normal,
          facing: CameraFacing.back,
          torchEnabled: false,
          detectionTimeoutMs: 1000,
        ),
        onDetect: (capture) {
            if(capture.barcodes.firstOrDefault()!=null) {
              onDetect(capture.barcodes.firstOrDefault()!.rawValue??"");
            }
        }
      )
    );
  }



}