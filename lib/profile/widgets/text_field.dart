import 'package:flutter/material.dart';

class DisplayInfo extends StatelessWidget {
  final String text;
  final IconData icon;

   const DisplayInfo({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 45,
        decoration: const BoxDecoration(
          color: Color(0xffE3F0FF),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
          child:   Row(
            children: [
              Icon(icon,size: 25.0,color: Colors.blue,),
              const SizedBox(width: 5.0,),
                Text(
                  text,
                  style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w500),
                  overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}