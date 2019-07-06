import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:flutter_calendar_carousel/classes/event.dart';
import 'package:flutter_calendar_carousel/classes/event_list.dart';
import 'package:bottom_sheet_app/components/bottom_sheet.dart';

const kOrderItemTextStyle = TextStyle(
  fontSize: 7,
);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String data = 'data';
  int veg = 0;
  int nonVeg = 0;

  EventList<Event> _markedDateMap = EventList<Event>(
    events: {
      DateTime(2019, 7, 10): [
        Event(
          date: DateTime(2019, 7, 10),
          veg: 12,
          nonVeg: 16,
        )
      ],
      DateTime(2019, 7, 10): [
        Event(
          date: DateTime(2019, 7, 10),
          veg: 12,
          nonVeg: 16,
        )
      ],
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        backgroundColor: Colors.pink,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              CalendarCarousel(
                weekDayMargin: EdgeInsets.symmetric(vertical: 10.0),
                dayPadding: 0.0,
                height: 420.0,
                todayTextStyle: TextStyle(fontSize: 20.0),
                daysTextStyle: TextStyle(
                  fontSize: 12.0,
                ),
                daysHaveCircularBorder: false,
                selectedDayButtonColor: Colors.blueGrey.shade100,
                onDayPressed: (DateTime date, List<Event> events) {
                  bottomModal(date);
                },
                markedDatesMap: _markedDateMap,
                markedDateIconBuilder: (event) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        child: Text(
                          'veg: ${event.veg}',
                          style: kOrderItemTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.greenAccent,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 1),
                      ),
                      Container(
                        child: Text(
                          'n-veg: ${event.nonVeg}',
                          style: kOrderItemTextStyle,
                          textAlign: TextAlign.center,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.redAccent,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 2),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void bottomModal(DateTime date) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          color: Color(0xFF737373),
          height: 300.0,
          padding: EdgeInsets.all(10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
            ),
            padding: EdgeInsets.all(15.0),
            child: BottomModalSheet(
              date: date,
              valueChanged: (data) {
                setState(() {
                  _markedDateMap.add(
                    date,
                    Event(
                      date: date,
                      veg: data['veg'],
                      nonVeg: data['nonVeg'],
                    ),
                  );
                });
              },
            ),
          ),
        );
      },
    );
  }
}
