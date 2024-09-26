import 'package:get/get.dart';

import '../../data/assets.dart';
import '../widgets/service_tile.dart';

class ServicesController extends GetxController {
  List<IconModel> services = [
    IconModel(title: 'Flights', iconPath: Assets.flight),
    IconModel(title: 'Hotels', iconPath: Assets.hotel ),
    IconModel(title: 'Holidays', iconPath: Assets.holiday),
    IconModel(title: 'Trains', iconPath: Assets.train),
    IconModel(title: 'Homestays', iconPath: Assets.homestay),
    IconModel(title: 'Ramoji Film City', iconPath: Assets.ramoji),
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
