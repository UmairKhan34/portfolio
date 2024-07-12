// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class LetWorkView extends StatefulWidget {
  const LetWorkView({super.key});

  @override
  State<LetWorkView> createState() => _LetWorkViewState();
}

class _LetWorkViewState extends State<LetWorkView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: smallScreen(),
      mediumScreen: mediumScreen(),
      largeScreen: largeScreen(),
    );
  }

  Widget socailMedia(String image, VoidCallback onTap, double scale) {
    return InkWell(
      onTap: onTap,
      child: Image.asset(
        image,
        scale: scale,
      ),
    );
  }

  Widget largeScreen() {
    return Column(
      children: [
        h5,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Let's \nWork Together",
              style: R.textStyle.poppins(
                  weight: FontWeight.w500,
                  color: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.whiteColor
                      : R.colors.blackColor,
                  size: 17.sp),
            ),
            InkWell(
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'your email',
                  query:
                      'subject=Hello&body=How Can I help you?', // You can add more parameters here
                );
                String url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                height: 10.h,
                width: 30.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.bgColor
                        : R.colors.whiteBg,
                    border: Border.all(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.serviceColor
                            : R.colors.serviceColor)),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        R.images.gmail,
                        height: 3.h,
                        width: 5.w,
                      ),
                      Text(
                        'your email',
                        style: R.textStyle.poppins(
                            weight: FontWeight.w400,
                            color: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.whiteColor
                                : R.colors.blackColor,
                            size: 3.sp),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        h5,
        Divider(
          color: R.colors.serviceColor,
          thickness: 1,
        ),
        h3,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '© 2024 All rights reserved.',
              style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.secondaryColor
                    : R.colors.bgColor,
                size: 6.sp,
              ),
            ),
            w1,
            Row(
              children: [
                socailMedia(R.images.linkedIn, () async {
                  final url = R.appUrl.linked_in_url;
                  await launchUrl(Uri.parse(url));
                }, 8),
                w2,
                socailMedia(R.images.github, () async {
                  final url = R.appUrl.github_url;
                  await launchUrl(Uri.parse(url));
                }, 5),
                w2,
                socailMedia(R.images.upwork, () async {
                  final url = R.appUrl.upwork_url;
                  await launchUrl(Uri.parse(url));
                }, 2),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget smallScreen() {
    return Column(
      children: [
        h5,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Let's \nWork Together",
              style: R.textStyle.poppins(
                  weight: FontWeight.w500,
                  color: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.whiteColor
                      : R.colors.blackColor,
                  size: 12.sp),
            ),
            InkWell(
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'your email',
                  query:
                      'subject=Hello&body=How Can I help you?', // You can add more parameters here
                );
                String url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                height: 5.h,
                width: 35.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.bgColor
                        : R.colors.whiteBg,
                    border: Border.all(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.serviceColor
                            : R.colors.serviceColor)),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        R.images.gmail,
                        height: 3.h,
                        width: 5.w,
                      ),
                      Text(
                        'your email',
                        style: R.textStyle.poppins(
                            weight: FontWeight.w400,
                            color: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.whiteColor
                                : R.colors.blackColor,
                            size: 4.sp),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        h5,
        Divider(
          color: R.colors.serviceColor,
          thickness: 1,
        ),
        h1,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '© 2024 All rights reserved.',
              style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.secondaryColor
                    : R.colors.bgColor,
                size: 6.sp,
              ),
            ),
            w1,
            Row(
              children: [
                socailMedia(R.images.linkedIn, () async {
                  final url = R.appUrl.linked_in_url;
                  await launchUrl(Uri.parse(url));
                }, 14),
                w2,
                socailMedia(R.images.github, () async {
                  final url = R.appUrl.github_url;
                  await launchUrl(Uri.parse(url));
                }, 12),
                w2,
                socailMedia(R.images.upwork, () async {
                  final url = R.appUrl.upwork_url;
                  await launchUrl(Uri.parse(url));
                }, 5),
              ],
            )
          ],
        ),
        h2
      ],
    );
  }

  Widget mediumScreen() {
    return Column(
      children: [
        h5,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Let's \nWork Together",
              style: R.textStyle.poppins(
                  weight: FontWeight.w500,
                  color: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.whiteColor
                      : R.colors.blackColor,
                  size: 13.sp),
            ),
            InkWell(
              onTap: () async {
                final Uri params = Uri(
                  scheme: 'mailto',
                  path: 'your email',
                  query:
                      'subject=Hello&body=How Can I help you?', // You can add more parameters here
                );
                String url = params.toString();
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch $url';
                }
              },
              child: Container(
                height: 10.h,
                width: 30.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.bgColor
                        : R.colors.whiteBg,
                    border: Border.all(
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.serviceColor
                            : R.colors.serviceColor)),
                child: Center(
                  child: Row(
                    children: [
                      Image.asset(
                        R.images.gmail,
                        height: 3.h,
                        width: 5.w,
                      ),
                      Text(
                        'your email',
                        style: R.textStyle.poppins(
                            weight: FontWeight.w400,
                            color: Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.whiteColor
                                : R.colors.blackColor,
                            size: 3.sp),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
        h5,
        Divider(
          color: R.colors.serviceColor,
          thickness: 1,
        ),
        h1,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              '© 2024 All rights reserved.',
              style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.secondaryColor
                    : R.colors.bgColor,
                size: 6.sp,
              ),
            ),
            w1,
            Row(
              children: [
                socailMedia(R.images.linkedIn, () async {
                  final url = R.appUrl.linked_in_url;
                  await launchUrl(Uri.parse(url));
                }, 12),
                w2,
                socailMedia(R.images.github, () async {
                  final url = R.appUrl.github_url;
                  await launchUrl(Uri.parse(url));
                }, 11),
                w2,
                socailMedia(R.images.upwork, () async {
                  final url = R.appUrl.upwork_url;
                  await launchUrl(Uri.parse(url));
                }, 3),
              ],
            )
          ],
        )
      ],
    );
  }
}
