import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_academy/hub/constant_values.dart';
import '../../data/data_hub.dart';
import '../../hub/widgets/common_code.dart';
import '../../services/level_provider.dart';

class SubjectView extends StatelessWidget {
  static String id = "subject_view";
  const SubjectView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final levelData = Provider.of<LevelProvider>(context);

    return Scaffold(
      appBar: popularAppBar(title: levelData.getLevelData().levelName),
      backgroundColor: ConstantValues.bgColor,
      body: Stack(
        children: [
          GridView(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.landscape ? 3 : 2,
              childAspectRatio: orientation == Orientation.landscape ? 1.3 : 1,
              crossAxisSpacing: orientation == Orientation.landscape ? 4 : 2,
            ),
            children: subjects
                .map(
                  (subject) => InkWell(
                    child: Card(
                      elevation: 8,
                      child: Image.asset(
                        subject.subjectImageUrl,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                    onTap: () {
                      levelData.getSubjectIndex(subject.subjectId);
                      Navigator.of(context).pushNamed("material_view");
                    },
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
