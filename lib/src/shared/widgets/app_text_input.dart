import 'package:flutter/material.dart';
import 'package:me_adota/src/shared/styles/theme.dart';

class AppTextInput extends StatefulWidget {
  final String? hintText;
  final void Function(String)? onChanged;

  const AppTextInput({
    super.key,
    this.hintText,
    this.onChanged,
  });

  @override
  State<AppTextInput> createState() => _AppTextInputState();
}

class _AppTextInputState extends State<AppTextInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      if (widget.onChanged != null) {
        widget.onChanged!(_controller.text);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        isDense: true,
        filled: true,
        fillColor: AppTheme.background,
        contentPadding: const EdgeInsets.all(14),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
        ),
        hintStyle: AppTheme.bodySecondaryMedium.copyWith(
          color: const Color.fromARGB(255, 174, 180, 188),
        ),
        hintText: widget.hintText,
      ),
    );
  }
}
