import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'cctv_page.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final point = CameraPosition(
    target: LatLng(37.4980345, 127.0278163),
    //특정 위치를 찍으면 해당 주소를 보여줌. 구글 지도에서 확인 가능.
    zoom: 15.0,
  );

  static final toPoint = CameraPosition(
    target: LatLng(36.4980345, 127.0278163),
    //특정 위치를 찍으면 해당 주소를 보여줌. 구글 지도에서 확인 가능.
    zoom: 15.0,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: <Widget>[
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: point,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            compassEnabled: true,
            zoomGesturesEnabled: true,
            rotateGesturesEnabled: true,
            scrollGesturesEnabled: true,
            tiltGesturesEnabled: true,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 50.0, 10.0, 5.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                heroTag: "btnTop1",
                onPressed: () => print('button pressed'),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(Icons.search, size: 30.0),
              ),
            ),
          ),

        ],

      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 5.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              width: 50.0,
              height: 50.0,
              child: FloatingActionButton(
                heroTag: "btn1",
                onPressed: _goToHome,
                child: Icon(Icons.construction, size: 30),
              ),
            ),


            SizedBox(
              width: 50.0,
              height: 50.0,
              child: FloatingActionButton(
                heroTag: "btn2",
                onPressed: _goToLake,
                child: Icon(Icons.warning, size: 30),
              ),
            ),


            SizedBox(
              width: 50.0,
              height: 50.0,
              child: FloatingActionButton(
                heroTag: "btn3",
                onPressed: () {Navigator.push(
                    context, MaterialPageRoute(builder: (context) => CctvPage()));},
                child: Icon(Icons.photo_camera_front, size: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }


  Future<void> _goToHome() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(point));
  }

  Future<void> _goToLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(toPoint));
  }


}
