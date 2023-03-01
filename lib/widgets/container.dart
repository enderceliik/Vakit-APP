import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  String vTime, vName;
  ContainerWidget({super.key, required this.vTime, required this.vName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: _assetImage(),
            fit: BoxFit.fill,
          ),
          border: Border.all(
            width: 2.0,
            color: Colors.grey.shade100,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(
            16.0,
          ),
        ),
        child: Expanded(
          child: Text(
            vTime,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 54.0,
              color: Colors.white.withOpacity(
                0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }

  AssetImage _assetImage() {
    if (vName == 'imsak') {
      return const AssetImage('lib/assets/images/imsak_vakti_1.jpg');
    }
    if (vName == 'gunes') {
      return const AssetImage('lib/assets/images/gunes_vakti_1.jpg');
    }
    if (vName == 'ogle') {
      return const AssetImage('lib/assets/images/ogle_namazi_1.jpg');
    }
    if (vName == 'ikindi') {
      return const AssetImage('lib/assets/images/ikindi_namazi_1.jpg');
    }
    if (vName == 'aksam') {
      return const AssetImage('lib/assets/images/aksam_namazi_1.jpg');
    }
    if (vName == 'yatsi') {
      return const AssetImage('lib/assets/images/yatsi_namazi_1.jpg');
    }
    return const AssetImage('lib/assets/images/exclamation.jpg');
  }
}
