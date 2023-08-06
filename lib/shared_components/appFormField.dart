import 'package:flutter/material.dart';

class AppFormField extends StatefulWidget {
  Icon? icon;

  String? hint;
  bool isHiddeField;
  TextInputType inputType;
  AppFormField(
      {this.icon,
      this.hint,
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
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primaryContainer,
          borderRadius: BorderRadius.all(Radius.circular(25.0))),
      child: TextFormField(
          style: TextStyle(color: Theme.of(context).colorScheme.primary),
          keyboardType: widget.inputType,
          obscureText: _hideText,
          decoration: InputDecoration(
              prefixIconColor: Theme.of(context).colorScheme.primary,
              suffixIconColor: Theme.of(context).colorScheme.primary,
              prefixIcon: widget.icon,
              suffixIcon: widget.isHiddeField
                  ? IconButton(
                      onPressed: () => setState(() {
                            _hideText = !_hideText;
                          }),
                      icon: Icon(
                          _hideText ? Icons.visibility : Icons.visibility_off))
                  : null,
              hintText: widget.hint ?? "",
              border: InputBorder.none
              // enabledBorder:
              //     this._buildBorders(widget.borderColor ?? Colors.indigo),
              // focusedBorder: this._buildBorders(Colors.teal),
              // errorBorder: this._buildBorders(Colors.red),
              // disabledBorder: this._buildBorders(Colors.grey),
              // border: this._buildBorders(widget.borderColor ?? Colors.indigo)
              )),
    );
  }

  OutlineInputBorder _buildBorders(Color color) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(25.0)),
    );
  }
}
