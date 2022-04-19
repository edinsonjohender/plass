import 'package:flutter/material.dart';

class TextFieldEd extends StatelessWidget {
  final TextEditingController controller;
  final String  title;
  final String  labelText;
  final dynamic titleStyle;
  final dynamic textStyle;
  final dynamic background;
  final bool required;
  final bool obscureText;
  final String hintText;

  const TextFieldEd({ 
    Key? key,
    required this.controller ,
    this.hintText     = '',
    this.title        = '',
    this.labelText    = '',
    this.textStyle    = Colors.black,
    this.titleStyle   = Colors.black,
    this.background   = Colors.white60,
    this.required     = false,
    this.obscureText  = false,

  }) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(title != '')
        Container(
          margin: const EdgeInsets.only(top: 15),
          child: Text(title, style:  TextStyle(color: titleStyle) )
        ),
        Container(
          margin: EdgeInsets.only(top: title == '' ? 10 : 7),
          child: TextFormField(
            obscureText: obscureText,
            controller: controller,
            decoration:  InputDecoration(fillColor: background, labelText: labelText, hintText: hintText),
            // ignore: body_might_complete_normally_nullable
            validator: (value){ if(required){if (value!.isEmpty) return 'Ingresa información valida';}},
            style: TextStyle(color: textStyle), 
            onEditingComplete: () => node.nextFocus(),
          )
        )
      ]
    );
  }
}

