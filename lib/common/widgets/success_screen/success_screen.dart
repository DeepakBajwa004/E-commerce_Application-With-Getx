import 'package:flutter/material.dart';
import 'package:m_store/common/styles/spacing_style.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helper/helper_function.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subtitle, required this.onPressed,});

  final String image , title , subtitle ;
  final VoidCallback  onPressed;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: MSpacingStyle.paddingWithAppBarHeight*2,
          child: Column(
            children: [
              Image(image:  AssetImage(image),width: MHelperFunction.screenWidth()*0.6,),

              const SizedBox(height: MSize.spaceBtwSections,),


              /*-----<<< Title & SubTitle >>>-----*/
              Text(title,style: Theme.of(context).textTheme.headlineMedium,textAlign: TextAlign.center,),

              const SizedBox(height: MSize.spaceBtwSections,),
              Text(subtitle,style: Theme.of(context).textTheme.labelMedium,textAlign: TextAlign.center,),

              const SizedBox(height: MSize.spaceBtwSections,),
              SizedBox(width: double.infinity,child: ElevatedButton( onPressed: onPressed ,child: const Text(MTexts.mContinue),),),

            ],
          ),
        ),
      ),
    );
  }
}
