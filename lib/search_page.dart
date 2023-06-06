import 'package:flutter/material.dart';
import 'package:sicpa_test/book_list.dart';

class SearchPage extends StatefulWidget {
  SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _inputController = TextEditingController();
  bool isText = false;

  @override
  void initState() {
    super.initState();
    _inputController.addListener(() {
      setState(() {
        isText = _inputController.text.isNotEmpty;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Search'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1,
            margin: const EdgeInsets.all(15.0),
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            child: TextField(
              controller: _inputController,
              textAlign: TextAlign.left,
              decoration: const InputDecoration.collapsed(
                  hintText: 'Search Articles Here...'),
            ),
          ),
          SizedBox(
            width: 150,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => BookListPage(
                            fromLocation: 0,
                            searchText: _inputController.text,
                          )),
                );
              },
              child: const Text('Search'),
            ),
          ),
        ],
      ),
    );
  }
}
