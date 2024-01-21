
import 'dart:async';
import 'package:find_people_flutter/data/model/user_data.dart';
import 'package:find_people_flutter/data/source/pref/my_preference.dart';
import 'package:find_people_flutter/ui/controller/maps_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapsScreen extends StatefulWidget {
  final List<UserData> users;
  const MapsScreen(this.users, {super.key});

  @override
  State<MapsScreen> createState() => _MapsScreenState();
}

class _MapsScreenState extends State<MapsScreen> {
  final mapControllerCompleter = Completer<YandexMapController>();
  Future<void> _moveToCurrentLocation(double lat, double lon) async {
    (await mapControllerCompleter.future).moveCamera(
      animation: const MapAnimation(type: MapAnimationType.linear, duration: 1),
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: Point(
            latitude: lat,
            longitude: lon,
          ),
          zoom: 15,
        ),
      ),
    );
  }


  @override
  void initState() {
    if(widget.users.length == 1) {
      _moveToCurrentLocation(widget.users[0].lat , widget.users[0].long);
    }else{
      _moveToCurrentLocation(MyPreference.getLat() ?? 0.0 , MyPreference.getLong() ?? 0.0);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MapsScreenController>();
    controller.getBranches();
    final List<MapObject> mapObjects = [];

    for (int i = 0; i < widget.users.length; i++) {
      mapObjects.add(
          PlacemarkMapObject(
              mapId: MapObjectId(i.toString()),
              text: PlacemarkText(text: widget.users[i].name, style: const PlacemarkTextStyle(size: 12,placement: TextStylePlacement.bottom, offsetFromIcon: true)),
              icon: PlacemarkIcon.single(PlacemarkIconStyle(
                  scale: 0.2,
                  image: BitmapDescriptor.fromAssetImage('assets/images/maps_icon.png'))),
              point: Point(
                  latitude: widget.users[i].lat,
                  longitude: widget.users[i].long
              ))
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
        title: Text(widget.users.length == 1 ? widget.users[0].name : 'Users', style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),),
        actions: [
          IconButton(onPressed: (){
            Get.toNamed('/update');
          }, icon: const Icon(Icons.edit))
        ],
      ),
        body: YandexMap(
          onMapCreated: (controller){
            mapControllerCompleter.complete(controller);
          },
          mapObjects: mapObjects
        )
    );

  }
}
