import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/utilis/gradient_text.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:sizer/sizer.dart';

class ProjectView extends StatefulWidget {
  const ProjectView({super.key});

  @override
  State<ProjectView> createState() => _ProjectViewState();
}

class _ProjectViewState extends State<ProjectView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: smallScreen(),
      mediumScreen: mediumScreen(),
      largeScreen: largeScreen(),
    );
  }

  Widget myProjects(String image, String title, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: ResponsiveWidget.isLargeScreen(context)
              ? 40.w
              : ResponsiveWidget.isMediumScreen(context)
                  ? 35.w
                  : 70.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.serviceColor
                : R.colors.whiteColor.withOpacity(.5),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                image,
                fit: BoxFit.cover,
              ),
              h2,
              Text(
                title,
                style: R.textStyle.poppins(
                    weight: FontWeight.bold,
                    size: ResponsiveWidget.isLargeScreen(context)
                        ? 6.sp
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 6.sp
                            : 12.sp,
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.whiteColor
                        : R.colors.blackColor),
              ),
              h2,
              aboutText(description)
            ],
          ),
        ),
      ],
    );
  }

  Widget aboutText(
    String title,
  ) {
    return Padding(
      padding: EdgeInsets.only(left: 2.w),
      child: RichText(
          textAlign: TextAlign.start,
          text: TextSpan(children: [
            TextSpan(
                text: title,
                style: R.textStyle.poppins(
                    weight: FontWeight.w300,
                    color: Constant.themeMode == "ThemeMode.dark"
                        ? R.colors.secondaryColor
                        : R.colors.serviceColor,
                    size: ResponsiveWidget.isLargeScreen(context)
                        ? 5.sp
                        : ResponsiveWidget.isMediumScreen(context)
                            ? 4.sp
                            : 10.sp))
          ])),
    );
  }

  Widget largeScreen() {
    return Column(
      children: [
        Text(
          'Projects',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: 17.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'Some of my Work',
          style: R.textStyle.poppins(size: 6.sp),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h5,
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 1.5.w),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              myProjects(R.images.projectOne, 'Hope Water',
                  'In university, we built a Flutter-based water delivery app where users can order and refill water, choose different languages, and pay securely with Stripe. We used Firebase for backend support.'),
              w2,
              myProjects(R.images.projectTwo, 'MasMas Food',
                  'During my internship, I built the Masmas food delivery app using Flutter. The app features a responsive design with a clean MVVM architecture, utilizes Firebase for the backend, and employs Hive DB for local storage.'),
              w2,
              myProjects(R.images.projectThree, 'Chat Application',
                  'I built a real-time chat application using Firebase and Firestore, where users log in with Google, eliminating the need for passwords. The app includes a theme mode and integrates the Gemini API for a chatbot.')
            ],
          ),
        )
      ],
    );
  }

  Widget smallScreen() {
    return Column(
      children: [
        Text(
          'Projects',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: 20.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'Some of my Work',
          style: R.textStyle.poppins(size: 8.sp),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h5,
        myProjects(R.images.projectOne, 'Hope Water',
            'In university, we built a Flutter-based water delivery app where users can order and refill water, choose different languages, and pay securely with Stripe. We used Firebase for backend support.'),
        h3,
        myProjects(R.images.projectTwo, 'MasMas Food',
            'During my internship, I built the Masmas food delivery app using Flutter. The app features a responsive design with a clean MVVM architecture, utilizes Firebase for the backend, and employs Hive DB for local storage.'),
        h3,
        myProjects(R.images.projectThree, 'Chat Application',
            'I built a real-time chat application using Firebase and Firestore, where users log in with Google, eliminating the need for passwords. The app includes a theme mode and integrates the Gemini API for a chatbot.')
      ],
    );
  }

  Widget mediumScreen() {
    return Column(
      children: [
        Text(
          'Projects',
          style: R.textStyle.poppins(
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor,
              size: 17.sp,
              weight: FontWeight.bold),
        ),
        GradientText(
          text: 'Some of my Work',
          style: R.textStyle.poppins(size: 6.sp),
          gradient: LinearGradient(colors: [
            R.colors.textColor,
            Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.blackColor
          ]),
        ),
        h5,
        SingleChildScrollView(
          padding: EdgeInsets.only(left: 1.5.w),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              myProjects(R.images.projectOne, 'Hope Water',
                  'In university, we built a Flutter-based water delivery app where users can order and refill water, choose different languages, and pay securely with Stripe. We used Firebase for backend support.'),
              w2,
              myProjects(R.images.projectTwo, 'MasMas Food',
                  'During my internship, I built the Masmas food delivery app using Flutter. The app features a responsive design with a clean MVVM architecture, utilizes Firebase for the backend, and employs Hive DB for local storage.'),
              w2,
              myProjects(R.images.projectThree, 'Chat Application',
                  'I built a real-time chat application using Firebase and Firestore, where users log in with Google, eliminating the need for passwords. The app includes a theme mode and integrates the Gemini API for a chatbot.')
            ],
          ),
        )
      ],
    );
  }
}
