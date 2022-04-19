import 'package:flutter/material.dart';

//// Boton principal de la aplicacion con funciones practicas para su uso.
class EdButton extends StatelessWidget {

  final double?         width;
  final String          text;
  final VoidCallback?   onTap;
  final Color           textColor;
  final Color?          bgColor;
  final Color?          splashColor;
  final double          borderRadius;
  final double?         height;
  final double?         padding;
  final IconData?       leadingIcon;
  final IconData?       trailingIcon;
  final IconData?       onlyIcon;
  final bool            isLoader;
  final MainAxisAlignment mainAxisAlignment;
    
  const EdButton( {
    Key? key,
    this.onTap,
    this.text             = '',
    this.textColor        = Colors.black,
    this.bgColor          = Colors.transparent,
    this.splashColor      = Colors.transparent,
    this.borderRadius     = 0.0,
    this.padding          = 15.0,
    this.height           = 50.0,
    this.width            = 100.0,
    this.isLoader         = false,
    this.leadingIcon,
    this.trailingIcon,
    this.onlyIcon,
    this.mainAxisAlignment = MainAxisAlignment.center
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: splashColor,
      child: Container(
        height    : height,
        width     : width,
        padding   : EdgeInsets.all(padding!),
        decoration: BoxDecoration(
          color         : bgColor,
          borderRadius  : BorderRadius.circular(borderRadius),
        ),
        child: isLoader
        ? Center(child: CircularProgressIndicator(color: textColor))
        : onlyIcon == null 
          ? Row(
            mainAxisAlignment: mainAxisAlignment,
            children: [
              if(leadingIcon != null)
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: Icon(leadingIcon, color: textColor)
              ),
              Text(text, style: TextStyle(color: textColor)),
              if(trailingIcon != null)
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: Icon(trailingIcon, color: textColor)
              )
            ]
          )
          : Icon(onlyIcon, color: textColor)
      ),
      onTap: onTap
    );
  }
}