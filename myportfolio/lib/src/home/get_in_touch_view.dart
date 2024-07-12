import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myportfolio/constants/constants.dart';
import 'package:myportfolio/resources/resources.dart';
import 'package:myportfolio/utilis/field_validations.dart';
import 'package:myportfolio/utilis/gradient_text.dart';
import 'package:myportfolio/utilis/heights_width.dart';
import 'package:myportfolio/utilis/responsive_widget.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;
import 'package:bot_toast/bot_toast.dart';

class GetInTouchView extends StatefulWidget {
  const GetInTouchView({super.key});

  @override
  State<GetInTouchView> createState() => _GetInTouchViewState();
}

class _GetInTouchViewState extends State<GetInTouchView> {
  TextEditingController nameController = TextEditingController();
  FocusNode nameNode = FocusNode();
  TextEditingController emailController = TextEditingController();
  FocusNode emailNode = FocusNode();
  TextEditingController messageController = TextEditingController();
  FocusNode messageNode = FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  Future sendEmail() async {
    setState(() {
      isLoading = true;
    });

    final url = Uri.parse(R.appUrl.message_service);
    const serviceId = "service_ota6nl2";
    const templateId = "template_exhy96b";
    const userId = "xJj3LFErXvCe-5j94";

    final response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'service_id': serviceId,
          "template_id": templateId,
          "user_id": userId,
          "template_params": {
            "name": nameController.text,
            "message": messageController.text,
            "user_email": emailController.text
          }
        }));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      BotToast.showText(
        text: "Email sent successfully",
      );
      clearFormFields();
    } else {
      BotToast.showText(text: "Failed to send email");
    }

    return response.statusCode;
  }

  void clearFormFields() {
    nameController.clear();
    emailController.clear();
    messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      smallScreen: smallScreen(),
      mediumScreen: mediumScreen(),
      largeScreen: largeScreen(),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      cursorColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.whiteColor
          : R.colors.blackColor,
      style: R.textStyle.poppins(
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          size: ResponsiveWidget.isLargeScreen(context)
              ? 5.sp
              : ResponsiveWidget.isMediumScreen(context)
                  ? 5.sp
                  : 10.sp),
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        return FieldValidation.validateUserName(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: nameController,
      keyboardType: TextInputType.name,
      focusNode: nameNode,
      decoration: R.fieldDecoration.decoration(
          textStyle: R.textStyle.poppins(
              size: ResponsiveWidget.isLargeScreen(context)
                  ? 5.sp
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 5.sp
                      : 10.sp,
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.serviceColor),
          hint: 'Name',
          radius: 10,
          fillcolor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.serviceColor
              : R.colors.whiteColor.withOpacity(.5),
          borderColor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          filled: true),
    );
  }

  Widget emailTextField() {
    return TextFormField(
      cursorColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.whiteColor
          : R.colors.serviceColor,
      style: R.textStyle.poppins(
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          size: ResponsiveWidget.isLargeScreen(context)
              ? 5.sp
              : ResponsiveWidget.isMediumScreen(context)
                  ? 5.sp
                  : 10.sp),
      textInputAction: TextInputAction.next,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        return FieldValidation.validateEmail(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: emailController,
      focusNode: emailNode,
      keyboardType: TextInputType.emailAddress,
      decoration: R.fieldDecoration.decoration(
          textStyle: R.textStyle.poppins(
              size: ResponsiveWidget.isLargeScreen(context)
                  ? 5.sp
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 5.sp
                      : 10.sp,
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.serviceColor),
          hint: 'Email',
          radius: 10,
          fillcolor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.serviceColor
              : R.colors.whiteColor.withOpacity(.5),
          borderColor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          filled: true),
    );
  }

  Widget messageTextField() {
    return TextFormField(
      maxLines: null,
      cursorColor: Constant.themeMode == "ThemeMode.dark"
          ? R.colors.whiteColor
          : R.colors.serviceColor,
      style: R.textStyle.poppins(
          color: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          size: ResponsiveWidget.isLargeScreen(context)
              ? 4.sp
              : ResponsiveWidget.isMediumScreen(context)
                  ? 4.sp
                  : 10.sp),
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.streetAddress,
      onTapOutside: (event) {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      validator: (value) {
        return FieldValidation.validateMessage(value);
      },
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: messageController,
      focusNode: messageNode,
      decoration: R.fieldDecoration.decoration(
          padding: ResponsiveWidget.isLargeScreen(context)
              ? 5.h
              : ResponsiveWidget.isMediumScreen(context)
                  ? 7.h
                  : 3.h,
          textStyle: R.textStyle.poppins(
              size: ResponsiveWidget.isLargeScreen(context)
                  ? 5.sp
                  : ResponsiveWidget.isMediumScreen(context)
                      ? 5.sp
                      : 10.sp,
              color: Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.serviceColor),
          hint: 'Message',
          radius: 10,
          fillcolor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.serviceColor
              : R.colors.whiteColor.withOpacity(.5),
          borderColor: Constant.themeMode == "ThemeMode.dark"
              ? R.colors.whiteColor
              : R.colors.serviceColor,
          filled: true),
    );
  }

  Widget aboutText(String title) {
    return RichText(
        textAlign: TextAlign.start,
        text: TextSpan(children: [
          TextSpan(
              text: title,
              style: R.textStyle.poppins(
                  weight: FontWeight.bold,
                  color: Constant.themeMode == "ThemeMode.dark"
                      ? R.colors.whiteColor
                      : R.colors.serviceColor,
                  size: ResponsiveWidget.isLargeScreen(context)
                      ? 5.sp
                      : ResponsiveWidget.isMediumScreen(context)
                          ? 5.sp
                          : 10.sp))
        ]));
  }

  Widget getInButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState?.validate() ?? false) {
          sendEmail();
        }
      },
      child: Container(
        height: ResponsiveWidget.isLargeScreen(context)
            ? 7.h
            : ResponsiveWidget.isMediumScreen(context)
                ? 7.h
                : 5.h,
        decoration: BoxDecoration(
            color: Constant.themeMode == "ThemeMode.dark"
                ? R.colors.whiteColor
                : R.colors.serviceColor,
            borderRadius: BorderRadius.circular(12)),
        child: Center(
          child: isLoading
              ? CircularProgressIndicator(
                  strokeWidth: 1,
                  color: R.colors.textColor,
                )
              : Text(
                  'Get In Touch',
                  style: R.textStyle.poppins(
                      color: Constant.themeMode == "ThemeMode.dark"
                          ? R.colors.blackColor
                          : R.colors.whiteColor,
                      size: ResponsiveWidget.isLargeScreen(context)
                          ? 5.sp
                          : ResponsiveWidget.isMediumScreen(context)
                              ? 5.sp
                              : 8.sp,
                      weight: FontWeight.w400),
                ),
        ),
      ),
    );
  }

  Widget largeScreen() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.whiteColor
                    : R.colors.blackColor,
                size: 17.sp,
                weight: FontWeight.bold),
          ),
          GradientText(
            text: "Let's Work Together",
            style: R.textStyle.poppins(size: 6.sp),
            gradient: LinearGradient(colors: [
              R.colors.textColor,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor
            ]),
          ),
          h5,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 35.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aboutText('Name'),
                h1,
                nameTextField(),
                h1,
                aboutText('Email'),
                h1,
                emailTextField(),
                h1,
                aboutText('Message'),
                h1,
                messageTextField(),
                h1,
                getInButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget smallScreen() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.whiteColor
                    : R.colors.blackColor,
                size: 20.sp,
                weight: FontWeight.bold),
          ),
          GradientText(
            text: "Let's Work Together",
            style: R.textStyle.poppins(size: 8.sp),
            gradient: LinearGradient(colors: [
              R.colors.textColor,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor
            ]),
          ),
          h5,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aboutText('Name'),
                h1,
                nameTextField(),
                h1,
                aboutText('Email'),
                h1,
                emailTextField(),
                h1,
                aboutText('Message'),
                h1,
                messageTextField(),
                h1,
                getInButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget mediumScreen() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Text(
            'Get In Touch',
            style: R.textStyle.poppins(
                color: Constant.themeMode == "ThemeMode.dark"
                    ? R.colors.whiteColor
                    : R.colors.blackColor,
                size: 17.sp,
                weight: FontWeight.bold),
          ),
          GradientText(
            text: "Let's Work Together",
            style: R.textStyle.poppins(size: 6.sp),
            gradient: LinearGradient(colors: [
              R.colors.textColor,
              Constant.themeMode == "ThemeMode.dark"
                  ? R.colors.whiteColor
                  : R.colors.blackColor
            ]),
          ),
          h5,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                aboutText('Name'),
                h1,
                nameTextField(),
                h1,
                aboutText('Email'),
                h1,
                emailTextField(),
                h1,
                aboutText('Message'),
                h1,
                messageTextField(),
                h1,
                getInButton()
              ],
            ),
          )
        ],
      ),
    );
  }
}
