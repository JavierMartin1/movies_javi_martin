import 'dart:convert';
import 'package:movies/api/api.dart';
import 'package:movies/models/actor.dart';
import 'package:movies/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/review.dart';

class ApiService {
  static Future<List<Movie>?> getTopRatedMovies() async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}movie/top_rated?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(6).take(5).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Movie>?> getCustomMovies(String url) async {
    List<Movie> movies = [];
    try {
      http.Response response =
          await http.get(Uri.parse('${Api.baseUrl}movie/$url'));
      var res = jsonDecode(response.body);
      res['results'].take(6).forEach(
            (m) => movies.add(
              Movie.fromMap(m),
            ),
          );
      return movies;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getSearchedActors(String query) async {
    List<Actor> actors = [];
    List<Actor> actorsInfo = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/search/person?api_key=${Api.apiKey}&language=en-US&query=$query&page=1&include_adult=false'));
      var res = jsonDecode(response.body);
      res['results'].take(20).forEach(
        (m) => actors.add(
          Actor.fromMap(m),
        ),
      );
      for (var actor in actors) {
        try{
          Actor? actorInfo = await getActorById(actor.id.toString());
          actorsInfo.add(actorInfo!);
        }
        catch(e) {}
      }
      return actorsInfo;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Review>?> getMovieReviews(int movieId) async {
    List<Review> reviews = [];
    try {
      http.Response response = await http.get(Uri.parse(
          'https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].forEach(
        (r) {
          reviews.add(
            Review(
                author: r['author'],
                comment: r['content'],
                rating: r['author_details']['rating']),
          );
        },
      );
      return reviews;
    } catch (e) {
      return null;
    }
  }
  static Future<List<Actor>?> getMainPopularActors() async {
    List<Actor> actors = [];
    try {
      http.Response response =
      await http.get(Uri.parse('${Api.baseUrl}person/popular?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].take(10).forEach(
            (a) => actors.add(
          Actor.fromMap(a),
        ),
      );
      List<Actor> actorsInfo = [];
      for (var actor in actors) {
        try{
          Actor? actorInfo = await getActorById(actor.id.toString());
          actorsInfo.add(actorInfo!);
        }
        catch(e) {}
      }
      return actorsInfo;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getPopularActors() async {
    List<Actor> actors = [];
    try {
      http.Response response =
      await http.get(Uri.parse('${Api.baseUrl}person/popular?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(10).take(9).forEach(
            (a) => actors.add(
          Actor.fromMap(a),
        ),
      );
      List<Actor> actorsInfo = [];
      for (var actor in actors) {
        try{
          Actor? actorInfo = await getActorById(actor.id.toString());
          actorsInfo.add(actorInfo!);
        }
        catch(e) {}
      }
      return actorsInfo;
    } catch (e) {
      return null;
    }
  }

  static Future<List<Actor>?> getTrendingActors() async {
    List<Actor> actors = [];
    try {
      http.Response response =
      await http.get(Uri.parse('${Api.baseUrl}trending/person/day?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['results'].skip(10).take(9).forEach(
            (a) => actors.add(
          Actor.fromMap(a),
        ),
      );
      List<Actor> actorsInfo = [];
      for (var actor in actors) {
        try{
          Actor? actorInfo = await getActorById(actor.id.toString());
          actorsInfo.add(actorInfo!);
        }
        catch(e) {}
      }
      return actorsInfo;
    } catch (e) {
      return null;
    }
  }
  static Future<Actor?> getActorById(String id) async {
    Actor actor;
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}person/$id?api_key=${Api.apiKey}&language=en-US&page=1'));
      actor = Actor.fromJson(response.body);
      return actor;
    } catch (e) {
      return null;
    }
  }
  static Future<List<Movie>?> getMoviesFromActor(String id) async {
    List<Movie> movies = [];
    try {
      http.Response response = await http.get(Uri.parse(
          '${Api.baseUrl}person/$id/movie_credits?api_key=${Api.apiKey}&language=en-US&page=1'));
      var res = jsonDecode(response.body);
      res['cast'].forEach(
            (m) {
          movies.add(
              Movie.fromMap(m)
          );
        },
      );
      return movies;
    } catch (e) {
      return null;
    }
  }

}
