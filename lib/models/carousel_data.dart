import 'package:movies_app/resources/assets_manager.dart';

class CarouselData {
  String image;

  CarouselData({required this.image});
}

List<CarouselData> carouselContents = [
  CarouselData(image: ImageAssets.person1),
  CarouselData(image: ImageAssets.person2),
  CarouselData(image: ImageAssets.person3),
];
