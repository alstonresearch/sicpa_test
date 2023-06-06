import 'package:flutter/material.dart';
import 'package:sicpa_test/books.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sicpa_test/most_books.dart';
import 'package:geolocator/geolocator.dart';

class BookDataProvider with ChangeNotifier {
  books bookData = books();
  MostBook mostBookData = MostBook();
  bool loading = false;
  String? position;
  List<Docs> bookList = [];

  getBookData(context, String searchWord, int fromLocation, int page) async {
    loading = true;
    switch (fromLocation) {
      case 0:
        bookData = await fetchSearch(context, searchWord, page);
        bookList.addAll(bookData.response!.docs ?? []);
        break;
      case 1:
        mostBookData = await fetchMostView(context, '');
        break;
      case 2:
        mostBookData = await fetchMostShared(context, '');
        break;
      case 3:
        mostBookData = await fetchMostEmailed(context, '');
        break;
    }

    loading = false;

    notifyListeners();
  }

  Future<books> fetchSearch(
      BuildContext context, String searchWord, int page) async {
    var client = http.Client();
    try {
      var response = await http.get(
        Uri.parse(
            "https://api.nytimes.com/svc/search/v2/articlesearch.json?q=$searchWord&page=$page&api-key=ydXXkgKjGgrYAyBTXIAekwxZh8Gfb5le"),
      );
      if (response.statusCode == 200) {
        return books.fromJson(json.decode(response.body));
      } else {
        throw Exception('Request Failed.');
      }
    } finally {
      client.close();
    }
  }

  Future<MostBook> fetchMostView(
      BuildContext context, String searchWord) async {
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(
          "https://api.nytimes.com/svc/mostpopular/v2/viewed/7.json?api-key=ydXXkgKjGgrYAyBTXIAekwxZh8Gfb5le"));
      if (response.statusCode == 200) {
        return MostBook.fromJson(json.decode(response.body));
      } else {
        throw Exception('Request Failed.');
      }
    } finally {
      client.close();
    }
  }

  Future<MostBook> fetchMostShared(
      BuildContext context, String searchWord) async {
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(
          "https://api.nytimes.com/svc/mostpopular/v2/shared/1/facebook.json?api-key=ydXXkgKjGgrYAyBTXIAekwxZh8Gfb5le"));
      if (response.statusCode == 200) {
        return MostBook.fromJson(json.decode(response.body));
      } else {
        throw Exception('Request Failed.');
      }
    } finally {
      client.close();
    }
  }

  Future<MostBook> fetchMostEmailed(
      BuildContext context, String searchWord) async {
    var client = http.Client();
    try {
      var response = await http.get(Uri.parse(
          "https://api.nytimes.com/svc/mostpopular/v2/emailed/1.json?api-key=ydXXkgKjGgrYAyBTXIAekwxZh8Gfb5le"));
      if (response.statusCode == 200) {
        return MostBook.fromJson(json.decode(response.body));
      } else {
        throw Exception('Request Failed.');
      }
    } finally {
      client.close();
    }
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    position = Geolocator.getCurrentPosition().toString();
    return await Geolocator.getCurrentPosition();
  }
}
