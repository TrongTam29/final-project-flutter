import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:my_app/constants.dart';

class CaculateBMI extends StatefulWidget {
  CaculateBMI({Key key}) : super(key: key);

  @override
  _CaculateBMIState createState() => _CaculateBMIState();
}

class _CaculateBMIState extends State<CaculateBMI> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ExpandableNotifier(
      child: Container(
        child: Column(
          children: [
            Image.asset(
              'assets/images/caculate_BMI.png',
              width: size.width * 0.9,
              height: size.height * 0.1 + 10,
              fit: BoxFit.fill,
            ),
            ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                ),
                expanded: BMI_Container(size: size),
                collapsed: Text(
                  '',
                  softWrap: true,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                builder: (_, expanded, collapsed) {
                  return Expandable(
                    expanded: expanded,
                    collapsed: collapsed,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: camel_case_types
class BMI_Container extends StatelessWidget {
  const BMI_Container({
    Key key,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      width: size.width * 0.9,
      height: size.height * 0.5,
      color: kBMI_Caculator,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.white,
                child: Text(
                  'Male',
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                color: Colors.white,
                child: Text(
                  'Female',
                ),
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Text('Age:'),
          //     TextField(
          //       onChanged: (value) {},
          //       decoration: InputDecoration(
          //         hintText: 'Search',
          //       ),
          //     )
          //   ],
          // )
        ],
      ),
    );
  }
}
