import 'package:flutter/material.dart';
import 'package:test_repo_example/common/styles/app_colors.dart';

class ElevatedInputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final int? maxLines;
  final int? minLines;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;
  final String? initialValue;
  final InputDecoration? decoration;

  final bool bordered;

  const ElevatedInputField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.keyboardType,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.maxLines = 1,
    this.minLines,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
    this.initialValue,
    this.decoration,
    this.bordered = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bordered
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: CustomAppColors.gray1.withValues(alpha: 0.08),
                  offset: const Offset(0, 2),
                  blurRadius: 8,
                  spreadRadius: 0,
                ),
                BoxShadow(
                  color: CustomAppColors.gray1.withValues(alpha: 0.04),
                  offset: const Offset(0, 1),
                  blurRadius: 2,
                  spreadRadius: 0,
                ),
              ],
            ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        onChanged: onChanged,
        onFieldSubmitted: onSubmitted,
        enabled: enabled,
        maxLines: maxLines,
        minLines: minLines,
        textInputAction: textInputAction,
        focusNode: focusNode,
        autofocus: autofocus,
        initialValue: initialValue,
        style: const TextStyle(
          fontFamily: 'Figtree',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: CustomAppColors.gray1,
        ),
        decoration:
            decoration ??
            InputDecoration(
              labelText: labelText,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
            ),
      ),
    );
  }
}

class ElevatedPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;

  const ElevatedPasswordField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  State<ElevatedPasswordField> createState() => _ElevatedPasswordFieldState();
}

class _ElevatedPasswordFieldState extends State<ElevatedPasswordField> {
  bool _obscureText = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedInputField(
      controller: widget.controller,
      labelText: widget.labelText ?? 'PASSWORD',
      hintText:
          widget.hintText ?? '\u2022\u2022\u2022\u2022\u2022\u2022\u2022\u2022',
      prefixIcon: const Icon(Icons.lock_outlined),
      suffixIcon: IconButton(
        icon: Icon(
          _obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
        ),
        onPressed: _toggleVisibility,
      ),
      obscureText: _obscureText,
      keyboardType: TextInputType.visiblePassword,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
      enabled: widget.enabled,
      textInputAction: widget.textInputAction,
      focusNode: widget.focusNode,
      autofocus: widget.autofocus,
    );
  }
}

class ElevatedEmailField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final bool enabled;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool autofocus;

  const ElevatedEmailField({
    super.key,
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.enabled = true,
    this.textInputAction,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedInputField(
      controller: controller,
      hintText: hintText ?? 'email@companyname.com',
      prefixIcon: const Icon(Icons.email_outlined),
      keyboardType: TextInputType.emailAddress,
      validator: validator,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      enabled: enabled,
      textInputAction: textInputAction,
      focusNode: focusNode,
      autofocus: autofocus,
    );
  }
}

class ElevatedSearchField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final VoidCallback? onClear;
  final bool showClearButton;
  final FocusNode? focusNode;
  final bool autofocus;

  const ElevatedSearchField({
    super.key,
    this.controller,
    this.hintText,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.showClearButton = true,
    this.focusNode,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedInputField(
      controller: controller,
      hintText: hintText ?? 'Search...',
      prefixIcon: const Icon(Icons.search),
      suffixIcon:
          showClearButton && controller?.text.isNotEmpty == true
              ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  controller?.clear();
                  onClear?.call();
                },
              )
              : null,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      focusNode: focusNode,
      autofocus: autofocus,
      decoration: InputDecoration(
        hintText: hintText ?? 'Search...',
        prefixIcon: const Icon(Icons.search),
        filled: true,
        fillColor: CustomAppColors.gray6,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
