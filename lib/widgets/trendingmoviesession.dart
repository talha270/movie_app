import 'package:flutter/material.dart';
import'package:cached_network_image/cached_network_image.dart';
import 'package:movieapp/widgets/description_screen.dart';
import 'package:movieapp/widgets/text.dart';

class Trendingmoviesession extends StatelessWidget{
  const Trendingmoviesession({super.key,required this.trending,required this.subtitle,required this.title});
  final List  trending;
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 362,
      height: MediaQuery.sizeOf(context).height/2.1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            child: Modifiedtext(text:title,color: Colors.white,size: 24,),
          ),
          SizedBox(height: 3,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: trending.length,
              itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionScreen(movie: trending[index]),));
                },
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Container(
                    // margin:EdgeInsets.all(5)
                    // width: 170,
                    width:  MediaQuery.sizeOf(context).width/2.6,
                    child: Column(
                      children: [
                        Container(
                          // height: 250,
                          height: MediaQuery.sizeOf(context).height/3.3,
                          decoration: BoxDecoration(
                            image: DecorationImage(image: NetworkImage("https://image.tmdb.org/t/p/w500"+ trending[index]["poster_path"]),fit: BoxFit.cover,),
                            borderRadius: BorderRadius.circular(20)
                          ),
                        ),
                        SizedBox(height: 3,),
                        SizedBox(
                          // height: 50,
                          child: Modifiedtext(text: trending[index][subtitle]!=null?trending[index][subtitle]:"loading",color: Colors.white,),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },),
          ),

        ],
      ),
    );
  }
}
