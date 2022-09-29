import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

class BannerSlider extends StatefulWidget {
  @override
  _BannerSliderState createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int _index = 0;
  int _dataLength = 1;
  @override
  void initState() {
    getSliderImageFromDb();
    super.initState();
  }

  Future<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getSliderImageFromDb() async {
    var fireStore = FirebaseFirestore.instance;
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await fireStore.collection('banner').get();
    if (mounted) {
      setState(() {
        _dataLength = snapshot.docs.length;
      });
    }
    return snapshot.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          if (_dataLength != 0)
            FutureBuilder(
              future: getSliderImageFromDb(),
              builder: (_,
                  AsyncSnapshot<
                          List<QueryDocumentSnapshot<Map<String, dynamic>>>>
                      snapShot) {
                return snapShot.data == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: CarouselSlider.builder(
                            itemCount: _dataLength,
                            // ignore: avoid_types_as_parameter_names
                            itemBuilder: (BuildContext context, index, int) {
                              DocumentSnapshot<Map<String, dynamic>>
                                  sliderImage = snapShot.data![index];
                              Map<String, dynamic>? getImage =
                                  sliderImage.data();
                              return SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 150,
                                  child: Image.network(
                                    getImage!['image'],
                                    fit: BoxFit.cover,
                                  ));
                            },
                            options: CarouselOptions(
                                viewportFraction: 1,
                                initialPage: 0,
                                autoPlay: true,
                                height: 150,
                                onPageChanged:
                                    (int i, carouselPageChangedReason) {
                                  setState(() {
                                    _index = i;
                                  });
                                })),
                      );
              },
            ),
          if (_dataLength != 0)
            DotsIndicator(
              dotsCount: _dataLength,
              position: _index.toDouble(),
              decorator: DotsDecorator(
                  size: const Size.square(6.0),
                  activeSize: const Size(10.0, 4.0),
                  activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0)),
                  activeColor: Theme.of(context).primaryColor),
            )
        ],
      ),
    );
  }
}


















// import 'package:carousel_slider/carousel_slider.dart';


// import 'package:e_cart_shopping/app/modules/home/controllers/home_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AdBanner extends GetView<HomeController> {
//   HomeController controller = Get.put(HomeController());
//   @override
//   Widget build(BuildContext context) {
//     return AspectRatio(
//       aspectRatio: 3.5,
//       child: CarouselSlider(
//           items: controller.carouselImages
//               .map((item) => Padding(
//                     padding: const EdgeInsets.only(left: 3, right: 3),
//                     child: Container(
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20),
//                           image: DecorationImage(
//                               image: NetworkImage(item), fit: BoxFit.cover)),
//                     ),
//                   ))
//               .toList(),
//           options: CarouselOptions(
//               autoPlay: true,
//               enlargeCenterPage: true,
//               viewportFraction: 0.8,
//               enlargeStrategy: CenterPageEnlargeStrategy.height,
//               onPageChanged: (changer, carouselPageChangedReason) {
//                 // controller.valuess = changer;
//                 // print(controller.valuess);
//               })),
//     );
//   }
// }
















//     return Container(
//       height: 120,
//       width: double.infinity,
//       margin: EdgeInsets.all(20),
//       padding: EdgeInsets.symmetric(
//         horizontal: (1),
//         vertical: (1),
//       ),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: CarouselSlider(
//         options: CarouselOptions(
//             autoPlay: true,
//             enlargeCenterPage: true,
//             viewportFraction: 0.8,
//             enlargeStrategy: CenterPageEnlargeStrategy.height,
//             onPageChanged: (changer, carouselPageChangedReason) {
//               // controller.valuess = changer;
//               // print(controller.valuess);
//             }),
//         items: controller.carouselImages
//             .map((item) => Padding(
//                   padding: const EdgeInsets.only(left: 3, right: 3),
//                   child: Container(
//                     decoration: BoxDecoration(
//                         image: DecorationImage(
//                             image: NetworkImage(item), fit: BoxFit.cover)),
//                   ),
//                 ))
//             .toList(),
//       ),
//     );
//   }
// }
//     return Container(
//         height: 120,
//         width: double.infinity,
//         margin: EdgeInsets.all(20),
//         padding: EdgeInsets.symmetric(
//           horizontal: (1),
//           vertical: (1),
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: CarouselSlider.builder(itemCount: index, itemBuilder: , options:
// CarouselOptions(
//               autoPlay: true,
//               enlargeCenterPage: true,
//               viewportFraction: 0.8,
//               enlargeStrategy: CenterPageEnlargeStrategy.height,
//               onPageChanged: (changer, carouselPageChangedReason) {
//                 // controller.valuess = changer;
//                 // print(controller.valuess);
//               })));
//   }
// }
// // 
// // CarouselSlider.builder(
// //             slideBuilder: 
// // (index) {
// //               return StreamBuilder(
// //                   stream: FirebaseFirestore.instance
// //                       .collection("banner")
// //                       .snapshots(),
// //                   builder: (context,
// //                       AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
// //                           snapshot) {
// //                     if (snapshot.connectionState == ConnectionState.waiting) {
// //                       return Center(child: Container());
// //                     }
// //                     if (snapshot.data!.docs.isNotEmpty) {
// //                       AdBanners adBanners = AdBanners.getModelFromJson(
// //                           json: snapshot.data!.docs[index].data());

// //                       return Container(
// //                         decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(20),
// //                             image: DecorationImage(
// //                                 image: NetworkImage(adBanners.image),
// //                                 fit: BoxFit.cover)),
// //                       );
// //                     } else {
// //                       return Container();
// //                     }
// //                   });
// //             },
// //             slideTransform: CubeTransform(),
// //             itemCount: 3)










// return StreamBuilder(
//         stream: FirebaseFirestore.instance.collection("banner").snapshots(),
//         builder: (context,
//             AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: Container());
//           }
//           if (snapshot.data!.docs.isNotEmpty) {
//             AdBanners adBanners = AdBanners.getModelFromJson(
//                 json: snapshot.data!.docs[index].data());

//             return Container(
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   image: DecorationImage(
//                       image: NetworkImage(adBanners.image), fit: BoxFit.cover)),
//             );
//           } else {
//             return Container();
//           }
//         });