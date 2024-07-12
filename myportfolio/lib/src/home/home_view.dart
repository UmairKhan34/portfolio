import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/services/hive_db.dart';
import 'package:myportfolio/src/home/about_view.dart';
import 'package:myportfolio/src/home/get_in_touch_view.dart';
import 'package:myportfolio/src/home/let_work.dart';
import 'package:myportfolio/src/home/project_view.dart';
import 'package:myportfolio/src/home/services_view.dart';
import 'package:myportfolio/src/view_model/base_vm.dart';
import 'package:myportfolio/utilis/gradient_text.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/hover_button.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  static String route = "/homeView";
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _smallScreenController = ScrollController();

  HiveDb db = HiveDb();

  @override
  Widget build(BuildContext context) {
    return Consumer<BaseVM>(
      builder: (context, authVm, child) {
        return ResponsiveWidget(
          smallScreen: smallScreen(context),
          mediumScreen: mediumScreen(context),
          largeScreen: largeScreen(context),
        );
      },
    );
  }

  Widget commonAppBarButton(VoidCallback onTap, String title, TextStyle style) {
    return HoverButton(
      onTap: onTap,
      title: title,
      style: style,
    );
  }

  Widget drawerItem(String title, VoidCallback onTap) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: InkWell(
        onTap: onTap,
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20.sp,
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor,
          ),
        ),
      ),
    );
  }

  Widget largeScreen(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.bgColor
              : R.colors.whiteBg,
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              h3,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  commonAppBarButton(
                    () {},
                    "Muhammad Umair",
                    R.textStyle.oleoScript(
                      size: 6.sp,
                      color: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.whiteColor
                          : R.colors.blackColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    children: [
                      commonAppBarButton(
                        () {},
                        "Home",
                        R.textStyle.poppins(
                          size: 3.sp,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          weight: FontWeight.w400,
                        ),
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w4,
                      commonAppBarButton(
                        () {
                          _scrollController.animateTo(
                            800.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        "About",
                        R.textStyle.poppins(
                          size: 3.sp,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          weight: FontWeight.w400,
                        ),
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w4,
                      commonAppBarButton(
                        () {
                          _scrollController.animateTo(
                            2750.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        "Projects",
                        R.textStyle.poppins(
                          size: 3.sp,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          weight: FontWeight.w400,
                        ),
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w4,
                      commonAppBarButton(
                        () {
                          _scrollController.animateTo(
                            1750.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        "Services",
                        R.textStyle.poppins(
                          size: 3.sp,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          weight: FontWeight.w400,
                        ),
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w4,
                      commonAppBarButton(
                        () async {
                          final url = R.appUrl.cv_url;
                          await launchUrl(Uri.parse(url));
                        },
                        "Resume",
                        R.textStyle.poppins(
                          size: 3.sp,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          weight: FontWeight.w300,
                        ),
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w4,
                      contactMeButton(
                        ResponsiveWidget.isMediumScreen(context) ? 4.h : 4.5.h,
                        'Contact Me',
                        () {
                          _scrollController.animateTo(
                            3700.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        ResponsiveWidget.isMediumScreen(context) ? 15.w : 10.w,
                        9,
                      ),
                      ResponsiveWidget.isMediumScreen(context) ? w1P5 : w5,
                      InkWell(
                        onTap: () async {
                          final provider = context.read<BaseVM>();
                          provider.toggleTheme();

                          HiveDb db = HiveDb();
                          await db.setThemeMode(Constant.themeMode ?? "");
                        },
                        child: Constant.themeMode == "ThemeMode.dark"
                            ? Image.asset(
                                R.images.theme,
                                height: 3.h,
                                width: 8.w,
                              )
                            : Image.asset(
                                R.images.whiteTheme,
                                height: 3.h,
                                width: 8.w,
                              ),
                      ),
                    ],
                  ),
                ],
              ),
              h5,
              Container(
                height: 100.h,
                width: 70.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Constant.themeMode == "ThemeMode.dark"
                        ? AssetImage(R.images.bgImage)
                        : AssetImage(R.images.whitebg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        R.images.developer,
                        height: 35.h,
                        width: 70.w,
                      ),
                      h4,
                      Text(
                        'Muhammad Umair',
                        style: R.textStyle.poppins(
                          size: 13.sp,
                          weight: FontWeight.bold,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                        ),
                      ),
                      h1,
                      GradientText(
                        text: 'App Developer',
                        style: R.textStyle.poppins(
                          size: 6.sp,
                          weight: FontWeight.w400,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            R.colors.textColor,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.whiteColor
                                : R.colors.blackColor,
                          ],
                        ),
                      ),
                      h2,
                      Text(
                        "Skilled app developer proficient in designing, coding, and testing mobile applications. Experienced \nin creating user-friendly interfaces and implementing new features. Passionate about leveraging technology to solve real-world problems.",
                        textAlign: TextAlign.center,
                        style: R.textStyle.poppins(
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          size: 4.sp,
                        ),
                      ),
                      h3,
                      contactMeButton(
                        ResponsiveWidget.isMediumScreen(context) ? 5.h : 5.5.h,
                        'Contact Me',
                        () {
                          _scrollController.animateTo(
                            3700.0,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        ResponsiveWidget.isMediumScreen(context) ? 15.w : 12.w,
                        55,
                      ),
                      h10,
                    ],
                  ),
                ),
              ),
              h16,
              h2,
              AboutView(),
              h5,
              contactMeButton(
                ResponsiveWidget.isLargeScreen(context) ? 6.5.h : 7.h,
                'Download Resume',
                () async {
                  final url = R.appUrl.cv_url;
                  await launchUrl(Uri.parse(url));
                },
                ResponsiveWidget.isLargeScreen(context) ? 12.w : 25.w,
                55,
              ),
              h20,
              ServiceView(),
              h20,
              ProjectView(),
              h20,
              GetInTouchView(),
              h10,
              LetWorkView(),
              h5,
            ],
          ),
        ),
      ),
    );
  }

  Widget mediumScreen(BuildContext context) {
    return largeScreen(context);
  }

  Widget smallScreen(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        controller: _smallScreenController,
        child: Container(
          decoration: BoxDecoration(
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.bgColor
                : R.colors.whiteBg,
          ),
          child: Column(
            children: [
              h5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  commonAppBarButton(
                    () {},
                    "Muhammad Umair",
                    R.textStyle.oleoScript(
                      size: 12.sp,
                      color: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.whiteColor
                          : R.colors.blackColor,
                      weight: FontWeight.w500,
                    ),
                  ),
                  w3,
                  Builder(
                    builder: (context) => InkWell(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Image.asset(
                        R.images.drawer,
                        scale: 3,
                        color: Constant.themeMode == "ThemeMode.dark"
                            ? R.colors.whiteColor
                            : R.colors.bgColor,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 76.h,
                width: 70.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: Constant.themeMode == "ThemeMode.dark"
                        ? AssetImage(R.images.bgImage)
                        : AssetImage(R.images.whitebg),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        R.images.developer,
                        height: 20.h,
                        width: 35.w,
                      ),
                      h2,
                      Text(
                        'Muhammad Umair',
                        style: R.textStyle.poppins(
                          size: 15.sp,
                          weight: FontWeight.bold,
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                        ),
                      ),
                      h2,
                      GradientText(
                        text: 'App Developer',
                        style: R.textStyle.poppins(
                          size: 10.sp,
                          weight: FontWeight.w400,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            R.colors.textColor,
                            Constant.themeMode == "ThemeMode.dark"
                                ? R.colors.whiteColor
                                : R.colors.blackColor,
                          ],
                        ),
                      ),
                      h2,
                      Text(
                        "Skilled app developer proficient in designing, coding, and testing mobile applications. Experienced \nin creating user-friendly interfaces and implementing new features. Passionate about leveraging technology to solve real-world problems.",
                        textAlign: TextAlign.center,
                        style: R.textStyle.poppins(
                          color: Constant.themeMode == "ThemeMode.dark"
                              ? R.colors.whiteColor
                              : R.colors.blackColor,
                          size: 9.sp,
                        ),
                      ),
                      h5,
                      contactMeButton(
                        5.h,
                        'Contact Me',
                        () {
                          _smallScreenController.animateTo(
                            3900,
                            duration: Duration(seconds: 1),
                            curve: Curves.easeInOut,
                          );
                        },
                        55.w,
                        55,
                      ),
                    ],
                  ),
                ),
              ),
              h8,
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                child: Column(
                  children: [
                    AboutView(),
                    h5,
                    contactMeButton(
                      5.h,
                      'Download Resume',
                      () async {
                        final url = R.appUrl.cv_url;
                        await launchUrl(Uri.parse(url));
                      },
                      55.w,
                      55,
                    ),
                    h13,
                    ServiceView(),
                    h5,
                    ProjectView(),
                    h10,
                    GetInTouchView(),
                    h5,
                  ],
                ),
              ),
              LetWorkView()
            ],
          ),
        ),
      ),
      endDrawer: Drawer(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.bgColor
              : R.colors.whiteBg,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                drawerItem('Home', () {}),
                drawerItem(
                  'About',
                  () {
                    try {
                      _smallScreenController.animateTo(
                        670,
                        duration: Duration(seconds: 1),
                        curve: Curves.easeInOut,
                      );
                    } catch (e) {
                      print('Error during scroll animation: $e');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to scroll to About section'),
                        ),
                      );
                    } finally {
                      Navigator.pop(context);
                    }
                  },
                ),
                drawerItem('Projects', () {
                  try {
                    _smallScreenController.animateTo(
                      2750,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  } catch (e) {
                    print('Error during scroll animation: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to scroll to About section'),
                      ),
                    );
                  } finally {
                    Navigator.pop(context);
                  }
                }),
                drawerItem('Services', () {
                  try {
                    _smallScreenController.animateTo(
                      1300,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  } catch (e) {
                    print('Error during scroll animation: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to scroll to About section'),
                      ),
                    );
                  } finally {
                    Navigator.pop(context);
                  }
                }),
                drawerItem('Resume', () async {
                  final url = R.appUrl.cv_url;
                  await launchUrl(Uri.parse(url));
                  Navigator.pop(context);
                }),
                drawerItem('Contact Me', () {
                  try {
                    _smallScreenController.animateTo(
                      3900,
                      duration: Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  } catch (e) {
                    print('Error during scroll animation: $e');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Failed to scroll to About section'),
                      ),
                    );
                  } finally {
                    Navigator.pop(context);
                  }
                }),
                InkWell(
                  onTap: () async {
                    final provider = context.read<BaseVM>();
                    provider.toggleTheme();

                    HiveDb db = HiveDb();
                    await db.setThemeMode(Constant.themeMode ?? "");
                  },
                  child: Constant.themeMode == "ThemeMode.dark"
                      ? Image.asset(
                          R.images.theme,
                          height: 3.h,
                          width: 8.w,
                        )
                      : Image.asset(
                          R.images.whiteTheme,
                          height: 3.h,
                          width: 8.w,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget contactMeButton(double height, String title, VoidCallback onTap,
      double width, double radius) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.bgColor
              : R.colors.whiteBg,
          border: Border.all(
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.textColor
                : R.colors.blackColor,
          ),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              fontSize: ResponsiveWidget.isLargeScreen(context)
                  ? 3.sp
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 5.sp
                      : 8.sp,
            ),
          ),
        ),
      ),
    );
  }
}
