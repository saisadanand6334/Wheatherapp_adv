import 'package:flutter/material.dart';
import 'package:wheatherapp_adv/whether_data.dart';
import 'package:wheatherapp_adv/whether_models.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  temp(String day, String time, IconData icn, String tmp) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        color: Colors.blueGrey,
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Icon(
                  icn,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  tmp,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  wind(String cond, String spid) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                cond,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                spid,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  Whetherdata service = Whetherdata();
  Wether w = new Wether();

  String Condi = '';
  String Tmes = '';
  String Iccons = '';
  double Tempere = 0;
  double Laati = 0;
  double Longi = 0;

  List<String> country = ['India', 'London', 'Kerala', 'Delhi', 'USA'];
  String? valueChoose;

  @override
  void initState() {
    super.initState();
    Wheterdetails();
  }

  void Wheterdetails() async {
    w = await service.getWhetherData(
      valueChoose.toString()=="null"?"kerala":valueChoose.toString()
    );
    setState(() {
      Laati = w.lat;
      Longi = w.lon;
      Tempere = w.temp_c;
      Condi = w.condition;
      Tmes = w.time;
      Iccons = w.icn;
      print(w.temp_c);
      print(w.lat);
      print(w.lon);
      print(w.condition);
      print(w.time);
      print(w.icn);

    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xcFF0ED3AC),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "${Tmes}",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(value: valueChoose,
                onChanged: ( newValue) {
                  setState(() {
                    valueChoose = newValue.toString();
                    Wheterdetails();

                  });
                },
                items: country.map((valueItem)=>
                  DropdownMenuItem(
                    value: valueItem,
                    child: Text(valueItem),
                  )
                ).toList(),
              ),
              // Text(
              //   "${valueChoose}",
              //   style: TextStyle(
              //       fontWeight: FontWeight.bold,
              //       letterSpacing: 8,
              //       color: Colors.white,
              //       fontSize: 40),
              // ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                w.condition.toString(),
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_cloudy_outlined,
                size: 50,
                color: Colors.grey,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${Tempere}",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              Text(
                "°C",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Latitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Laati}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 40,
                width: 2,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "Longitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${Longi}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                temp("MON", "5PM", Icons.thunderstorm, "15°C"),
                temp("TUE", "6PM", Icons.thunderstorm, "18°C"),
                temp("WED", "7PM", Icons.thunderstorm, "29°C"),
                temp("THU", "8PM", Icons.thunderstorm, "32°C"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wind("Wind Speed", "5.1 m/s"),
                wind("Sun Rise", "5:54 AM"),
                wind("SunSet", "6:47 PM"),
                wind("Humidity", "52%"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
