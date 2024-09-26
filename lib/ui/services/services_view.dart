import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/service_tile.dart';
import 'services_controller.dart';

class ServicesView extends GetView<ServicesController> {
  late ServicesController viewModel;

  ServicesView({super.key}) {
    viewModel = Get.put(ServicesController());
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
          alignment: Alignment.center,
          height: 300,
            width: min(width, 750),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                    min(_gridCount(width), viewModel.services.length),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: viewModel.services.length,
              itemBuilder: (context, index) {
                return ServicesTiles(viewModel.services[index], onTap: () {});
              },
            )));
  }

  _gridCount(double width) {
    if (width > 750) {
      return width ~/ 150;
    } else {
      return width ~/ 120;
    }
  }
}
