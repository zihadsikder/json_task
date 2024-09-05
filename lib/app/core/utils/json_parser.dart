import '../../features/data/models/android_version_model.dart';

List<AndroidVersionModel> parseJson(dynamic json) {
  List<AndroidVersionModel> versions = [];

  if (json is List) {
    for (var element in json) {
      versions.addAll(parseJson(element));
    }
  } else if (json is Map) {
    json.forEach((key, value) {
      if (value is Map) {
        versions
            .add(AndroidVersionModel.fromJson(value.cast<String, dynamic>()));
      }
    });
  }

  return versions;
}

List<AndroidVersionModel> parseData(dynamic json) {
  List<AndroidVersionModel> dataItems = [];

  if (json is List && json.length > 1) {
    var data = json[1] as List<dynamic>;

    // Parse data items
    for (var item in data) {
      if (item is Map) {
        dataItems
            .add(AndroidVersionModel.fromJson(item.cast<String, dynamic>()));
      }
    }
  }

  return dataItems;
}

List<AndroidVersionModel> parseData2(dynamic json) {
  List<AndroidVersionModel> dataItems = [];

  if (json is List && json.length > 1) {
    var data = json[2] as List<dynamic>;

    // Parse data items
    for (var item in data) {
      if (item is Map) {
        dataItems
            .add(AndroidVersionModel.fromJson(item.cast<String, dynamic>()));
      }
    }
  }

  return dataItems;
}
