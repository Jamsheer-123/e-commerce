import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:e_cart_shopping/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/search_controller.dart';
import 'local.widget/item_container.dart';
import 'local.widget/product_tile.dart';

// ignore: must_be_immutable
class SearchView extends GetView<SearchController> {
  var name = "".obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
          backgroundColor: AppColors.white,
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(60.0), // here the desired height
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: AppColors.white.withOpacity(0.4),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: AppColors.black,
                          ),
                        ),
                      ),
                      horizontalSpace(4),
                      Container(
                        width: size.width * 0.82,
                        child: CupertinoSearchTextField(
                          itemSize: 30,
                          onChanged: (val) {
                            name.value = val;
                          },
                        ),
                      ),
                    ],
                  ))),
          body: Obx(
            () => name.isEmpty
                ? StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('product')
                        .snapshots(),
                    builder: (context, snapshots) {
                      return (snapshots.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : GridView.builder(
                              semanticChildCount: 1,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      mainAxisExtent: 250, crossAxisCount: 2),
                              shrinkWrap: true,
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshots.data!.docs[index].data()
                                    as Map<String, dynamic>;

                                if (name.isEmpty) {
                                  return ProductTile(data: data);
                                }

                                return Container();
                              });
                    },
                  )
                : StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection('product')
                        .snapshots(),
                    builder: (context, snapshots) {
                      return (snapshots.connectionState ==
                              ConnectionState.waiting)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.builder(
                              semanticChildCount: 1,
                              shrinkWrap: true,
                              itemCount: snapshots.data!.docs.length,
                              itemBuilder: (context, index) {
                                var data = snapshots.data!.docs[index].data()
                                    as Map<String, dynamic>;

                                if (data['productName']
                                        .toString()
                                        .toLowerCase()
                                        .startsWith(name.toLowerCase()) ||
                                    data['productName']
                                        .toString()
                                        .toLowerCase()
                                        .endsWith(name.toLowerCase())) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAILED_PAGE,
                                          arguments: data['id']);
                                    },
                                    child: Container(
                                      color: AppColors.grey1.withOpacity(0.9),
                                      margin: EdgeInsets.only(bottom: 10),
                                      padding: EdgeInsets.only(left: 12),
                                      width: double.infinity,
                                      height: 140,
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            margin: EdgeInsets.only(right: 15),
                                            padding: EdgeInsets.all(8),
                                            height: 130,
                                            width: 130,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child:
                                                Image.network(data["imageUrl"]),
                                          ),
                                          ItemContainer(data: data),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                                return Container();
                              });
                    },
                  ),
          )),
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String name = "";

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//           backgroundColor: AppColors.white,
//           appBar: PreferredSize(
//               preferredSize: Size.fromHeight(60.0), // here the desired height
//               child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: AppColors.white.withOpacity(0.4),
//                         child: IconButton(
//                           onPressed: () {
//                             Get.back();
//                           },
//                           icon: Icon(
//                             Icons.arrow_back_ios,
//                             color: AppColors.black,
//                           ),
//                         ),
//                       ),
//                       horizontalSpace(4),
//                       Container(
//                         width: size.width * 0.82,
//                         child: CupertinoSearchTextField(
//                           itemSize: 30,
//                           onChanged: (val) {
//                             setState(() {
//                               name = val;
//                             });
//                           },
//                         ),
//                       ),
//                     ],
//                   ))),
//           body: name.isEmpty
//               ? StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('product')
//                       .snapshots(),
//                   builder: (context, snapshots) {
//                     return (snapshots.connectionState ==
//                             ConnectionState.waiting)
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : GridView.builder(
//                             semanticChildCount: 1,
//                             gridDelegate:
//                                 SliverGridDelegateWithFixedCrossAxisCount(
//                                     mainAxisExtent: 250, crossAxisCount: 2),
//                             shrinkWrap: true,
//                             itemCount: snapshots.data!.docs.length,
//                             itemBuilder: (context, index) {
//                               var data = snapshots.data!.docs[index].data()
//                                   as Map<String, dynamic>;

//                               if (name.isEmpty) {
//                                 return ProductTile(data: data);
//                               }

//                               return Container();
//                             });
//                   },
//                 )
//               : StreamBuilder<QuerySnapshot>(
//                   stream: FirebaseFirestore.instance
//                       .collection('product')
//                       .snapshots(),
//                   builder: (context, snapshots) {
//                     return (snapshots.connectionState ==
//                             ConnectionState.waiting)
//                         ? Center(
//                             child: CircularProgressIndicator(),
//                           )
//                         : ListView.builder(
//                             semanticChildCount: 1,
//                             shrinkWrap: true,
//                             itemCount: snapshots.data!.docs.length,
//                             itemBuilder: (context, index) {
//                               var data = snapshots.data!.docs[index].data()
//                                   as Map<String, dynamic>;

//                               if (data['productName']
//                                       .toString()
//                                       .toLowerCase()
//                                       .startsWith(name.toLowerCase()) ||
//                                   data['productName']
//                                       .toString()
//                                       .toLowerCase()
//                                       .endsWith(name.toLowerCase())) {
//                                 return GestureDetector(
//                                   onTap: () {
//                                     Get.toNamed(Routes.DETAILED_PAGE,
//                                         arguments: data['id']);
//                                   },
//                                   child: Container(
//                                     color: AppColors.grey1.withOpacity(0.9),
//                                     margin: EdgeInsets.only(bottom: 10),
//                                     padding: EdgeInsets.only(left: 12),
//                                     width: double.infinity,
//                                     height: 140,
//                                     child: Row(
//                                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                       children: <Widget>[
//                                         Container(
//                                           margin: EdgeInsets.only(right: 15),
//                                           padding: EdgeInsets.all(8),
//                                           height: 130,
//                                           width: 130,
//                                           decoration: BoxDecoration(
//                                             color: AppColors.white,
//                                             borderRadius:
//                                                 BorderRadius.circular(10),
//                                           ),
//                                           child:
//                                               Image.network(data["imageUrl"]),
//                                         ),
//                                         ItemContainer(data: data),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               }
//                               return Container();
//                             });
//                   },
//                 )),
//     );
//   }
// }
