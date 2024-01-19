import 'package:find_people_flutter/data/app_repository_impl.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapsScreenController extends GetxController{
  final RxList<MapObject> mapObjects = <MapObject>[].obs;

  void getBranches() async {
    final result = await AppRepositoryImpl.getAllUsers();
    print('---------------------------------- t ${result}');
    for (int i = 0; i < result.length; i++) {
      mapObjects.add(
          PlacemarkMapObject(
          mapId: MapObjectId(i.toString()),
          text: PlacemarkText(text: "${result[i].name}", style: PlacemarkTextStyle(size: 12,placement: TextStylePlacement.bottom, offsetFromIcon: true)),
          icon: PlacemarkIcon.single(PlacemarkIconStyle(
              scale: 0.2,
              image: BitmapDescriptor.fromAssetImage('assets/images/maps_icon.png'))),
          point: Point(
              latitude: result[i].lat,
              longitude: result[i].long
          ))
      );
    }
  }
}