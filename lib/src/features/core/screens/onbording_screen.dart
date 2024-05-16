import 'package:email_ai/src/constants/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../gen/assets.gen.dart';
import '../../../../main.dart';
import '../../../common_widgets/app_button.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: <Widget>[
      Positioned(
        bottom: MediaQuery.of(context).size.height * 0.06,
        left: 20,
        right: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: "Empower\nyour Emails\nwith",
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40),
                  ),
                  TextSpan(
                    text: ' AI',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 40, color: AppColor.primaryColor),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              "Communicate more effectively and \nefficiently",
              style: Theme.of(context).textTheme.labelLarge,
            ),
            SizedBox(
              height: 15,
            ),
            AppButton(
              'Get Started',
              () {
                box.write("isOnBoarding", false);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
              isLoading: false,
              textStyle: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColor.whiteColor),
            ),
          ],
        ),
      ),
      Positioned(
        top: MediaQuery.of(context).size.height * 0.08,
        child: Assets.images.onboarding.image(
          fit: BoxFit.fitWidth,
        ),
      ),
    ]));
  }
}
