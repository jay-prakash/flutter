import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'round_buttons.dart';
import 'package:flutter_calendar_carousel/classes/event.dart';

class BottomModalSheet extends StatefulWidget {
  final DateTime date;
  final ValueChanged valueChanged;
  BottomModalSheet({this.date, this.valueChanged});

  @override
  _BottomModalSheetState createState() => _BottomModalSheetState();
}

class _BottomModalSheetState extends State<BottomModalSheet> {
  int veg = 0;
  int nonVeg = 0;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 3.0,
            width: 30.0,
            color: Colors.blueGrey.shade100,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(new DateFormat('yyyy-MM-dd').format(widget.date).toString()),
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Veg',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                Spacer(),
                RoundButton(
                  icon: Icons.remove,
                  onTap: () {
                    setState(() {
                      if (veg != 0) {
                        veg--;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  '$veg',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                RoundButton(
                  icon: Icons.add,
                  onTap: () {
                    setState(() {
                      veg++;
                    });
                  },
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.blueGrey.shade50,
                borderRadius: BorderRadius.circular(30.0)),
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 20.0),
            child: Row(
              children: <Widget>[
                Text(
                  'Non-Veg',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                Spacer(),
                RoundButton(
                  icon: Icons.remove,
                  onTap: () {
                    setState(() {
                      if (nonVeg != 0) {
                        nonVeg--;
                      }
                    });
                  },
                ),
                SizedBox(
                  width: 12.0,
                ),
                Text(
                  '$nonVeg',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                RoundButton(
                  icon: Icons.add,
                  onTap: () {
                    setState(() {
                      nonVeg++;
                    });
                  },
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
//              if (veg != 0 || nonVeg != 0) {
//                setState(() {
//                  global.eventss[widget.date] = [
//                    {'veg': veg, 'non-veg': nonVeg},
//                  ];
//                });
//              }
              var data = {'veg': veg, 'nonVeg': nonVeg};
              setState(() {
                widget.valueChanged(data);
              });

              Navigator.pop(context);
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ],
              ),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10.0)),
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 13.0),
            ),
          )
        ],
      ),
    );
  }
}
