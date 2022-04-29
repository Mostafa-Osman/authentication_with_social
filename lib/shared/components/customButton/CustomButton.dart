import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String tittle;
  final VoidCallback onPress;
  final bool isLoading;
  final bool isLoadingDone;
  final bool? text;
  final Color? backgroundColor;
  final Color? textColor;
  final double? width;
  final double? height;
  final double? textSize;
  final FontWeight? fontWeight;

  const CustomButton(
  {Key? key,
    required this.tittle,
    required this.onPress,
    this.isLoading = false,
    this.isLoadingDone = false,
    this.height = 50.0,
    this.width = double.infinity,
    this.text = true,
    this.textColor,
    this.backgroundColor = const Color(0xFFA01B22),
    this.textSize,
    this.fontWeight,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: (isLoading||isLoadingDone)
          ? SmallButton(
              isLoadingDone: isLoadingDone,
            )
          : OutlinedButton(
              style: OutlinedButton.styleFrom(
                // shape: const StadiumBorder(),
                backgroundColor: backgroundColor,
              ),
              onPressed: onPress,
              child: Text(
                tittle,
                style: TextStyle(
                    fontSize: textSize,
                    color: textColor,
                    fontWeight: fontWeight),
              ),
            ),
    );
  }
}

class SmallButton extends StatelessWidget {
  final bool isLoadingDone;

  const SmallButton({Key? key, this.isLoadingDone = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60.0,
      height: 60.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isLoadingDone ? Colors.green : const Color(0xFFA01B22),
      ),
      child: Center(
        child: isLoadingDone
            ? const Icon(Icons.done, size: 50.0, color: Colors.white //color,
                )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
