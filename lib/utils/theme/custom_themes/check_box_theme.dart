import 'package:flutter/material.dart';

class MCheckBoxTheme{
  MCheckBoxTheme._();
//s  S
  static CheckboxThemeData lightCheckBoxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateColor.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else {
        return Colors.black;
      }
    }
    ),
    fillColor: WidgetStateColor.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }else {
        return Colors.transparent;
      }
    }
    ),
  );

  static CheckboxThemeData darkCheckBoxTheme=CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateColor.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.white;
      }else {
        return Colors.black;
      }
    }
    ),
    fillColor: WidgetStateColor.resolveWith((states){
      if(states.contains(WidgetState.selected)){
        return Colors.blue;
      }else {
        return Colors.transparent;
      }
    }
    ),
  );


}