import 'package:flutter/material.dart';

import '../../hub/widgets/common_code.dart';
import '../../viewModels/content_view_model/categories_view_model.dart';

class CategoriesView extends StatefulWidget {
  static String id = "categories_view";
  const CategoriesView({Key? key}) : super(key: key);

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  final categoryData = CategoriesViewModel();

  @override
  Widget build(BuildContext context) {
    var dataFromHome = ModalRoute.of(context)?.settings.arguments as List;
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: popularAppBar(title: dataFromHome[0].toString()),
      backgroundColor: const Color.fromRGBO(240, 248, 255, 1),
      body: Stack(
        children: [
          GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
              childAspectRatio: orientation == Orientation.landscape ? 1.3 : 1,
              crossAxisSpacing: orientation == Orientation.landscape ? 4 : 2,
            ),
            itemCount: 7,
            itemBuilder: (context, index) {
              return InkWell(
                child: Card(
                  elevation: 8,
                  child: Image.asset(
                    categoryData.categoryImage[index],
                    filterQuality: FilterQuality.high,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed(
                    "course_view",
                    arguments: [
                      categoryData.categories[index],
                      dataFromHome[0],
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
