import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:characters/characters.dart';
import 'package:weather/models/weather_locations.dart';
import 'package:weather/widgets/single_weather.dart';
import 'package:weather/widgets/slider_dot.dart';

class WeatherApp extends StatefulWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  State<WeatherApp> createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  int _currentPage = 0;
  late String bgImg;

  _onPageChanged(int index){
    setState(() {
      _currentPage=index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(""),
        leading: IconButton(
          icon: Icon(Icons.search, size: 30, color: Colors.white,), onPressed: () {  },
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(0, 0, 20, 0),
            child: IconButton(onPressed: (){}, icon:Icon(Icons.menu,size: 30,color: Colors.white,))
          ),
        ],
      ),
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/night.jpg',fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,),
            Container(
              decoration: BoxDecoration(color: Colors.black38),
            ),
            Container(
              margin: EdgeInsets.only(top: 80,left: 15),
              child: Row(
                children: [
                  for(int i=0; i<locationList.length; i++)
                    if(i = _currentPage)
                    SliderDot(true)
                    else
                      SliderDot(false)
                  /*Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: 12,
                    height: 5,
                    decoration: BoxDecoration(color: Colors.white54,borderRadius: BorderRadius.all(Radius.circular(5))),
                  ),*/
                ],
              ),
            ),
            PageView.builder(
              scrollDirection: Axis.horizontal,
              onPageChanged: _onPageChanged,
              itemCount: locationList.length,
                itemBuilder:(ctx, i)=>SingleWeather(i),
            ),

          ],
        ),
      ),
    );
  }
}
