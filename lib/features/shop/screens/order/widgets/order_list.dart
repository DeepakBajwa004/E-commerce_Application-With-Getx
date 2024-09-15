import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:m_store/common/widgets/custom_shape/containers/m_rounded_container.dart';
import 'package:m_store/utils/constants/colors.dart';
import 'package:m_store/utils/constants/sizes.dart';
import 'package:m_store/utils/helper/helper_function.dart';

class MOrderList extends StatelessWidget {
  const MOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = MHelperFunction.isDarkMode(context);
    return ListView.separated(
      itemCount: 5,
      shrinkWrap: true,
      separatorBuilder: (BuildContext context, int index) { return SizedBox(height: MSize.spaceBtwItems,); },
      itemBuilder: (BuildContext context, int index) {
        return MRoundedContainer(
          showBorder: true,
          padding: EdgeInsets.all(MSize.md),
          backgroundColor: dark ? MColors.dark : MColors.light,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(Iconsax.ship),
                  SizedBox(width: MSize.spaceBtwItems/2,),

                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Processing',
                          style: Theme.of(context).textTheme.bodyLarge!.apply(color: MColors.primary,fontWeightDelta: 1),
                        ),
                        Text('07 July, 2024', style: Theme.of(context).textTheme.headlineSmall,)
                      ],
                    ),
                  ),
                  IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_right_34)),
                ],
              ),

              SizedBox(height: MSize.spaceBtwItems,),

              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: MSize.spaceBtwItems/2,),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order', style: Theme.of(context).textTheme.labelMedium,),
                              Text('[#256f2]', style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: MSize.spaceBtwItems/2,),

                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium,),
                              Text('08 Aug, 2024', style: Theme.of(context).textTheme.titleMedium,)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
