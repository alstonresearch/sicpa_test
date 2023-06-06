import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:sicpa_test/book_data_provider.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:intl/intl.dart';
import 'package:sicpa_test/books.dart';
import 'package:sicpa_test/most_books.dart';

class BookListPage extends StatefulWidget {
  const BookListPage({super.key, required this.fromLocation, this.searchText});

  final int fromLocation;
  final String? searchText;

  @override
  State<BookListPage> createState() => _BookListPageState();
}

var long, lat;
int page = 1;
bool isPageLoading = false;
ScrollController scrollController = ScrollController();

class _BookListPageState extends State<BookListPage> {
  @override
  void initState() {
    super.initState();
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    StreamSubscription<Position> positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) {
      if (position != null) {
        long = position.longitude.toString();
        lat = position.latitude.toString();
      }
      print(position == null
          ? 'Unknown'
          : '${position.latitude.toString()}, ${position.longitude.toString()}');
    });

    final bookProvider = Provider.of<BookDataProvider>(context, listen: false);
    bookProvider.determinePosition();
    switch (widget.fromLocation) {
      case 0:
        bookProvider.getBookData(
            context, widget.searchText ?? '', widget.fromLocation, 1);
        break;
      case 1:
        bookProvider.getBookData(
            context, widget.searchText ?? '', widget.fromLocation, 0);
        break;
      case 2:
        bookProvider.getBookData(
            context, widget.searchText ?? '', widget.fromLocation, 0);
        break;
      case 3:
        bookProvider.getBookData(
            context, widget.searchText ?? '', widget.fromLocation, 0);
        break;
    }
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
        setState(() {
          isPageLoading = true;
        });
        page += 1;
        bookProvider.getBookData(
            context, widget.searchText ?? '', widget.fromLocation, page);

        setState(() {
          isPageLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bookProvider = Provider.of<BookDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Articles'),
      ),
      body: Column(
        children: [
          Text('Current Location: $long , $lat '),
          Expanded(
            child: bookProvider.loading
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 10,
                      itemBuilder: (ctx, i) {
                        return Column(
                          children: [
                            loadingShimmer(),
                            const SizedBox(
                              height: 10,
                            )
                          ],
                        );
                      },
                    ),
                  )
                : widget.fromLocation == 0
                    ? fromSearch(bookProvider.bookData)
                    : fromOther(bookProvider.mostBookData),
          ),
        ],
      ),
    );
  }
}

Widget fromSearch(books data) {
  final f = DateFormat('yyyy-MM-dd hh:mm');

  return ListView.builder(
    controller: scrollController,
    physics: const ScrollPhysics(),
    shrinkWrap: true,
    itemCount: data.response?.docs?.length,
    itemBuilder: (ctx, i) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ListTile(
                  title: Text(
                    overflow: TextOverflow.ellipsis,
                    data.response?.docs?[i].headline!.main ?? '-',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  subtitle: Text(f.format(
                      DateTime.parse(data.response?.docs?[i].pubDate ?? '-'))),
                ),
                const Divider(),
              ],
            ),
          ),
        ],
      );
    },
  );
}

Widget fromOther(MostBook data) {
  final f = DateFormat('yyyy-MM-dd hh:mm');
  return ListView.builder(
    shrinkWrap: true,
    itemCount: data.numResults,
    itemBuilder: (ctx, i) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                overflow: TextOverflow.clip,
                data.results?[i].title ?? '-',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              subtitle: Text(f.format(
                  DateTime.parse(data.results?[i].publishedDate ?? '-'))),
            ),
            const Divider(),
          ],
        ),
      );
    },
  );
}

Widget loadingShimmer() => Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey[400]!,
      period: const Duration(seconds: 1),
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 250,
                    height: 10,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 150,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
