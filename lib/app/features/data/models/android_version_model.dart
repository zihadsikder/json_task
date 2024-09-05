import '../../domain/entities/android_version.dart';

class AndroidVersionModel extends AndroidVersion {
  AndroidVersionModel({
    super.id,
    super.title,
  });

  factory AndroidVersionModel.fromJson(Map<String, dynamic> json) {
    return AndroidVersionModel(
      id: json['id'],
      title: json['title'],
    );
  }
}
