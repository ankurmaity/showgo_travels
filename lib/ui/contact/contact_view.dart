import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:showgo_travels/data/assets.dart';

import '../../utils/style.dart';
import 'contact_controller.dart';

class ContactView extends GetView<ContactController> {
  late final ContactController viewModel;

  late final double width;

  ContactView({super.key}) {
    viewModel = Get.put(ContactController());
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    List<Widget> body = [];
    body.add(_header());

    if (width > 700) {
      body.add(Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [_address(), const SizedBox(width: 50), _contact()]));
    } else {
      body.add(_address());
      body.add(const SizedBox(height: 25));
      body.add(_contact());
    }

    return Column(
      children: body,
    );
  }

  _header() {
    return Container(
        padding: const EdgeInsets.only(top: 20),
        child: Text('Contact',
            style: Style.signikaNegative(size: 30, bold: true)));
  }

  _address() {
    return Column(
      crossAxisAlignment:
          width > 700 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Container(
            alignment: Alignment.center,
            child: Text('Address', style: Style.signikaNegative(size: 22))),
        const SizedBox(height: 10),
        Text('XYX, Building Name\nCity, State\nPIN-5XXXXX',
            style: Style.signikaNegative(size: 15))
      ],
    );
  }

  _contact() {
    return Column(
      crossAxisAlignment:
          width > 700 ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      children: [
        Text('Contact Us', style: Style.signikaNegative(size: 22)),
        const SizedBox(height: 10),
        Row(
            mainAxisAlignment: width > 700
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.phone, height: 25),
              const SizedBox(width: 10),
              Text('+90 88854 05907', style: Style.signikaNegative(size: 15))
            ]),
        const SizedBox(height: 7),
        Row(
            mainAxisAlignment: width > 700
                ? MainAxisAlignment.start
                : MainAxisAlignment.center,
            children: [
              SvgPicture.asset(Assets.email, height: 25),
              const SizedBox(width: 10),
              Text('info@showgotravels.com',
                  style: Style.signikaNegative(size: 15))
            ]),
      ],
    );
  }
}
