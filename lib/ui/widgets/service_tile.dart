import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/color_constants.dart';
import '../../utils/style.dart';

class IconModel {
  var title = '';
  var iconPath = '';

  IconModel({required this.title, required this.iconPath});
}

class ServicesTiles extends StatefulWidget {
  ServicesTiles(this.iconModel,
      {super.key,
      this.size = 80,
      this.color = ColorTheme.color3,
      this.margin = 5,
      this.onTap});

  IconModel iconModel;
  int size;
  int margin;
  Color color;
  GestureTapCallback? onTap;

  @override
  ServicesTilesState createState() => ServicesTilesState();
}

class ServicesTilesState extends State<ServicesTiles> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MouseRegion(
        // onTap: widget.onTap,
        // hoverColor: Colors.deepOrange,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Card(
          child: LayoutBuilder(
            builder: (context, constraints) {
              double cardWidth = constraints.maxWidth;
              double cardHeight = constraints.maxHeight;

              return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        widget.iconModel.iconPath,
                        semanticsLabel: widget.iconModel.title,
                        height: cardWidth * 0.5,
                        colorFilter: isHovered
                            ? const ColorFilter.mode(
                                Colors.deepOrange, BlendMode.srcIn)
                            : ColorFilter.mode(widget.color, BlendMode.srcIn),
                      ),
                      Flexible(
                          child: Container(
                              alignment: Alignment.center,
                              child: Text(widget.iconModel.title,
                                  style: Style.serviceTimeStyle(cardWidth),
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  textAlign: TextAlign.center))),
                    ],
                  ));
            },
          ),
        ),
      ),
    );
  }
}
