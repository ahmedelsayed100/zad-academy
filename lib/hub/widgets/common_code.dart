import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'repeated_data.dart';

// import 'package:awesome_notifications/awesome_notifications.dart';
popularAppBar({title}) {
  return AppBar(
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
    title: Text(title),
    elevation: 2,
  );
}

returnWidth(context) {
  return MediaQuery.of(context).size.width;
}

returnHeight(context) {
  return MediaQuery.of(context).size.height;
}

buildAlertDialogForProgress({context, progressvValue}) {
  return Dialog(
    elevation: 8,
    alignment: Alignment.center,
    child: Container(
      alignment: Alignment.center,
      height: returnHeight(context) * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            value: progressvValue,
            backgroundColor: Colors.white,
            strokeWidth: 4.0,
            valueColor: const AlwaysStoppedAnimation(
              Colors.amber,
            ),
          ),
          SizedBox(
            height: returnHeight(context) * 0.02,
          ),
          const AutoSizeText(
            "....جاري التحميل",
            maxLines: 1,
            presetFontSizes: [20, 18, 17],
          ),
        ],
      ),
    ),
  );
}

Widget buildcontnetAutoSizeText({contnet}) {
  return AutoSizeText(
    contnet,
    textAlign: TextAlign.right,
    textDirection: TextDirection.rtl,
    softWrap: true,
    style: const TextStyle(
      // fontFamily: 'ArefRuqaa',
      fontWeight: FontWeight.w600,
    ),
    overflow: TextOverflow.fade,
    stepGranularity: 1.0,
    presetFontSizes: const [21, 20, 19, 18],
  );
}

class ErrorImage extends StatelessWidget {
  const ErrorImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: ExactAssetImage("assets/images/connection.jpg"),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}

ElevatedButton buildCustomElevatedButton({context, label, fun, color}) {
  return ElevatedButton(
    onPressed: fun,
    style: ElevatedButton.styleFrom(
      elevation: 5,
      backgroundColor: Colors.orangeAccent,
      padding: EdgeInsets.symmetric(
        vertical: returnHeight(context) * 0.01,
        horizontal: returnWidth(context) * 0.17,
      ),
    ),
    child: AutoSizeText(
      "$label",
      style: const TextStyle(color: Colors.white),
      presetFontSizes: const [22, 21, 20],
    ),
  );
}

Widget soundControlIconButton({icon, url, func, color}) {
  return CircleAvatar(
    backgroundColor: Colors.white,
    radius: 30,
    child: IconButton(
      color: color,
      onPressed: func,
      icon: Icon(
        icon,
        size: 30,
      ),
    ),
  );
}

Widget listTileItem({title, icon, func}) {
  return ListTile(
    title: AutoSizeText(
      title,
      presetFontSizes: const [20, 19],
      style: const TextStyle(
        fontFamily: 'Lattef',
        fontWeight: FontWeight.w500,
      ),
    ),
    trailing: Icon(
      icon,
      size: 28,
      color: ConstantValues.blackColor,
    ),
    onTap: func,
  );
}

Widget buildLoadingContainer() {
  return Container(
    alignment: Alignment.center,
    color: Colors.white,
    child: const CircularProgressIndicator(
      color: Colors.amber,
    ),
  );
}

//===================this part for audio player file ===================
Widget buildIconAvatar({context}) {
  return CircleAvatar(
    backgroundColor: Colors.orangeAccent,
    radius: returnWidth(context) * 0.35,
    child: Icon(
      Icons.music_note,
      size: returnWidth(context) * 0.35,
      color: Colors.white,
    ),
  );
}

Widget buildLessonLable({label}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: AutoSizeText(
        label,
        presetFontSizes: const [22, 21, 20],
        maxLines: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.amber,
          fontWeight: FontWeight.w600,
        ),
      ),
    ),
  );
}

Widget buildHeightSpace({highValue, context}) {
  return SizedBox(
    height: returnHeight(context) * highValue,
  );
}

Widget buildNoInternetWarning({context}) {
  return Container(
    padding: EdgeInsets.all(returnWidth(context) * 0.02),
    margin: EdgeInsets.only(bottom: returnHeight(context) * 0.02),
    color: Colors.white,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        Icon(Icons.wifi_off_outlined, color: Colors.amber),
        Text(
          "الإتصال بالإنترنت مقطوع",
          style: TextStyle(fontSize: 20, color: Colors.amber),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}
//===========================================================
