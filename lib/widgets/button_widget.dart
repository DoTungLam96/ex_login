import 'package:ex_widget/ex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.title,
      this.bgColor,
      this.radius,
      this.height,
      this.padding,
      this.margin,
      this.onPress,
      this.isLoading,
      this.width});
  final String title;
  final double? radius, width, height;
  final Color? bgColor;
  final EdgeInsets? padding, margin;
  final Function()? onPress;
  final bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        padding: padding,
        margin: margin,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? 4),
          ),
        ),
        width: width,
        height: height,
        child: isLoading == true
            ? const CircularProgressIndicator(
                color: Colors.blue,
              )
            : Text(title, style: ThemeUtils.textStyle.mediumTextBold),
      ),
    );
  }
}
