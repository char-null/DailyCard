import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class CardController extends GetxController {
  final picker = ImagePicker();
  XFile? pickedImg;
  bool isLoading = false;

  Future pickImg() async {
    isLoading = true;
    pickedImg = await picker.pickImage(source: ImageSource.gallery);
    isLoading = false;
    update();
  }
}
