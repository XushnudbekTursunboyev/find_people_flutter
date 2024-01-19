
import 'package:get/get.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../data/model/user_data.dart';

class UsersPageController extends GetxController{
  final RxList<MapObject> mapObjects = <MapObject>[].obs;
 // RxBool loading = true.obs;

  void getBranches(List<UserData> result) async {
   // loading = false;
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