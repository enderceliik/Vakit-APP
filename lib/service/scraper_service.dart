import 'dart:developer';

import 'package:vakit_app/models/package_model.dart';
import 'package:beautiful_soup_dart/beautiful_soup.dart';

class ScraperService {
  static PackageModel? run(String html){
    // try{
    //   final soup = BeautifulSoup(html);
    //   print("soup: " +  soup.toString() + "\n");
    //   final items = soup.findAll('li',class_: 'mg-b-10');

    //   print("items: " + items.toString() + "\n");
    //   var item;
      
    //   for (var item in items)
    //   {
    //     final title = item.find('div', class_: 'name ellipsis')?.text??'';
    //     print("title: " + title + "\n");

    //   }
    //   print(items);
    //   final time = 'ender';
    //   List<PackageModel> packages = [];
    //   PackageModel model = PackageModel(time: time);
    //   packages.add(model);
    //   return packages;
    // }
    try{
      final soup = BeautifulSoup(html);
      //print("soup: " +  soup.toString() + "\n");
      final items = soup.findAll('div',class_: 'col-lg-4 col-md-6 vakit-item mb-5 remain-timer');
      //print("items: " + items.toString() + "\n");
      for (var item in items)
      {
        final imsak = item.find('span', class_: 'prayer-time imsak')?.text??'';
        final gunes = item.find('span', class_: 'prayer-time gunes')?.text??'';
        final ogle = item.find('span', class_: 'prayer-time ogle')?.text??'';
        final ikindi = item.find('span', class_: 'prayer-time ikindi')?.text??'';
        final aksam = item.find('span', class_: 'prayer-time aksam')?.text??'';
        final yatsi = item.find('span', class_: 'prayer-time yatsi')?.text??'';
        // print("imsak: " + imsak + "\n");
        // print("gunes: " + gunes + "\n");
        // print("ogle: " + ogle + "\n");
        // print("ikindi: " + ikindi + "\n");
        // print("aksam: " + aksam + "\n");
        // print("yatsi: " + yatsi + "\n");

        PackageModel model = PackageModel(imsak: imsak, gunes: gunes, ogle: ogle, ikindi: ikindi, aksam: aksam,yatsi: yatsi);
        return model;
      }    
    }
    catch(e)
    {
      log('ScraperService => $e');
    }
    return null;

  }
}