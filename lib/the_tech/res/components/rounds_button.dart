import 'package:flutter/material.dart';
import 'package:np/the_tech/res/components/color.dart';

class RoundsButton extends StatelessWidget {
  final String title;
  final bool loading;
  final VoidCallback onPress;
  const RoundsButton(
      {super.key,
      required this.title,
      this.loading = false,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.blackColor),
        height: 50,
        width: 400,
        child: Center(
          child: loading
              ? CircularProgressIndicator()
              : Text(
                  title,
                  style: TextStyle(color: AppColor.whiteColor, fontSize: 18),
                ),
        ),
      ),
    );
  }
}
