import 'package:first_try_signup/Style/Douaa-Style/colors.dart';
import 'package:flutter/material.dart';


const backColor = BoxDecoration(
  gradient: RadialGradient(
    colors: BackgroundColors ,
    stops: [0.0, 1.0],
    radius: 2.0,
    center: Alignment.center
  )
);



const midTitles = TextStyle(
  color: midTitlesColor,
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

const smallTitles = TextStyle(
  color: smallTitlesColor,
  fontSize: 15,
  fontWeight: FontWeight.bold,
);

const yellowTitles=TextStyle(
  color: yellow,
  fontSize: 26,
  fontWeight: FontWeight.bold,
);