import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zad_academy/data/data_hub.dart';
import 'package:zad_academy/hub/constant_values.dart';
import 'package:zad_academy/hub/widgets/common_code.dart';

import '../../services/level_provider.dart';
import '../ads_views/interesitial_ads.dart';

class MaterialView extends StatefulWidget {
  static String id = "material_view";

  const MaterialView({Key? key}) : super(key: key);

  @override
  State<MaterialView> createState() => _MaterialViewState();
}

class _MaterialViewState extends State<MaterialView> {
  final interAd = InterstitialAdMobView();

  @override
  void initState() {
    interAd.createAd();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // materials
  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    final subjectData = Provider.of<LevelProvider>(context);
    return Scaffold(
      appBar: popularAppBar(title: subjectData.getSubjectData().subjectName),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          GridView(
            padding: const EdgeInsets.all(4),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio:
                  orientation == Orientation.landscape ? 16 / 4 : 2.1,
              crossAxisSpacing: 2,
            ),
            children: materials
                .map(
                  (material) => InkWell(
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(returnHeight(context) * 0.03),
                      child: Card(
                        elevation: 4,
                        margin: EdgeInsets.symmetric(
                          horizontal: returnWidth(context) * 0.008,
                          vertical: returnHeight(context) * 0.01,
                        ),
                        child: GridTile(
                          footer: Container(
                            color: ConstantValues.prmColor,
                            child: AutoSizeText(
                              material.materialName,
                              textAlign: TextAlign.center,
                              presetFontSizes: const [22, 21, 20],
                              textScaleFactor: 1.2,
                            ),
                          ),
                          child: Image.asset(
                            material.materialImageUrl,
                            fit: BoxFit.fill,
                            filterQuality: FilterQuality.high,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      interAd.showAd();
                      subjectData.getMaterialIndex(material.materialId);
                      Navigator.of(context).pushNamed(
                        material.materialDestination,
                      );
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
