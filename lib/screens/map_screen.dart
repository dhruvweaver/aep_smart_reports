import 'dart:ui';

import 'package:flutter/material.dart';

import '../widgets/map.dart';
import '../model/picture_list.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late PictureList list;
  Future<PictureList> getPictureList() async {
    // return await Future.delayed(const Duration(seconds: 2), () {
    //   return PictureList.create();
    // });
    return await PictureList.create();
  }

  @override
  void initState() {
    getPictureList().then((value) {
      if (mounted) {
        setState(() {
          list = value;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Future<PictureList> picList = getPictureList().then((value) {
      return value;
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Map',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: FutureBuilder(
          future: Future.wait([picList]),
          builder: (context, AsyncSnapshot<List<PictureList>> snapshot) {
            if (snapshot.hasData) {
              // list = snapshot.data![0];
              print("Map screen list: ${list.picList.length}");
              return Map(
                picList: list,
              );
            } else {
              return Center(
                child: Text("${snapshot.error}"),
              );
            }
          }),
    );
  }
}
