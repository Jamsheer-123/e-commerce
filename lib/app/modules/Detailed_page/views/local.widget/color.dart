import 'package:e_cart_shopping/app/modules/Detailed_page/controllers/detailed_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ColorDots extends StatefulWidget {
  ColorDots({Key? key, required this.data}) : super(key: key);

  final Map<String, dynamic> data;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  List color = [Colors.black, Colors.blue, Colors.white];

  String colors = "green";
  DetailedPageController controller = Get.put(DetailedPageController());
  @override
  Widget build(BuildContext context) {
    // Now this is fixed and only for demo
    int selectedColor = 2;
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 20, bottom: 10, left: 12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Row(
        children: [
          ...List.generate(
            3,
            (index) => ColorDot(
              color: color[index],
              isSelected: index == selectedColor,
            ),
          ),
          Spacer(),
          Obx(() => Row(
                children: [
                  IconButton(
                      onPressed: () {
                        controller.removeItems();
                      },
                      icon: Icon(
                        Icons.remove,
                        color: Colors.red,
                      )),
                  Text('${controller.items}'),
                  IconButton(
                      onPressed: () {
                        controller.addItems();
                        // controller.showDisplayName();
                      },
                      icon: Icon(
                        Icons.add,
                        color: Colors.green,
                      )),
                ],
              )),
        ],
      ),
    );
  }
}

class ColorDot extends StatelessWidget {
  const ColorDot({
    Key? key,
    required this.color,
    this.isSelected = false,
  }) : super(key: key);
  final Color color;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 2),
      padding: EdgeInsets.all((8)),
      height: (40),
      width: (40),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
            color: isSelected ? Color(0xFFFF4848) : Colors.transparent),
        shape: BoxShape.circle,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
