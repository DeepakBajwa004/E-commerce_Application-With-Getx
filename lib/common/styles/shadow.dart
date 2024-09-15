import 'package:flutter/cupertino.dart';

import '../../utils/constants/colors.dart';

class MShadowStyle{
  static final verticalBoxShadow=BoxShadow(
    color: MColors.darkerGrey.withOpacity(0.3),
    blurRadius: 5,
    spreadRadius:2,
    offset:const Offset(0,2),
  );
  static final horizontalBoxShadow=BoxShadow(
    color: MColors.darkGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius:7,
    offset:const Offset(0,2),
  );
}