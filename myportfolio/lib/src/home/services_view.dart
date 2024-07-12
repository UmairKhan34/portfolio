import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/utilis/gradient_text.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:sizer/sizer.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({super.key});

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: smallScreen(),
      mediumScreen: mediumScreen(),
      largeScreen: largeScreen(),
    );
  }

  Widget smallScreen() {
    return Column(
      children: [
        Text(
          'What I do',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: 20.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'My Services',
          style: R.textStyle.poppins(size: 8.sp),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h3P5,
        Column(
          children: [
            myServices('Mobile App Development',
                'I create user-friendly and efficient mobile apps using Flutter ensuring they run smoothly on both Android and iOS platforms'),
            h1,
            myServices('Web App Development',
                'I build responsive web applications with Flutter, providing a seamless experience across different devices and screen sizes'),
            h1,
            myServices('API Integration',
                'I enhance app functionality by integrating various APIs allowing for better performance and additional features'),
            h1,
            myServices('Firebase Integration',
                'I connect apps to Firebase for real-time database managementuser authentication, and other essential backend services'),
            h1,
            myServices('Local Storage Solutions',
                'I implement local storage options like Hive or MySQL to manage data efficiently on the device, ensuring fast access and reliability.'),
            h1,
            myServices('Custom Application Development',
                'I develop a wide range of applications tailored to meet specific client needs, from simple tools to complex solutions.'),
            h5
          ],
        )
      ],
    );
  }

  Widget mediumScreen() {
    return largeScreen();
  }

  Widget largeScreen() {
    return Column(
      children: [
        Text(
          'What I do',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: 17.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'My Services',
          style: R.textStyle.poppins(size: 6.sp),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h3P5,
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 1.5.w),
          scrollDirection: Axis.horizontal,
          child: Column(
            children: [
              Row(
                children: [
                  myServices('Mobile App Development',
                      'I create user-friendly and efficient mobile apps using Flutter ensuring they run smoothly on both Android and iOS platforms'),
                  w1,
                  myServices('Web App Development',
                      'I build responsive web applications with Flutter, providing a seamless experience across different devices and screen sizes'),
                  w1,
                  myServices('API Integration',
                      'I enhance app functionality by integrating various APIs allowing for better performance and additional features'),
                  w5
                ],
              ),
              h3,
              Row(
                children: [
                  myServices('Firebase Integration',
                      'I connect apps to Firebase for real-time database managementuser authentication, and other essential backend services'),
                  w1,
                  myServices('Local Storage Solutions',
                      'I implement local storage options like Hive or MySQL to manage data efficiently on the device, ensuring fast access and reliability.'),
                  w1,
                  myServices('Custom Application Development',
                      'I develop a wide range of applications tailored to meet specific client needs, from simple tools to complex solutions.'),
                  w5
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget myServices(String title, String description) {
    return Container(
      padding: EdgeInsets.only(left: 1.w, top: 1.5.h),
      height: ResponsiveWidget.isLargeScreen(context)
          ? 42.h
          : ResponsiveWidget.isMediumScreen(context)
              ? 30.h
              : 33.h,
      width: ResponsiveWidget.isLargeScreen(context)
          ? 39.w
          : ResponsiveWidget.isMediumScreen(context)
              ? 32.w
              : 70.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.serviceColor
              : R.colors.whiteColor.withOpacity(.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          h2,
          h2,
          Text(
            title,
            style: R.textStyle.poppins(
                weight: FontWeight.bold,
                size: ResponsiveWidget.isLargeScreen(context)
                    ? 6.sp
                    : ResponsiveWidget.isMediumScreen(context)
                        ? 5.sp
                        : 12.sp,
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.whiteColor
                    : R.colors.blackColor),
          ),
          h2,
          aboutText(description)
        ],
      ),
    );
  }

  Widget aboutText(
    String title,
  ) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: R.textStyle.poppins(
                  weight: FontWeight.w300,
                  color: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.secondaryColor
                      : R.colors.blackColor,
                  size: ResponsiveWidget.isLargeScreen(context)
                      ? 5.sp
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 4.sp
                          : 10.sp))
        ]));
  }
}
