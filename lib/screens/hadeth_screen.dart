import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/models/hadeth_model.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/widgets/hadethes_listView_widget.dart';

class HadethsScreen extends StatelessWidget {
  const HadethsScreen({
    super.key,
    required this.themeProvider,
    required this.doorName, required this.hadethes, required this.doorNumber, required this.bookNumber,
  });
  final ThemeProvider themeProvider;
  final String doorName;
  final List<Hadeth> hadethes;

  final int doorNumber;
  final int bookNumber;
  // final List<String> hadethText = const [
  //   "١ - عن أمير المؤمنين أبي حفص عمر بن الخطاب رضي الله عنه قال:\n"
  //       "سمعت رسول الله صلى الله عليه وسلم يقول:\n"
  //       "«إنما الأعمال بالنيات، وإنما لكل امرئ ما نوى، فمن كانت هجرته إلى الله ورسوله، "
  //       "فهجرته إلى الله ورسوله،\n"
  //       "ومن كانت هجرته لدنيا يصيبها أو امرأة ينكحها، فهجرته إلى ما هاجر إليه».",

  //   "٢ - عن أبي هريرة رضي الله عنه قال:\n"
  //       "قال رسول الله صلى الله عليه وسلم:\n"
  //       "«لا يقبل الله صلاة أحدكم إذا أحدث حتى يتوضأ».",

  //   "٣ - عن عبد الله بن عمر رضي الله عنهما قال:\n"
  //       "قال رسول الله صلى الله عليه وسلم:\n"
  //       "«لا تقبل صلاة بغير طهور، ولا صدقة من غلول».",

  //   "٤ - عن عبد الله بن عباس رضي الله عنهما قال:\n"
  //       "قال رسول الله صلى الله عليه وسلم:\n",

  //   "٥ - عن أبي هريرة رضي الله عنه قال:\n"
  //       "قال رسول الله صلى الله عليه وسلم:\n"
  //       "«إذا وجد أحدكم في بطنه شيئًا، فأشكل عليه: أخرج منه شيء أم لا؟ فلا يخرجن من المسجد حتى يسمع صوتًا أو يجد ريحًا».",
  // ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.getIsDarkTheme
            ? AppColors.darkScaffoldColor
            : AppColors.lightCardColor,
        title: Align(
          alignment: Alignment.centerRight,
          child: Text(doorName, style: TextStyle(fontFamily: 'Reem Kufi')),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.only(right: 9.0),
              child: Text(
                "الأحاديث الواردة في هذا الباب",
                textAlign: TextAlign.right,

                style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Amiri",
                  fontWeight: FontWeight.w100,
                  color: themeProvider.getIsDarkTheme
                      ? const Color.fromARGB(255, 255, 255, 255)
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            HadethesListView(
           bookNumber:bookNumber ,
           doorNumber: doorNumber,
              themeProvider: themeProvider,
            ),
          ],
        ),
      ),
    );
  }
}
