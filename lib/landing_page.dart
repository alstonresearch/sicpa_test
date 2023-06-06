import 'package:flutter/material.dart';
import 'package:sicpa_test/book_list.dart';
import 'package:sicpa_test/search_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NYT',
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Search",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SearchPage()),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Search Articles'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
            child: const Text(
              "Popular",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BookListPage(
                          fromLocation: 1,
                        )),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Viewed'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BookListPage(
                          fromLocation: 2,
                        )),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              // decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Shared'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const BookListPage(
                          fromLocation: 3,
                        )),
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              // margin: const EdgeInsets.all(15.0),
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Most Emailed'),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.all(15.0),
            alignment: Alignment.centerLeft,
          ),
        ],
      ),
    );
  }
}
