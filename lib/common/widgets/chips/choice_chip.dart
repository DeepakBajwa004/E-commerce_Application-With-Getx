import 'package:flutter/material.dart';
import 'package:m_store/common/widgets/custom_shape/containers/circular_container.dart';
import 'package:m_store/utils/helper/helper_function.dart';
import '../../../utils/constants/colors.dart';

class MChoiceChip extends StatelessWidget {
  const MChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColor = MHelperFunction.getColor(text) != null;
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() :  Text(text),
        selected: selected,
        onSelected:onSelected,
        labelStyle: TextStyle(color: selected ? MColors.white : null),
        avatar: isColor
         ? MCircularContainer(width: 50, height: 50, backgroundColor: MHelperFunction.getColor(text)!)
         : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor?  MHelperFunction.getColor(text)!: null ,
        padding: isColor ?  EdgeInsets.zero : null,
        selectedColor: isColor ?  Colors.green : null,
        labelPadding: isColor ?  EdgeInsets.zero : null,
      ),
    );
  }
}
