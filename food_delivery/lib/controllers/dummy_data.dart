import 'package:food_delivery/models/app_models.dart';
import 'package:food_delivery/services/icons_image.dart';

class DummyData {
  static List<OnBordingModel> onBordingData = [
    OnBordingModel("Save Food with our new Feature!", AppImage.slider_img1),
    OnBordingModel(
        "Set preferences for multiple users from various restaurants!",
        AppImage.slider_img2),
    OnBordingModel("Fast, rescued food at your service.", AppImage.slider_img3),
  ];
  static List<SearchBtnModel>  searchBtnData = [
    SearchBtnModel("Rescued", "Rescued"),
    SearchBtnModel("Vegan", "Vegan"),
    SearchBtnModel("Delivery", "Delivery"),
    SearchBtnModel("Popular", "Popular"),
  ];
}

