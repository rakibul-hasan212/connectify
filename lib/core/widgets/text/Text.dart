import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  final TextStyle style;

  //final TextAlign? align;

  const MyText({
    super.key,
    required this.text,
    required this.style,
    //this.align
  });

  // TitleText
  factory MyText.titleText(String text,
      {
        Color textcolor = Colors.black87,
        double size = 28,
        FontWeight fontWeightValue = FontWeight.bold}) {
    return MyText(
      text: text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeightValue,
        color: textcolor,
      ),
      //align: align
    );
  }

  // SectionTitleText
  factory MyText.sectionText(String text,
      {
        Color textColor = Colors.black87,
        double size = 20,
        FontWeight fontWeightValue = FontWeight.bold}) {
    return MyText(
      text: text,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeightValue,
        color: textColor,
      ),
    );
  }

  // BodyText
  factory MyText.bodyText(String text,
      {Color textColor = Colors.grey, double size = 16}) {
    return MyText(
      text: text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }

  // CaptionText
  factory MyText.captionText(String text,
      {Color textColor = Colors.grey, double size = 12}) {
    return MyText(
      text: text,
      style: TextStyle(
        fontSize: size,
        color: textColor,
      ),
    );
  }

  //ButtonText
  factory MyText.buttonText(String text,
      {Color textColor = Colors.black,
        double size = 16,
        FontWeight fontWeightValue = FontWeight.w600}) {
    return MyText(
        text: text,
        style: TextStyle(
            color: textColor, fontSize: size, fontWeight: fontWeightValue));
  }

  @override
  Widget build(BuildContext context) {
    return Text(text, style: style);
  }
}
