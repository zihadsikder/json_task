import '../../domain/entities/android_version.dart';
import '../../domain/repositories/android_version_repository.dart';
import '../../../core/utils/json_parser.dart';

class AndroidVersionRepositoryImpl implements AndroidVersionRepository {
  @override
  List<AndroidVersion> getVersions(dynamic json) {
    return parseJson(json);
  }

  @override
  List<AndroidVersion> getData(dynamic json) {
    return parseData(json);
  }

  List<AndroidVersion> getData2(dynamic json) {
    return parseData2(json);
  }
}
