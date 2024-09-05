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

  void _showParsedData(BuildContext context, List<AndroidVersion> versions,
      List<AndroidVersion> data) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            // Ensures the dialog sizes to its content
            children: [
              Text('Parsed Versions',
                  style: AppTextStyles.titleStyle(
                      color: Colors.green.shade800, fontSize: 22)),
              const SizedBox(height: 16),
              SizedBox(
                height: 30, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: versions.length > 4 ? 3 : versions.length,
                  itemBuilder: (context, index) {
                    final version = versions[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${version.title}',
                          style: AppTextStyles.normalStyle()),
                    );
                  },
                ),
              ),
              versions.length > 4
                  ? SizedBox(
                      height: 30, // Adjust height as needed
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: versions.length > 4 ? 3 : versions.length,
                        itemBuilder: (context, index) {
                          final version = versions[index + 3];
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text('${version.title}',
                                style: AppTextStyles.normalStyle()),
                          );
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
              SizedBox(
                height: 30, // Adjust height as needed
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final version = data[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('${version.title}',
                          style: AppTextStyles.normalStyle()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text('Close',
                    style: AppTextStyles.normalStyle(color: Colors.green)),
              ),
            ],
          ),
        ),
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
                  List<AndroidVersion> data = repository.getData(input1);
                  _showParsedData(context, versions, data);
                },
              ),
              const SizedBox(height: 20),
              BuildGradientButton(
                text: 'Show Input 2',
                onPressed: () {
                  List<AndroidVersion> versions =
                      repository.getVersions(input2);
                  List<AndroidVersion> data = repository.getData2(input2);
                  _showParsedData(context, versions, data);
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
