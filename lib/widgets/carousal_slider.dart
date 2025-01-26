import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movieapp/widgets/description_screen.dart';

class CarousalSliderpackage extends StatefulWidget{
  final List trending;

  const CarousalSliderpackage({super.key,required this.trending});
  @override
  State<CarousalSliderpackage> createState()=>CarousalSliderstate();
}
class CarousalSliderstate extends State<CarousalSliderpackage>{
  @override
  Widget build(BuildContext context) {
    return widget.trending.isEmpty?const Center(child: Text("Loading"),):CarouselSlider.builder(
        itemCount: widget.trending.length,
        itemBuilder: (context, index, realIndex) {
          return  InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>   DescriptionScreen(movie: widget.trending[index])));
            },
            child: Container(
                  // height: MediaQuery.sizeOf(context).height/2,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500"+ widget.trending[index]["poster_path"]),fit: BoxFit.cover,),
                      borderRadius: BorderRadius.circular(20)
                  ),
                ),
          );
        },
        options: CarouselOptions(
          autoPlay: true,
          height: MediaQuery.sizeOf(context).height/2.2,
          aspectRatio: 16/12,
          viewportFraction: 0.60,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 2),
          enlargeCenterPage: true,
          pageSnapping: true
        ));
  }
}
