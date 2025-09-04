import 'package:omdat_alhadeth/models/hadeth_model.dart';

class Constants {
  static final List<Book> books = [
    //book 1
    Book(
      bookName: 'كتاب الطهارة',
      doors: [
        Door(
          doorName: 'باب الاستطابة',
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن عمرَ بنِ الخطابِ رضي الله عنه قال: سمعتُ رسولَ الله ﷺ يقول: «إنما الأعمالُ بالنيَّاتِ – وفي روايةٍ: بالنيَّةِ – وإنما لكلِّ امرئٍ ما نوى. فمَن كانت هجرتُه إلى الله ورسولِه؛ فهجرتُه إلى الله ورسولِه. ومَن كانت هجرتُه إلى دنيا يُصيبُها أو امرأةٍ يتزوَّجُها؛ فهجرتُه إلى ما هاجرَ إليه».\u202C",
              hadethNumber: 1,
              soundUrl: '1.opus',
              explainUrl: '',
            ),
          ],
        ),
      ],
    ),
  ];
}
