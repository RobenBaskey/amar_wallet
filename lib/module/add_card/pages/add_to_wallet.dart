import 'package:amar_wallet/core/app_icons.dart';
import 'package:amar_wallet/core/app_images.dart';
import 'package:amar_wallet/module/add_card/pages/add_success_page.dart';
import 'package:amar_wallet/module/global_widget/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_colors.dart';

class AddToWallet extends StatefulWidget {
  const AddToWallet({super.key, required this.code, required this.image});
  final String code;
  final Uint8List? image;

  @override
  State<AddToWallet> createState() => _AddToWalletState();
}

class _AddToWalletState extends State<AddToWallet> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 80,
                      width: 80,
                      child: CircleAvatar(
                        backgroundImage: AssetImage(AppImages.card1),
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    const Text(
                      "Star Caffee",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    const Text(
                      "Loyality Card",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              height: 40,
                              width: 40,
                              child: CircleAvatar(
                                  backgroundColor: Color(0xFFEBEBEB),
                                  child: CustomImage(path: AppIcons.scanner)),
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Text(
                                "Scan your card",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    TextField(
                      controller: TextEditingController(text: widget.code),
                      decoration: InputDecoration(
                        labelText: 'Member ID',
                        labelStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 10,
                        ),
                        floatingLabelAlignment: FloatingLabelAlignment.start,
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 1.5,
                          ),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 14, horizontal: 10),
                      ),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    RichText(
                        text: const TextSpan(children: [
                      TextSpan(
                          text:
                              "Blah blah blah blah some bulshit that no one reads blah blah blah. "),
                      TextSpan(
                        text: "some blah blah link ",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF0258C9),
                            fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                          text:
                              " Blah blah blah blah some bulshit that no one reads blah blah blah. "),
                      TextSpan(
                        text: "some blah blah link ",
                        style: TextStyle(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                            color: Color(0xFF0258C9),
                            fontWeight: FontWeight.w600),
                      )
                    ], style: TextStyle(fontSize: 16, color: Colors.black)))
                  ],
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AddSuccessPage(
                            code: widget.code,
                            image: widget.image,
                          )));
            },
            style: ButtonStyle(
                padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(horizontal: 53, vertical: 12)),
                backgroundColor:
                    WidgetStatePropertyAll(AppColors.floatingBtnColor)),
            child: const Text(
              "Add to Amar Wallet",
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          const SafeArea(
            top: false,
            child: SizedBox(
              height: 30,
            ),
          )
        ],
      ),
    );
  }
}
