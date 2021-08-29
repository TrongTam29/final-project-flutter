// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_html/flutter_html.dart';
// import 'package:get/get.dart';
// import 'package:my_app/constants.dart';
// import 'package:my_app/model/nutrition/nutrition_controller.dart';

// class NutritionDetail extends StatelessWidget {
//   const NutritionDetail({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     NutritionController nutritionController = Get.put(NutritionController());
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           elevation: 0,
//           centerTitle: true,
//           leading: IconButton(
//             icon: Icon(Icons.chevron_left_outlined),
//             onPressed: () {},
//             tooltip: 'Back',
//             iconSize: 30,
//           ),
//           title: Padding(
//             padding: EdgeInsets.only(top: 0),
//             child: Text(
//               'Nutrition',
//               style: TextStyle(
//                 fontSize: 25,
//                 fontWeight: FontWeight.w600,
//                 fontFamily: 'AdventPro',
//               ),
//             ),
//           ),
//           automaticallyImplyLeading: false,
//           bottom: TabBar(
//             labelColor: kPrimaryColor,
//             unselectedLabelColor: Colors.white,
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicator: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//               color: kBackgroundColor,
//             ),
//             isScrollable: true,
//             indicatorColor: Colors.white,
//             tabs: [
//               // Tab(child: Text('Monday', style: TextStyle(fontSize: 16))),
//               Tab(child: Text('Tuesday', style: TextStyle(fontSize: 16))),
//               Tab(child: Text('Wednesday', style: TextStyle(fontSize: 16))),
//               // Tab(child: Text('Thusday', style: TextStyle(fontSize: 16))),
//               // Tab(child: Text('Friday', style: TextStyle(fontSize: 16))),
//               // Tab(child: Text('Staturday', style: TextStyle(fontSize: 16))),
//               // Tab(child: Text('Sunday', style: TextStyle(fontSize: 16))),
//             ],
//           ),
//         ),
//         body: TabBarView(
//           children: [
//             // NutritionTab(
//             //   nameDay: 'MonDay',
//             //   nutritionId: 1,
//             //   nutritionController: nutritionController,
//             // ),
//             NutritionTab(
//               nutritionId: 1,
//               nameDay: 'Tuesday',
//               nutritionController: nutritionController,
//             ),
//             NutritionTab(
//               nameDay: 'Wednesday',
//               nutritionId: 1,
//               nutritionController: nutritionController,
//             ),
//             // NutritionTab(
//             //   nameDay: 'Thusday',
//             //   nutritionId: 1,
//             //   nutritionController: nutritionController,
//             // ),
//             // NutritionTab(
//             //   nameDay: 'Friday',
//             //   nutritionId: 1,
//             //   nutritionController: nutritionController,
//             // ),
//             // NutritionTab(
//             //   nameDay: 'Staturday',
//             //   nutritionId: 1,
//             //   nutritionController: nutritionController,
//             // ),
//             // NutritionTab(
//             //   nameDay: 'Sunday',
//             //   nutritionId: 1,
//             //   nutritionController: nutritionController,
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class NutritionTab extends StatefulWidget {
//   const NutritionTab(
//       {required this.nutritionController,
//       required this.nameDay,
//       required this.nutritionId});
//   final String nameDay;
//   final int nutritionId;
//   final NutritionController nutritionController;

//   @override
//   _NutritionTabState createState() => _NutritionTabState();
// }

// class _NutritionTabState extends State<NutritionTab> {
//   NutritionController nutritionController = Get.put(NutritionController());
//   @override
//   void initState() {
//     super.initState();
//     nutritionController.fetchNutrition(widget.nutritionId, widget.nameDay);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Obx(
//         () {
//           if (widget.nutritionController.isLoading.value)
//             return Center(
//               child: CupertinoActivityIndicator(),
//             );
//           else
//             return Container(
//               child: Html(
//                 data: nutritionController.nutritionObj.value.detail,
//               ),
//             );
//         },
//       ),
//     );
//   }
// }
