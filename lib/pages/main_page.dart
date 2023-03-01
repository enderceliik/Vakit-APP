import 'package:vakit_app/service/http_service.dart';
import 'package:vakit_app/service/scraper_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/package_model.dart';
import '../widgets/container.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String formattedCurrentDate = '';

  @override
  void initState() {
    super.initState();
    var now = DateTime.now();
    var formatter = DateFormat('dd.MM.yyyy');
    String formattedDate = formatter.format(now);
    setState(() {
      formattedCurrentDate = formattedDate;
    });
  }

  Future<PackageModel?> getDataFromWeb() async {
    final html = await HttpService.get();
    if (html != null) return ScraperService.run(html);
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 44, 52, 58),
        appBar: AppBar(
          backgroundColor: Colors.grey.shade900,
          title: Text(
            formattedCurrentDate,
            style: const TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
        body: FutureBuilder(
          future: getDataFromWeb(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 30.0,
                    horizontal: 40.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ContainerWidget(
                        vTime: snapshot.data!.imsak.toString(),
                        vName: 'imsak',
                      ),
                      _sizedBox(),
                      ContainerWidget(
                        vTime: snapshot.data!.gunes.toString(),
                        vName: 'gunes',
                      ),
                      _sizedBox(),
                      ContainerWidget(
                        vTime: snapshot.data!.ogle.toString(),
                        vName: 'ogle',
                      ),
                      _sizedBox(),
                      ContainerWidget(
                        vTime: snapshot.data!.ikindi.toString(),
                        vName: 'ikindi',
                      ),
                      _sizedBox(),
                      ContainerWidget(
                        vTime: snapshot.data!.aksam.toString(),
                        vName: 'aksam',
                      ),
                      _sizedBox(),
                      ContainerWidget(
                        vTime: snapshot.data!.yatsi.toString(),
                        vName: 'yatsi',
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }

  SizedBox _sizedBox() {
    return const SizedBox(
      height: 4.0,
    );
  }
}
