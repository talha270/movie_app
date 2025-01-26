import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
 class Modifiedtext extends StatelessWidget{
   final String text;
   final Color color;
   final double size;
  const Modifiedtext({super.key,required this.text, this.size=15,required this.color});
   @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.breeSerif(color: color,fontSize: size),overflow: TextOverflow.ellipsis);
  }
 }
