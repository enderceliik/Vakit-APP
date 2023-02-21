import 'package:vakit_app/service/http_service.dart';
import 'package:vakit_app/service/scraper_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/package_model.dart';

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(formattedCurrentDate),
      ),
      body: FutureBuilder(
        future: getDataFromWeb(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 40.0,horizontal: 50.0),
                child: Column(    
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.imsak.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.gunes.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.ogle.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.ikindi.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.aksam.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0,),
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        decoration: _boxDecorationStyle(),
                        child: Expanded(
                          child: Text(
                            snapshot.data!.yatsi.toString(),style: const TextStyle(backgroundColor: Colors.amber),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  BoxDecoration _boxDecorationStyle() {
    return BoxDecoration(
      border: Border.all(width: 2.0, color: Colors.deepPurple),
      color: Colors.white,
      borderRadius: BorderRadius.circular(
        16.0,
      ),
    );
  }
}
