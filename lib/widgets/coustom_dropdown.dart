import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../utility/app_color.dart';

class CustomDropDown<T> extends StatelessWidget {
  CustomDropDown({super.key,
    required this.items,
    this.value,
    required this.hint,
    required this.onChange,
    this.selectedItemBuilder
  });

  final List<T> items;
  final T? value;
  final String hint;
  final ValueChanged<T?>onChange;
  final DropdownButtonBuilder? selectedItemBuilder;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<T>(

      isExpanded: true,
      decoration: InputDecoration(
          fillColor: AppColors.filleColor,
          filled: true,
          contentPadding:EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          )
      ),

      items:items.map((item) => DropdownMenuItem<T>(
        value: item,
        child: Text(item.toString(),style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: AppColors.textBlack,
        ),),
      )).toList(),

      value: value,
      hint: Text(hint, style:const TextStyle(fontSize: 14,fontWeight:FontWeight.w600,color: AppColors.textBlack,),),
      onChanged: onChange,
      selectedItemBuilder: selectedItemBuilder,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.keyboard_arrow_down,
          color: AppColors.textBlack,
        ),
        iconSize: 30,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),


    );
  }
}
