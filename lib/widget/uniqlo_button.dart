import 'package:flutter/material.dart';

class UniqloButton extends StatelessWidget {
  final Function()? onTap;

  const UniqloButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.symmetric(horizontal: 25),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Image.asset(
              "images/UNIQLOlogo.png",
              width: 10,
              height: 10,
            ),

            Text(
              "UNIQLO",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
