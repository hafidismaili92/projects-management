import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  Icon? icon;
  String? Function(String?)? validator;
  String? hint;
  Function? onChange;
  bool isHiddeField;
  TextInputType inputType;

  AppFormField(
      {this.icon,
      this.hint,
      this.validator,
      this.onChange,
      this.inputType = TextInputType.text,
      this.isHiddeField = false});

  @override
  State<AppFormField> createState() => _AppFormFieldState();
}

class _AppFormFieldState extends State<AppFormField> {
  bool _hideText = false;

  @override
  void initState() {
    // TODO: implement initState
    _hideText = widget.isHiddeField;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        validator: widget.validator ?? (val) => null,
        style: TextStyle(color: Theme.of(context).colorScheme.primary),
        keyboardType: widget.inputType,
        obscureText: _hideText,
        onChanged: (value) {
          widget.onChange?.call(value);
        },
        decoration: InputDecoration(
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          filled: true,
          prefixIconColor: Theme.of(context).colorScheme.primary,
          suffixIconColor: Theme.of(context).colorScheme.primary,
          prefixIcon: widget.icon,
          suffixIcon: widget.isHiddeField
              ? IconButton(
                  onPressed: () => setState(() {
                        _hideText = !_hideText;
                      }),
                  icon:
                      Icon(_hideText ? Icons.visibility : Icons.visibility_off))
              : null,
          hintText: widget.hint ?? "",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          ),
          // enabledBorder: this._buildBorders(Colors.indigo),
          //focusedBorder: this._buildBorders(Theme.of(context).colorScheme.primary),

          //errorBorder: this._buildBorders(Colors.red),
          // disabledBorder: this._buildBorders(Colors.grey),
          // border: this._buildBorders(Colors.indigo))),
        ));
  }

  OutlineInputBorder _buildBorders(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    );
  }
}
