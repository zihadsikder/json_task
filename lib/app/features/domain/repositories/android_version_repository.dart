import '../entities/android_version.dart';

abstract class AndroidVersionRepository {
  List<AndroidVersion> getVersions(dynamic json);
  List<AndroidVersion> getData(dynamic json);
}
