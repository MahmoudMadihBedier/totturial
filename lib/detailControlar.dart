import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class DetailsController extends GetxController {
  var fav =0.obs;
void favCounter(){
  if(fav.value==1) {
    Get.snackbar("Loved ", "some one has loved it");
  }else {
    fav.value++;
    Get.snackbar("Loved ", "you just  loved it");
  }
}
}