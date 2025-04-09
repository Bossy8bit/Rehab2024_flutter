
import 'package:flutter/material.dart';




import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:qrcodescanner/lib/qr_code_scanner.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rehab2024/CustomScaffold.dart';

class QRCodePageHomeScreen extends StatefulWidget {
  final Function(Locale) changeLanguage;

  QRCodePageHomeScreen({required this.changeLanguage});

  @override
  _QRCodePageHomeScreenState createState() => _QRCodePageHomeScreenState();
}

class _QRCodePageHomeScreenState extends State<QRCodePageHomeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? qrController;
  String scannedData = "";

  @override
  void dispose() {
    qrController?.stopCamera();
    qrController?.dispose();
    super.dispose();
  }

  Future<void> checkCameraPermissions() async {
    var status = await Permission.camera.request();
    if (status != PermissionStatus.granted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content:Text(AppLocalizations.of(context)!.cameraPermission)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      changeLanguage: widget.changeLanguage,
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // QR Code Scanner Section
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  Expanded(child: _buildQrView(context)), // QR Scanner View
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      scannedData.isEmpty
                          ? AppLocalizations.of(context)!.scanQrcode
                          :"${AppLocalizations.of(context)!.scannedData} $scannedData",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    var scanArea = MediaQuery.of(context).size.width * 0.7;
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
        borderColor: Colors.blue,
        borderRadius: 10,
        borderLength: 20,
        borderWidth: 10,
        cutOutSize: scanArea,
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) async {
    qrController = controller;
    await checkCameraPermissions();
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null && scanData.code != scannedData) {
        setState(() {
          scannedData = scanData.code!;
        });
      }
    });
  }
}
