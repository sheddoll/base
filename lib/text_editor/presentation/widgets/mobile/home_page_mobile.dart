import 'package:flutter/material.dart';

class BaseMobileContainer extends StatelessWidget {
  const BaseMobileContainer({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 40,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),

      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Название заметки'),
          Icon(Icons.remove_red_eye)
        ],
      )
    );
  }
}

class RecentlyMobileContainer extends StatelessWidget {
  const RecentlyMobileContainer({super.key,});
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16,vertical: 5),
      padding: const EdgeInsets.all(10),
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
        border: Border.all(color: Colors.black)
      ),

      child: const Center(
        child: Text('Название заметки'),
      ),
    );
  }
}