import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:ui_for_college/app/view/libraryscreen/bookfetcdata.dart';

class LibraryBookListView extends StatefulWidget {
  const LibraryBookListView({super.key});

  @override
  State<LibraryBookListView> createState() => _LibraryBookListViewState();
}

class _LibraryBookListViewState extends State<LibraryBookListView> {
  final ref = FirebaseDatabase.instance.ref('library').child('addbook');
  final searchFilter = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Catalogue'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                  hintText: 'Search', border: OutlineInputBorder()),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: FirebaseAnimatedList(
                query: ref,
                defaultChild: Center(
                  child: Column(children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Loading',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        letterSpacing: 1.2,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.grey,
                            offset: Offset(2.0, 2.0),
                          ),
                        ],
                      ),
                    ),
                    CircularProgressIndicator()
                  ]),
                ),
                itemBuilder: (context, snapshot, animation, index) {
                  final BookName = snapshot.child('Book Name').value.toString();
                  if (searchFilter.text.isEmpty) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(snapshot.child('Book Name').value.toString()),
                        subtitle:
                            Text(snapshot.child('Category').value.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.rate_review),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LibraryBookReviewFetchData()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else if (BookName.toLowerCase()
                      .contains(searchFilter.text.toLowerCase().toString())) {
                    return Card(
                      child: ListTile(
                        title:
                            Text(snapshot.child('Book Name').value.toString()),
                        subtitle:
                            Text(snapshot.child('Category').value.toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.rate_review),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LibraryBookReviewFetchData()),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  } else {
                    return Container();
                  }
                }),
          ),
        ],
      ),
    );
  }

  void _navigateToReviewPage(Map<String, dynamic> bookData) {
    print('Navigating to review page for book: ${bookData['Book Name']}');
  }
}
