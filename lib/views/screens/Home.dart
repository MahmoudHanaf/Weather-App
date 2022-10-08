import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_services.dart';
import 'package:weather_app/views/widgets/home_container.dart';

import '../../services/config_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherServices weather = WeatherServices();
  WeatherModel? dataModel;
  TextEditingController searchController = TextEditingController();

  //   @override
  // void initState() {
  //    weather.getWeather();
  //   super.initState();
  // }

  Future<void> getData() async {
    dataModel = await weather.getWeather("Cairo"); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(children: [
          UserAccountsDrawerHeader(
            accountName: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Text(ConfigurationService.prefs
                      ?.getString('email')
                      ?.split('@')[0] ??
                  '',
                   style: TextStyle(
                    color: Colors.white
                   ),
                  ),
            ),
            accountEmail:
          Text(ConfigurationService.prefs?.getString('email') ?? ''),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text(
                ConfigurationService.prefs
                        ?.getString('email')![0]
                        .toUpperCase() ??
                    '',
                style: TextStyle(fontSize: 35),
              ),
            ),
          ),
            ListTile(
              onTap: (){
                print(ConfigurationService.prefs?.getString('email'));
              },
              trailing: Icon(Icons.settings),
              title: Text('Settings'),
            ),
        ]),
      ),
      appBar: AppBar(
        title: Text("Weather Today",
            style: GoogleFonts.lobster(
              letterSpacing: 2,
            )),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(
              Icons.dark_mode_outlined,
              size: 25,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return HomeContainer(
                    dataModel: dataModel!, searchController: searchController);
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
