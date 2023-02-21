class PackageModel {
  String imsak;
  String gunes;
  String ogle;
  String ikindi;
  String aksam;
  String yatsi;
  PackageModel({
    required this.imsak,
    required this.gunes,
    required this.ogle,
    required this.ikindi,
    required this.aksam,
    required this.yatsi,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
        imsak: map['imsak'] ?? '',
        gunes: map['gunes'] ?? '',
        ogle: map['ogle'] ?? '',
        ikindi: map['ikindi'] ?? '',
        aksam: map['aksam'] ?? '',
        yatsi: map['yatsi'] ?? '');
  }
}
