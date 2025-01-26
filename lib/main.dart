
import'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/widgets/carousal_slider.dart';
import 'package:movieapp/widgets/text.dart';
import 'package:movieapp/widgets/trendingmoviesession.dart';
import 'package:tmdb_api/tmdb_api.dart';
void main()=>runApp(const Movieapp());

class Movieapp extends StatelessWidget{
  const Movieapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movie app",
      theme: ThemeData(
        // primarySwatch: Colors.red,
        brightness: Brightness.dark,
        primaryColor: Colors.red
      ),
      debugShowCheckedModeBanner: false,
      home:const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List trendingmovies=[];
  List topratedmovies=[];
  List upcomingmovies=[];
  List tvseries=[];
  String apikey="8130d902e45791bc938dcee32e82a547";
  String accesstoken="eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4MTMwZDkwMmU0NTc5MWJjOTM4ZGNlZTMyZTgyYTU0NyIsIm5iZiI6MTcyNDgyNzM4NS41NDQ2ODIsInN1YiI6IjY2Y2UxMzQ0ZjAwZDI1MjY3ZDYzYTcwMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9vPtCR3iD8OnHXpB220bJK6C4xvFzVb9a2_qz5fD-uI";
  loadmovies()async{
  TMDB tmdbwithcustomlogs=TMDB(ApiKeys(apikey, accesstoken),
  logConfig: const ConfigLogger(showErrorLogs: true,showLogs: true),);

  Map videoresult=await tmdbwithcustomlogs.v3.movies.getVideos(278);
  Map trendingresult=await tmdbwithcustomlogs.v3.trending.getTrending();
  Map upcomingresult=await tmdbwithcustomlogs.v3.movies.getUpcoming();
  Map topratedresult=await tmdbwithcustomlogs.v3.movies.getTopRated();
  Map tvseriesresult =await tmdbwithcustomlogs.v3.tv.getPopular();
  // print(trendingresult);
  setState(() {
  trendingmovies=trendingresult["results"];
  upcomingmovies=upcomingresult["results"];
  topratedmovies=topratedresult["results"];
  tvseries=tvseriesresult["results"];
  });
  print(videoresult);
  }

  @override
  void initState() {
    super.initState();
    loadmovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 5,
        title:RichText(text: TextSpan(
            children: [
              TextSpan(text: "Movies",style:GoogleFonts.breeSerif(fontSize: 28,color: Colors.white,fontWeight: FontWeight.bold),),
              TextSpan(text: "  Master",style:GoogleFonts.breeSerif(fontSize: 15,color: Colors.red,fontWeight: FontWeight.bold),),
            ]
        )),
      ),
      body:
      Container(
        margin: const EdgeInsets.all(5),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 5,),
              const Modifiedtext(text: "Trending Movies", color: Colors.white,size: 24,),
              const SizedBox(height: 10,),
              CarousalSliderpackage(trending: trendingmovies,),
              Trendingmoviesession(title:"Top Rated Movies",trending:topratedmovies,subtitle: "title",),
              Trendingmoviesession(title:"Popular TV Shows Series",trending:tvseries,subtitle: "original_name",),
              Trendingmoviesession(title:"Upcoming Movies",trending:upcomingmovies,subtitle: "original_title",),
            ],
          ),
        ),
      ),
    );
  }
}
