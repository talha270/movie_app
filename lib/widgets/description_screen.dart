import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/widgets/text.dart';

class DescriptionScreen extends StatefulWidget{
  final Map movie;

  const DescriptionScreen({super.key,required this.movie});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen> {
  @override
  void initState() {
    super.initState();
    print(widget.movie);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:RichText(text: TextSpan(
            children: [
              TextSpan(text: "Movies",style:GoogleFonts.breeSerif(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
              TextSpan(text: "  Master",style:GoogleFonts.breeSerif(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
            ]
        )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Container(),
            expandedHeight: MediaQuery.sizeOf(context).height*0.65,
            pinned: true,
            floating: true,
            actions: [
              widget.movie["video"]!=null? widget.movie["video"]==true?IconButton(onPressed: (){}, icon: Icon(Icons.play_circle_outline_outlined)):Icon(Icons.play_disabled_sharp,color:Colors.red)
                  : Icon(Icons.play_disabled_sharp,color:Colors.red),
            ],
            actionsIconTheme: IconThemeData(
              color: Colors.green,
              size: 50
            ),
            flexibleSpace: FlexibleSpaceBar(
              // title: Text("Description"),
              background: Image.network(fit: BoxFit.cover,"https://image.tmdb.org/t/p/w500"+widget.movie["poster_path"]),
            )),
          SliverList(delegate: SliverChildListDelegate([
          Container(
            margin: EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Modifiedtext(text: widget.movie["title"]==null?widget.movie["original_name"]:widget.movie["title"], color: Colors.white,size: 30,),
                Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text("425 views"),
                ),
                Modifiedtext(text:"Overview:", color: Colors.white,size: 20,),
                Text(widget.movie["overview"])
              ],
            ),
          )
          ]))
        ],
      ),
    );
  }
}
