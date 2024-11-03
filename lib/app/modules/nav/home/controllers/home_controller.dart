import 'package:fitness/app/core/constants/asset_constants.dart';
import 'package:get/get.dart';

import '../../../../data/plan_model.dart';

class HomeController extends GetxController {

  final planList = [
    PlanModel(image: image1, title: 'Push Up', subtitle: '100 push up a day', progress: 45, type: 'Beginner',),
    PlanModel(image: image2, title: 'Sit Up', subtitle: '20 sit up a day', progress: 80, type: 'Intermediate',),
    PlanModel(image: image3, title: 'knee Push up', subtitle: '10 knee up', progress: 60, type: 'Expert',),
    PlanModel(image: image4, title: 'Plank', subtitle: '5 min plank', progress: 70, type: 'Intermediate',),
    PlanModel(image: welcomeBg, title: 'Fast Run', subtitle: '10 min run', progress: 100, type: 'Expert',),
    PlanModel(image: image1, title: 'Push Up', subtitle: '100 push up a day', progress: 45, type: 'Beginner',),
    PlanModel(image: image2, title: 'Sit Up', subtitle: '20 sit up a day', progress: 80, type: 'Intermediate',),
    PlanModel(image: image3, title: 'knee Push up', subtitle: '10 knee up', progress: 60, type: 'Expert',),
    PlanModel(image: image4, title: 'Plank', subtitle: '5 min plank', progress: 70, type: 'Intermediate',),
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
