import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:progress_state_button/progress_button.dart';

class CustomProgressBtn extends StatefulWidget {
  const CustomProgressBtn({stateOnlyText, Key? key}) : super(key: key);

  @override
  _CustomProgressBtnState createState() => _CustomProgressBtnState();
}

class _CustomProgressBtnState extends State<CustomProgressBtn> {
  ButtonState stateOnlyText = ButtonState.idle;

  void onPressedCustomButton() {
    setState(() {
      switch (stateOnlyText) {
        case ButtonState.idle:
          stateOnlyText = ButtonState.loading;
          break;
        case ButtonState.loading:
          stateOnlyText = ButtonState.fail;
          break;
        case ButtonState.success:
          stateOnlyText = ButtonState.idle;
          break;
        case ButtonState.fail:
          stateOnlyText = ButtonState.success;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var progressButton = ProgressButton(
      progressIndicator: const CircularProgressIndicator(),
      radius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      stateWidgets: {
        ButtonState.idle: Text(
          "download".tr(),
          style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
              fontWeight: FontWeight.bold),
        ),
        ButtonState.loading: Text(
          "downloading".tr(),
          style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
              fontWeight: FontWeight.bold),
        ),
        ButtonState.fail: Text(
          "fail_download".tr(),
          style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
              fontWeight: FontWeight.bold),
        ),
        ButtonState.success: Text(
          "correct_download".tr(),
          style: TextStyle(
              fontSize: 18,
              color: Theme.of(context).primaryTextTheme.titleLarge!.color,
              fontWeight: FontWeight.bold),
        )
      },
      stateColors: {
        ButtonState.idle: Theme.of(context).indicatorColor,
        ButtonState.loading: Theme.of(context).disabledColor,
        ButtonState.fail: Theme.of(context).errorColor,
        ButtonState.success: Colors.green.shade400,
      },
      progressIndicatorSize: 25,
      onPressed: onPressedCustomButton,
      state: stateOnlyText,
    );
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: progressButton);
  }
}
