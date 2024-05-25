import 'package:flutter/material.dart';
import 'package:news_app/screens/news_tab.dart';
import 'package:news_app/shared/network/remote/api_manager.dart';

class DataTab extends StatelessWidget {
  String categoryId;

  DataTab({required this.categoryId, super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiManager.getSources(categoryId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return const Center(child: Text("No Sources"));
        }
        return NewsTab(
          sources: sourcesList,
        );
      },
    );
  }
}
