import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helper/helper_function.dart';
import '../../custom_shape/containers/m_rounded_container.dart';

class MCouponCode extends StatelessWidget {
  const MCouponCode({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return MRoundedContainer(
      showBorder: true,
      backgroundColor: dark ? MColors.dark : MColors.white  ,
      padding: EdgeInsets.only(top: MSize.sm,left: MSize.md, bottom: MSize.sm ,right: MSize.sm),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: InputDecoration(
                hintText: 'Have a promo code? Enter here ',
                focusedBorder: InputBorder.none ,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          //Button
          SizedBox(
              width: 70 ,
              child: ElevatedButton(
                onPressed: (){},
                child: Text('Apply '),
                style: ElevatedButton.styleFrom(
                    foregroundColor: dark? MColors.white.withOpacity(0.6) : MColors.dark.withOpacity(0.5),
                    backgroundColor: MColors.grey.withOpacity(0.2),
                    side: BorderSide(color: MColors.grey.withOpacity(0.1))
                ),
              ),
          ),
        ],
      ),

    );
  }
}
