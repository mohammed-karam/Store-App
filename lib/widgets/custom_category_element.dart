import 'package:flutter/material.dart';

class CustomCategoryElement extends StatelessWidget {
  const CustomCategoryElement({super.key, required this.title});

  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 180,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 50,
            color: Colors.grey.withValues(alpha: 0.2),
            offset: Offset(10, 10),
            spreadRadius: 0,
          ),
        ],
      ),

      child: Card(
        color: Colors.white,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image.network(src),
              Text(
                title ?? "no title",
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                style: TextStyle(color: Colors.blue, fontSize: 16),
              ),

              // SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
