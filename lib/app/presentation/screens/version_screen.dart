import 'package:flutter/material.dart';

import '../../core/config/app_colors.dart';
import '../../core/config/app_text_style.dart';
import '../../features/data/repositories/android_version_repository_impl.dart';
import '../../features/domain/entities/android_version.dart';
import '../../features/data/data_source/store_inputes.dart';
import '../widgets/build_gradient_button.dart';

class VersionScreen extends StatelessWidget {
  VersionScreen({super.key});

  final AndroidVersionRepositoryImpl repository =
      AndroidVersionRepositoryImpl();

  void _showParsedData(BuildContext context, List<AndroidVersion> versions) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        backgroundColor: Colors.white,
        title: Text('Parsed Versions',
            style: AppTextStyles.titleStyle(
                color: Colors.green.shade800, fontSize: 22)),
        content: SingleChildScrollView(
          child: ListBody(
            children: versions
                .map((version) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Text('${version.id}: ${version.title}',
                          style: AppTextStyles.normalStyle()),
                    ))
                .toList(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Close',
                style: AppTextStyles.normalStyle(color: Colors.green)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildGradientButton(
                text: 'Show Input 1',
                onPressed: () {
                  List<AndroidVersion> versions =
                      repository.getVersions(input1);
                  _showParsedData(context, versions);
                },
              ),
              const SizedBox(height: 20),
              BuildGradientButton(
                text: 'Show Input 2',
                onPressed: () {
                  List<AndroidVersion> versions =
                      repository.getVersions(input2);
                  _showParsedData(context, versions);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar get buildAppBar {
    return AppBar(
      title: Text(
        'Android Versions',
        style: AppTextStyles.titleStyle(color: Colors.black, fontSize: 20),
      ),
      centerTitle: true,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: AppColors.appGradient,
          borderRadius:
              const BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
      ),
    );
  }
}
