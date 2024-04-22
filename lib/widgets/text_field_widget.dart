import 'package:ex_widget/ex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key, this.textEditingController, this.hintText});
  final TextEditingController? textEditingController;
  final String? hintText;
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(color: IBColors.black30),
        hintText: widget.hintText ?? "Type in your text",
      ),
      controller: widget.textEditingController,
    );
  }
}
