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
