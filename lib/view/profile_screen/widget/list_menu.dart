import 'package:flutter/material.dart';

import '../../../utility/app_color.dart';

class ListMenu extends StatelessWidget {
  const ListMenu({super.key, required this.onClick, required this.name, required this.icon});
  final VoidCallback onClick;
  final String name;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:onClick,
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon,color: Colors.grey,),
      title: Text(name,style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color:AppColors.textBlack ),
      ),
      trailing: Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 20,),
    );
  }
}
