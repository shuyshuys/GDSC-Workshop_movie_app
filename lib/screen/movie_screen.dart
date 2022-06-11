import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/data/movie_response.dart';
import 'package:movie_app/screen/detail_movie_screen.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  MovieResponse? _movieResponse;

  @override
  void initState() {
    // TODO: implement initState
    _getMovies();
    super.initState();
  }

  _getMovies() async {
    var dio = Dio();
    final response = await dio.get(
        "https://api.themoviedb.org/3/movie/now_playing?api_key=edab464dd3b3efa76f60fe482ab202e1");

    setState(() {
      _movieResponse = MovieResponse.fromJson(response.data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text("Now Playing",
            style: TextStyle(
                color: Color(0xFF333333), fontWeight: FontWeight.bold)),
      ),
      body: Stack(
        children: [
          ListView.builder(
              itemCount: _movieResponse?.results.length ?? 0,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailMovieScreen(resultMovie: _movieResponse?.results[index],)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8, left: 16, right: 16),
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.network(
                              "https://image.tmdb.org/t/p/w500${_movieResponse?.results[index].posterPath ?? ''}",
                              height: 125,
                            ),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _movieResponse?.results[index].title ?? '',
                                  style: TextStyle(
                                      color: Color(0xFF333333),
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                SizedBox(height: 4),
                                Text(
                                  _movieResponse?.results[index].overview ?? '',
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 3,
                                  style: TextStyle(color: Color(0x99333333)),
                                ),
                                SizedBox(height: 40),
                                Text(_movieResponse?.results[index].releaseDate
                                        .toString()
                                        .substring(0, 10) ??
                                    '',
                                  style: TextStyle(color: Color(0xFF333333)),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ),
                );
              }),
          Visibility(
              visible: _movieResponse == null,
              child: Center(child: CircularProgressIndicator()))
        ],
      ),
    );
  }
}
