import 'package:flutter/material.dart';

class Rating extends StatelessWidget {
  const Rating({super.key, this.size=13});
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star,color: Colors.orange,size: size,),
        Icon(Icons.star,color: Colors.orange,size: size,),
        Icon(Icons.star,color: Colors.orange,size: size,),
        Icon(Icons.star,color: Colors.orange,size: size,),
        Icon(Icons.star,color: Colors.orange,size: size,),
      ],
    );
  }
}
