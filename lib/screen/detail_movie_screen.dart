import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/movie_response.dart';

class DetailMovieScreen extends StatelessWidget {
  final ResultMovie? resultMovie;

  const DetailMovieScreen({Key? key, required this.resultMovie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Detail Movie",
            style: TextStyle(
                color: Color(0xFF333333), fontWeight: FontWeight.bold)),
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close_rounded,
            color: Color(0xFF333333),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            "https://image.tmdb.org/t/p/w500${resultMovie?.backdropPath ?? ''}",
            height: 250,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              resultMovie?.title ?? '',
              style: TextStyle(
                  color: Color(0xFF333333),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              resultMovie?.overview ?? '',
              style: TextStyle(color: Color(0x99333333), fontSize: 16),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
