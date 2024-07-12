import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/utilis/gradient_text.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:sizer/sizer.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'About Me',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: ResponsiveWidget.isLargeScreen(context)
                  ? 17.sp
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 17.sp
                      : 20.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'Get to Know me',
          style: R.textStyle.poppins(
            size: ResponsiveWidget.isLargeScreen(context)
                ? 6.sp
                : ResponsiveWidget.isMediumScreen(context)
                    ? 6.sp
                    : 8.sp,
          ),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h5,
        Container(
            width: ResponsiveWidget.isLargeScreen(context)
                ? 80.w
                : ResponsiveWidget.isMediumScreen(context)
                    ? 80.w
                    : double.infinity,
            child: Column(
              children: [
                aboutText(
                    'I am a skilled Flutter app developer with a strong focus on creating both mobile and web '),
                aboutText(
                    'applications. My expertise lies in using Flutter to build versatile and responsive apps that work'),
                aboutText(
                    'seamlessly across different platforms. I ensure that every application I develop is user-friendly,'),
                aboutText(
                    'efficient, and meets the specific needs of my clients.'),
                h2,
                aboutText(
                    'I also specialize in integrating APIs to enhance the functionality of the'),
                aboutText(
                    'applications. I also have experience in connecting apps to Firebase, which allows for real-time '),
                aboutText(
                    'database management, user authentication, and more. This integration ensures that the apps I'),
                aboutText(
                    'create are robust, scalable, and capable of handling various user interactions smoothly.'),
                h3,
              ],
            ))
      ],
    );
  }

  Widget aboutText(
    String title,
  ) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: R.textStyle.poppins(
                weight: FontWeight.w400,
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.whiteColor
                    : R.colors.blackColor,
                size: ResponsiveWidget.isLargeScreen(context)
                    ? 5.sp
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 5.sp
                        : 9.sp,
              ))
        ]));
  }
}
