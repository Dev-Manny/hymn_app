import 'package:flutter/material.dart';

class SongDetails extends StatelessWidget {
  final List verses;
  final String songNumber;
  final String title;
  final List similarTunes;
  final List alternativeTunes;
  SongDetails(
      {Key key,
      @required this.songNumber,
      @required this.title,
      @required this.verses,
      this.similarTunes,
      this.alternativeTunes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.deepOrangeAccent,
          ),
          title: Center(
            child: Text('$songNumber.  $title',
                style:
                    TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent)),
          ),
          backgroundColor: Colors.white,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(
                Icons.share,
                size: 30.0,
              ),
            ),
          ],
        ),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                  //   child: Text('$songNumber',
                  //       style: TextStyle(
                  //           fontSize: 18.0,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black)),
                  // ),
                  Text('$title',
                      style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                ],
              ),
            ),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, i) {
                return Container(
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: Column(
                            children: [
                              Text("${i + 1}."),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Column(
                            children: [
                              Text("${verses[i]['verse']}"),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
              itemCount: verses.length,
            )
          ],
        )));
  }
}
