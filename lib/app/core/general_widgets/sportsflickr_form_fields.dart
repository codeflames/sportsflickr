import 'package:flutter/material.dart';
import 'package:sportsflickr/app/core/general_widgets/sportsflickr_formatter.dart';
import 'package:sportsflickr/app/core/theme/theme.dart';

class SportsflickrEmailField extends StatelessWidget {
  const SportsflickrEmailField(
      {Key? key, this.labelText, this.validate = true, this.controller})
      : super(key: key);

  final String? labelText;
  final bool validate;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration.copyWith(labelText: labelText ?? 'Email'),
      onChanged: (value) {
        if (value.isNotEmpty) {
          return;
        }
      },
      validator: !validate
          ? null
          : (value) {
              if (value!.isNotEmpty &&
                  SportsflickrFormatter.isEmail(value) == false) {
                return 'Please enter a valid email';
              } else if (value.isEmpty) {
                return 'Please enter an email';
              }
              return null;
            },
    );
  }
}

class SportsflickrTextFormField extends StatelessWidget {
  const SportsflickrTextFormField(
      {Key? key,
      this.labelText,
      this.validatorMessage,
      this.validate = true,
      this.controller,
      this.keyboardType,
      this.maxLine})
      : super(key: key);

  final String? labelText;
  final String? validatorMessage;
  final bool validate;
  final TextInputType? keyboardType;
  final TextEditingController? controller;
  final int? maxLine;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: inputDecoration.copyWith(labelText: labelText ?? 'Email'),
      onChanged: (value) {
        if (value.isNotEmpty) {
          return;
        }
      },
      maxLines: maxLine ?? 1,
      // minLines: 3,
      keyboardType: keyboardType ?? TextInputType.text,
      validator: !validate
          ? null
          : (value) {
              if (value!.isEmpty) {
                return validatorMessage ?? 'Field cannot be empty';
              }
              return null;
            },
    );
  }
}

class SportsflickrPasswordField extends StatefulWidget {
  const SportsflickrPasswordField({
    Key? key,
    this.labelText,
    this.validatorMessage,
    this.controller,
    this.validator,
    this.useSuffixOnly = false,
  }) : super(key: key);

  final String? labelText;
  final String? validatorMessage;
  final String? Function(String?)? validator;

  final TextEditingController? controller;
  final bool useSuffixOnly;

  @override
  State<SportsflickrPasswordField> createState() =>
      _SportsflickrPasswordFieldState();
}

class _SportsflickrPasswordFieldState extends State<SportsflickrPasswordField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ThemeData().colorScheme.copyWith(
              primary: b7BABF,
            ),
      ),
      child: TextFormField(
        controller: widget.controller,
        decoration: inputDecoration.copyWith(
          labelText: widget.labelText ?? 'Password',
          suffixIcon: IconButton(
            focusColor: b7BABF,
            onPressed: () {
              setState(() {
                showPassword = !showPassword;
              });
            },
            icon: Icon(showPassword
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined),
          ),
          suffixIconColor: b7BABF,
        ),
        obscureText: !showPassword,
        onChanged: (value) {
          if (value.isNotEmpty) {
            return;
          }
        },
        validator: (value) {
          if (value!.isEmpty) {
            return widget.validatorMessage ?? 'Please enter a password';
          }
          return null;
        },
      ),
    );
  }
}

class SportsflickrFormSelect extends StatefulWidget {
  SportsflickrFormSelect(
      {Key? key,
      required this.list,
      required this.currentSelectedValue,
      required this.labelText,
      this.controller,
      this.onChanged})
      : super(key: key);

  final List<String>? list;
  final String? labelText;
  String? currentSelectedValue = '';
  TextEditingController? controller;
  final Function(String?)? onChanged;

  @override
  State<SportsflickrFormSelect> createState() => SportsflickrFormSelectState();
}

class SportsflickrFormSelectState extends State<SportsflickrFormSelect> {
  String? currentSelectedValue = '';

  @override
  void initState() {
    super.initState();
    currentSelectedValue = widget.currentSelectedValue;
  }

  @override
  Widget build(BuildContext context) {
    return FormField<String?>(
      // enabled: false,
      initialValue: currentSelectedValue,
      validator: (value) {
        if (!widget.list!.any((element) => element == value)) {
          return 'Please select one of the options';
        } else {
          return null;
        }
      },
      builder: (FormFieldState<String?> state) {
        return InputDecorator(
          decoration: inputDecoration.copyWith(
            label: Text(widget.labelText ?? 'Select'),
            errorBorder: state.hasError
                ? const OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                    ),
                  )
                : null,
            errorText: state.errorText,
          ),
          isEmpty:
              !widget.list!.any((element) => element == currentSelectedValue),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down),
              value: currentSelectedValue,
              isDense: true,
              onChanged: ((value) {
                widget.onChanged != null ? widget.onChanged!(value) : null;
                setState(() {
                  currentSelectedValue = value;
                  widget.currentSelectedValue = currentSelectedValue;
                  widget.controller != null
                      ? widget.controller!.text = currentSelectedValue!
                      : null;
                });
              }),
              items: widget.list!
                  .map((e) => DropdownMenuItem<String>(
                        value: e,
                        child: Text(e),
                      ))
                  .toList(),
            ),
          ),
        );
      },
    );
  }
}
