import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_images.dart';

class AddSuccessPage extends StatelessWidget {
  AddSuccessPage({super.key, required this.code, required this.image});
  final String code;
  final Uint8List? image;

  double height = 0;
  double width = 0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF00643C),
      appBar: AppBar(
        backgroundColor: const Color(0xFF00643C),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.more_vert_rounded,
                color: Colors.white,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.08),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const Icon(
                    Icons.check_circle_outline_rounded,
                    size: 80,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text(
                    "Done",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Container(
                    height: height * 0.25,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16)),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                        width: 40,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(AppImages.card1),
                        ),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Star Caffee",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                          Text(
                            "Loyality Card",
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            )),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              style: ButtonStyle(
                  padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(horizontal: 90, vertical: 12)),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.floatingBtnColor)),
              child: const Text(
                "Continue",
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
      ),
    );
  }
}
