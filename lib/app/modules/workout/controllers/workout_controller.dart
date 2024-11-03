import 'package:get/get.dart';

import '../../../core/constants/asset_constants.dart';
import '../../../data/round_model.dart';

class WorkoutController extends GetxController {
  final roundList = [
    RoundModel(image: image1, title: 'Push Up', subtitle: '00:30 min', ),
    RoundModel(image: image2, title: 'Jumping Jacks', subtitle: '00:20 min',),
    RoundModel(image: image3, title: 'Squats', subtitle: '00:40 knee up',),
    RoundModel(image: image4, title: 'Plank', subtitle: '00:05 min', ),
    RoundModel(image: welcomeBg, title: 'Fast Run', subtitle: '00:30 min',),
    RoundModel(image: image1, title: 'Push Up', subtitle: '00:01 min',),
    RoundModel(image: image2, title: 'Sit Up', subtitle: '00:30 min',),
    RoundModel(image: image3, title: 'knee Push up', subtitle: '00:20 min',),
    RoundModel(image: image4, title: 'Plank', subtitle: '00:30 min',),
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
