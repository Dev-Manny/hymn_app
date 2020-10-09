import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_church/blocs/songs/songs_bloc.dart';
import 'package:the_church/blocs/songs/songs_event.dart';
import 'package:the_church/blocs/songs/songs_state.dart';
import 'package:the_church/screens/song_details.dart';

// ignore: must_be_immutable
class SongScreen extends StatelessWidget {
  final int hymnId;
  SongsBloc songsBloc;
  SongScreen({Key key, @required this.hymnId, this.songsBloc})
      : assert(hymnId != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    songsBloc = BlocProvider.of<SongsBloc>(context)..add(SongsLoaded(hymnId));
    print(hymnId);
    print(songsBloc);
    print('songs');
    return BlocBuilder<SongsBloc, SongsState>(builder: (context, state) {
      print(state);
      if (state is SongsLoadInProgress) {
        return CircularProgressIndicator();
      } else if (state is SongsLoadSuccess) {
        final songs = state.songs;
        print('the songs are');
        print(songs);
        return Scaffold(
            appBar: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(
                color: Colors.deepOrangeAccent,  
              ),
              title: Text(
                'Worship & Praise',
                style: TextStyle(fontSize: 20.0, color: Colors.deepOrangeAccent),
              ),
              backgroundColor: Colors.white,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Icon(Icons.search, size: 30.0,),
                ),
              ],
            ),
            body: Container(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, i) => InkWell(
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (_) {
                            return SongDetails(
                                songNumber: songs[i].songNumber,
                                title: songs[i].title,
                                verses: songs[i].verses,
                                similarTunes: songs[i].similarTune,
                                alternativeTunes: songs[i].alternateTune);
                          }));
                        },
                        child: Container(
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                          color: Colors.grey.shade400,
                                          width: 0.2,
                                        ),
                                        boxShadow: <BoxShadow>[
                                          BoxShadow(
                                            color: Colors.grey.shade200,
                                            offset: Offset(1, 1),
                                            blurRadius: 10,
                                            spreadRadius: 4,
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                      '${songs[i].songNumber}.'),
                                                ),
                                                Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child:
                                                      Text('${songs[i].title}'),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                onTap: () {},
                                                child: Container(
                                                    child: Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.deepOrangeAccent,
                                                  size: 20.0,
                                                )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                  itemCount: songs.length),
            ));
      } else {
        return Container();
      }
    });
  }
}
