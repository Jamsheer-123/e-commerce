import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductImagess extends StatelessWidget {
  ProductImagess({
    Key? key,
    required this.data,
    // required this.product,
  }) : super(key: key);
  final Map<String, dynamic> data;
  int selectedImage = 0;
  var valuss = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: (238),
          child: AspectRatio(
            aspectRatio: 1,
            child: Hero(
                tag: "343",
                child: Obx(
                  // ignore: unrelated_type_equality_checks
                  () => valuss == selectedImage
                      ? Image.network(data['imageArray'][selectedImage])
                      : Container(),
                )),
          ),
        ),
        verticalSpace(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ...List.generate(data['imageArray'].length,
                (index) => buildSmallProductPreview(index)),
          ],
        )
      ],
    );
  }

  GestureDetector buildSmallProductPreview(int index) {
    return GestureDetector(
        onTap: () {
          selectedImage = index;
          valuss.value = index;
        },
        child: Obx(
          () => AnimatedContainer(
            duration: Duration(seconds: 1),
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.all(8),
            height: (48),
            width: (48),
            decoration: BoxDecoration(
              color: Color(0xFFF5F6F9),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                  // ignore: unrelated_type_equality_checks
                  color: AppColors.blue2.withOpacity(valuss == index ? 1 : 0)),
            ),
            child: Image.network(data['imageArray'][index]),
          ),
        ));
  }
}

// class ProductImages extends StatefulWidget {
//   ProductImages({
//     Key? key,
//     required this.data,
//     // required this.product,
//   }) : super(key: key);
//   final Map<String, dynamic> data;
//   @override
//   _ProductImagesState createState() => _ProductImagesState();
// }

// HomeController homeController = Get.put(HomeController());

// class _ProductImagesState extends State<ProductImages> {
//   int selectedImage = 0;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(
//           width: (238),
//           child: AspectRatio(
//             aspectRatio: 1,
//             child: Hero(
//               tag: "343",
//               child: Image.network(widget.data['imageArray'][selectedImage]),
//             ),
//           ),
//         ),
//         verticalSpace(8),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ...List.generate(widget.data['imageArray'].length,
//                 (index) => buildSmallProductPreview(index)),
//           ],
//         )
//       ],
//     );
//   }

//   GestureDetector buildSmallProductPreview(int index) {
//     return GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedImage = index;
//         });
//       },
//       child: AnimatedContainer(
//         duration: Duration(seconds: 2),
//         margin: EdgeInsets.only(right: 15),
//         padding: EdgeInsets.all(8),
//         height: (48),
//         width: (48),
//         decoration: BoxDecoration(
//           color: Color(0xFFF5F6F9),
//           borderRadius: BorderRadius.circular(10),
//           border: Border.all(
//               color:
//                   AppColors.blue2.withOpacity(selectedImage == index ? 1 : 0)),
//         ),
//         child: Image.network(widget.data['imageArray'][index]),
//       ),
//     );
//   }
// }
