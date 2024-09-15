import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class MSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
      top: MSize.appBarHeight,
      left: MSize.defaultSpace,
      bottom: MSize.defaultSpace,
      right: MSize.defaultSpace
  );
}