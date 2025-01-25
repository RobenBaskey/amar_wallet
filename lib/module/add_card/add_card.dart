import 'dart:async';

import 'package:amar_wallet/core/app_colors.dart';
import 'package:amar_wallet/core/app_images.dart';
import 'package:amar_wallet/core/constants.dart';
import 'package:amar_wallet/module/add_card/pages/add_to_wallet.dart';
import 'package:amar_wallet/module/global_widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class AddCardPage extends StatefulWidget {
  const AddCardPage({super.key});

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

class _AddCardPageState extends State<AddCardPage> with WidgetsBindingObserver {
  final MobileScannerController controller = MobileScannerController(
    autoStart: false,
    torchEnabled: true,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    unawaited(controller.start());
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (!controller.value.hasCameraPermission) {
      return;
    }

    switch (state) {
      case AppLifecycleState.detached:
      case AppLifecycleState.hidden:
      case AppLifecycleState.paused:
        return;
      case AppLifecycleState.resumed:
        unawaited(controller.start());
      case AppLifecycleState.inactive:
        unawaited(controller.stop());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1F1E1E),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 56,
                width: double.infinity,
              ),
              const CustomImage(path: AppImages.portraitCard),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Add a card",
                style: TextStyle(
                    fontSize: 28,
                    color: Colors.white,
                    fontFamily: Constants.sansation),
              ),
              const SizedBox(
                height: 67,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: MobileScanner(
                      controller: controller,
                      errorBuilder: (context, error, child) {
                        print("Error = ${error.errorDetails?.message}");
                        return Text(error.errorDetails?.message ?? "");
                      },
                      fit: BoxFit.contain,
                      onDetect: (barcodes) {
                        if (barcodes.barcodes.isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => AddToWallet(
                                  code: barcodes.barcodes.first.rawValue ?? "",
                                  image: barcodes.image),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const Text(
                "Scan the Bar or QR code",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 80,
              ),
              Row(
                children: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Cancel",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.floatingBtnColor),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const AddToWallet(
                                    code: "dsf",
                                    image: null,
                                  )));
                    },
                    style: ButtonStyle(
                        padding: const WidgetStatePropertyAll(
                            EdgeInsets.symmetric(horizontal: 16, vertical: 10)),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.floatingBtnColor)),
                    child: const Text(
                      "Enter manually",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
