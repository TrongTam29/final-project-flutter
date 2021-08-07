import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:my_app/components/appBar.dart';
import 'package:my_app/screens/detail%20cardio/detail_cardio.dart';
import 'package:my_app/screens/list%20cardio/model/cardio_controller.dart';

class ListCardio extends StatefulWidget {
  const ListCardio({Key? key}) : super(key: key);

  @override
  _ListCardioState createState() => _ListCardioState();
}

class _ListCardioState extends State<ListCardio> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    CardioController cardioController = Get.put(CardioController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar_Components(
          title: 'Cardio and Lose weight',
        ),
      ),
      body: SafeArea(
        child: Obx(() {
          if (cardioController.isLoading.value)
            return Center(
              child: CupertinoActivityIndicator(),
            );
          else
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              child: ListView.builder(
                itemCount: cardioController.cardioList.length,
                itemBuilder: (context, index) {
                  var item = cardioController.cardioList[index];
                  return Stack(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: size.height * 0.3 - 40,
                          width: size.width * 1,
                          margin: EdgeInsets.only(top: 15, left: 15, right: 15),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              'https://i.ytimg.com/vi/2MZSjB1WLFg/maxresdefault.jpg',
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        onTap: () => Get.to(DetailCardio(
                          url: item.link!,
                          nameCarido: item.name!,
                        )),
                      ),
                      Positioned(
                        bottom: 10,
                        left: 25,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: HexColor('#C4C4C4'),
                          ),
                          child: Text(
                            item.name!,
                            style: TextStyle(
                                fontFamily: 'Poppins-SemiBold', fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
        }),
      ),
    );
  }
}
