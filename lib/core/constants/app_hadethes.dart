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
              soundUrl: 'assets/sounds/1.ogg',
              explainUrl: 'https://youtu.be/UecgSkzVn-M?si=_gUV1i1o8N8LYP0V',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه قال: قال رسولُ اللهِ ﷺ: «لا يَقبَلُ اللهُ صلاةَ أحدِكم إذا أَحدَثَ حتى يَتوضَّأَ». متفقٌ عليه.\u202C",
              hadethNumber: 2,
              soundUrl: 'assets/sounds/2.ogg',
              explainUrl: 'https://youtu.be/IBrOhe6qJB8?si=_buSz7w8iMUFMr_K',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عبدِ اللهِ بنِ عمرو بنِ العاصِ، وأبي هُرَيرةَ، وعائشةَ رضيَ اللهُ عنهم قالوا: قال رسولُ اللهِ ﷺ: «وَيْلٌ لِلأَعْقابِ مِنَ النَّارِ».\u202C",
              hadethNumber: 3,
              soundUrl: 'assets/sounds/3.ogg',
              explainUrl: 'https://youtu.be/PMkA3Z9tp90?si=RFteksH7lPV_unvm',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه أنَّ رسولَ اللهِ ﷺ قال:\n«إذا توضَّأ أحدُكم فليجعلْ في أنفِه ماءً ثم لينتثِرْ. ومنِ استجمرَ فليوترْ. وإذا استيقظَ أحدُكم من نومِه فليغسِلْ يدَيْهِ قبلَ أن يُدخِلَهُما في الإناءِ ثلاثًا، فإنَّ أحدَكم لا يدري أين باتت يدُه».\nوفي لفظٍ لمسلم: «فليستنشقْ بمنخريهِ من الماء».\nوفي لفظٍ: «من توضأ فليستنشق».\u202C",

              hadethNumber: 4,
              soundUrl: 'assets/sounds/4.ogg',
              explainUrl: 'https://youtu.be/9Md9J2EZjco?si=Ulg5oynXsDh7bGdE',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه أنَّ رسولَ اللهِ ﷺ قال:\n«لا يَبولنَّ أحدُكم في الماءِ الدائمِ الذي لا يَجري، ثم يغتسلُ فيه».\nوفي روايةٍ لمسلم: «لا يغتسلُ أحدُكم في الماءِ الدائم وهو جُنُب».\nوهو صحيح.\u202C",
              hadethNumber: 5,
              soundUrl: 'assets/sounds/5.ogg',
              explainUrl: 'https://youtu.be/6Pb3Z7Cc9Bo?si=CTn4TmyYnyZQyW82',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه أنَّ رسولَ اللهِ ﷺ قال:\n"
                  "\u2067\u00ABإذا شَرِبَ الكلبُ في إناءِ أحدِكم فليغسِلْهُ سبعًا\u00BB\u2069.\n"
                  "ولمسلم: \u2067\u00ABأولاهنَّ بالتراب\u00BB\u2069.\n"
                  "وفي حديثِ عبدِ اللهِ بنِ مُغفَّلٍ المُزَنيِّ قال: قال رسولُ اللهِ ﷺ:\n"
                  "\u2067\u00ABإذا ولغَ الكلبُ في الإناء فاغسلوهُ سبعًا، وعَفِّروهُ الثامنةَ بالتراب\u00BB\u2069.\u202C",
              hadethNumber: 6,
              soundUrl: "assets/sounds/6.ogg",
              explainUrl: "https://youtu.be/56KwB_Almwc?si=NaztyLZ6BSBSFQge",
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن حُمرانَ مولى عُثمانَ بنِ عفّانَ رضيَ اللهُ عنه: أنَّه رأى عُثمانَ دعا بوُضوءٍ، فأفرغ على يديه من إنائه فغسلهما ثلاثَ مرّات.\n"
                  "ثم أدخل يمينَه في الوُضوء، ثم تمضمضَ واستنشقَ واستنثرَ.\n"
                  "ثم غسلَ وجهَه ثلاثًا، ويدَيْهِ إلى المِرفقين ثلاثًا.\n"
                  "ثم مسحَ برأسِه، ثم غسلَ رجلَيْهِ ثلاثًا.\n"
                  "ثم قال: رأيتُ النبيَّ ﷺ يتوضّأ نحوَ وُضوئي هذا.\n"
                  "وقال: \u2067\u00ABمن توضّأ نحوَ وُضوئي هذا، ثم صلّى ركعتين لا يُحدِّثُ فيهما نفسَه؛ غُفِر له ما تقدَّمَ من ذنبِه\u00BB\u2069.\u202C",
              hadethNumber: 7,
              soundUrl: 'assets/sounds/7.ogg',
              explainUrl: 'https://youtu.be/VJ59ZV2Xb2w?si=JjnBbnP6qzdk9srj',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عمروِ بنِ يَحيى المازِنيِّ، عن أبيه قال: \u2067\u00ABشَهِدتُ عمروَ بنَ أبي حَسَنٍ سأل عبدَ اللهِ بنَ زيدٍ رضيَ اللهُ عنه عن وُضوءِ النبيِّ ﷺ، فدَعا بتَوْرٍ من ماءٍ، فتوضّأ لهم وُضوءَ النبيِّ ﷺ\u00BB\u2069.\n"
                  "فأكفأ على يديه من التَّوْرِ فغَسَلَهما ثلاثًا.\n"
                  "ثم أدخل يمينَه في التَّوْرِ فتمضمضَ واستنشقَ واستنثرَ ثلاثًا ثلاثَ غَرَفاتٍ.\n"
                  "ثم أدخل يدَه فغسل وجهَه.\n"
                  "ثم أدخل يدَه فغسل يدَيْهِ إلى المِرفقَيْن مرتينِ مرتينِ.\n"
                  "ثم أدخل يدَه فمسح رأسَه فأقبلَ بهما وأدبرَ مرّةً واحدةً.\n"
                  "ثم غسل رِجلَيْهِ.\n"
                  "وفي روايةٍ: \u2067\u00ABبدأ بمُقدَّمِ رأسِه حتى ذهبَ بهما إلى قفاه، ثم رَدَّهما حتى رجع إلى المكانِ الذي بدأ منه\u00BB\u2069.\n"
                  "وفي روايةٍ: \u2067\u00ABأتانا رسولُ اللهِ ﷺ فأخرجْنا له ماءً في تَوْرٍ من صُفْرٍ\u00BB\u2069.\u202C",
              hadethNumber: 8,
              soundUrl: 'assets/sounds/8.ogg',
              explainUrl: 'https://youtu.be/YaFHBq39kYM?si=es0iS2QCRscA9r6g',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عائشةَ رضيَ اللهُ عنها قالت:\n"
                  "\u2067\u00ABكان النبيُّ ﷺ يُعجِبُه التَّيَمُّنُ في تَنَعُّلِهِ وتَرَجُّلِهِ وطُهورِهِ، وفي شأنِهِ كلِّهِ\u00BB\u2069.\u202C",
              hadethNumber: 9,
              soundUrl: 'assets/sounds/9.ogg',
              explainUrl: 'https://youtu.be/9hQv55pjFF8?si=56TJe4xNmqFj00vH',
            ),

            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه، عن النبيِّ ﷺ أنَّه قال:\n"
                  "\u2067\u00ABإنَّ أُمَّتي يأتونَ يومَ القيامةِ غُرًّا مُحَجَّلِينَ من آثارِ الوضوءِ، فمَنِ استطاعَ منكم أنْ يُطيلَ غُرَّتَهُ فليفعَل\u00BB\u2069.\n"
                  "وفي روايةٍ: عن نُعيمِ بنِ عبدِ اللهِ المُجْمِّرِ، عن أبي هريرةَ رضيَ اللهُ عنه، عن النبيِّ ﷺ مثلَه.\n"
                  "ثم قال: رأيتُ أبا هريرةَ يتوضّأُ، فغسَلَ وجهَه ويدَيْه حتى كادَ يَبلُغُ المَنْكِبَيْن، ثم غسَلَ رِجلَيْهِ حتى كادَ يَبلُغُ السَّاقَيْن؛ ثم قال: سمعتُ رسولَ اللهِ ﷺ يقول:\n"
                  "\u2067\u00ABتبلُغُ الحِلْيَةُ من المؤمنِ حيثُ يبلُغُ الوضوءُ\u00BB\u2069.\n"
                  "وفي لفظِ مسلم: \u2067\u00ABسمعتُ خَليلِي يقول: تبلُغُ الحِلْيَةُ من المؤمنِ حيثُ يبلُغُ الوضوءُ\u00BB\u2069.\u202C",
              hadethNumber: 10,
              soundUrl: 'assets/sounds/10.ogg',
              explainUrl: 'https://youtu.be/U8dRtBjqHA4?si=atKxLiRdg-cM0Wd_',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أنسِ بنِ مالكٍ رضيَ اللهُ عنه: أنَّ النبيَّ ﷺ كان إذا دخل الخلاء قال: \u2067\u00ABاللهم إني أعوذ بك من الخُبُثِ والخبائث\u00BB\u2069.\n\nالخُبُثُ: بضمِّ الخاءِ والباءِ؛ جمعُ خبيثٍ.\nوالخَبائِثُ: جمعُ خبيثة، والمرادُ بها ذُكورُ الشياطين وإناثُهم.\u202C",
              hadethNumber: 11,
              soundUrl: 'assets/sounds/11.ogg',
              explainUrl: 'https://youtu.be/xoMloPVla0c?si=O9uyOTfqln-LCQ3x',
            ),

            Hadeth(
              hadethText:
                  "\u202Bعن أبي أيوبَ الأنصاريِّ رضيَ اللهُ عنه قال: قال رسولُ اللهِ ﷺ: «إذا أتيتم الغائطَ فلا تستقبلوا القِبلةَ ببولٍ ولا غائطٍ، ولا تستدبروها، ولكن شرِّقوا أو غرِّبوا».\n\nقال أبو أيوبَ: فقدمْنا الشامَ فوجدْنا مراحيضَ قد بُنيت نحو الكعبةِ، فننحرفُ عنها ونستغفرُ اللهَ تعالى.\n\nالغائط: المُطمئنُّ من الأرض، كانوا ينتابونه للحاجة، فكنّوا به عن نفس الحدث؛ كراهيةً لذكره بخاصِّ اسمِه.\nوالمِرْحاض: جمع المراحيض، وهو المُغتسَل، وهو أيضًا كِناية عن موضع الغائط.\u202C",
              hadethNumber: 12,
              soundUrl: 'assets/sounds/12.ogg',
              explainUrl: 'https://youtu.be/fXZHeVtOONM?si=C2yJ22L_A46MT91I',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عبدِ اللهِ بنِ عمرَ بنِ الخطابِ رضيَ اللهُ عنهما قال: «رقيتُ يومًا على بيتِ حفصةَ، فرأيتُ النبيَّ ﷺ يقضي حاجتَهُ مستقبِلَ الشامِ، مستدبِرَ الكعبةِ».\u202C",
              hadethNumber: 13,
              soundUrl: 'assets/sounds/13.ogg',
              explainUrl: 'https://youtu.be/LBf-FzQ2Xug?si=o-h76Pj0wl1phH75',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أنسِ بنِ مالكٍ رضيَ اللهُ عنه قال: «كان رسولُ اللهِ ﷺ يدخلُ الخلاءَ، فأحملُ أنا وغُلامٌ نحوي إداوةً من ماءٍ وعَنَزةً، فيستنجي بالماءِ».\n\nالعَنَزة: الحُرْبة الصغيرة.\u202C",
              hadethNumber: 14,
              soundUrl: 'assets/sounds/14.ogg',
              explainUrl: 'https://youtu.be/xHofKt-ySe4?si=aJ_C5SY7lxuFOQLz',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي قتادةَ الحارثِ بنِ ربعيٍّ الأنصاريِّ رضيَ اللهُ عنه أنَّ النبيَّ ﷺ قال: «لا يُمسِكَنَّ أحدُكم ذكرَهُ بيمينِه وهو يبولُ، ولا يتمسَّحْ من الخلاءِ بيمينِه، ولا يتنفَّسْ في الإناء».\u202C",
              hadethNumber: 15,
              soundUrl: 'assets/sounds/15.ogg',
              explainUrl: 'https://youtu.be/KsdqqnCWpVg?si=T2qOxFcgzUl4stHV',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عبدِ اللهِ بنِ عباسٍ رضيَ اللهُ عنهما قال: «مرَّ النبيُّ ﷺ بقبرين، فقال: إنهما ليُعذَّبان، وما يُعذَّبان في كبير؛ أمَّا أحدُهما فكان لا يَستترُ من البول، وأما الآخر فكان يمشي بالنميمة».\nفأخذ جريدةً رطبةً فشقَّها نصفين، فغرز في كلِّ قبرٍ واحدةً.\nفقالوا: يا رسولَ اللهِ! لمَ فعلتَ هذا؟ فقال: «لعلَّه يُخفَّفُ عنهما ما لم يَيْبَسا».\u202C",
              hadethNumber: 16,
              soundUrl: 'assets/sounds/16.ogg',
              explainUrl: 'https://youtu.be/Yr-rGACWnPg?si=5ZQBJngF8bbCiJOC',
            ),
          ],
        ),
        Door(
          doorName: 'باب السواك',
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرةَ رضيَ اللهُ عنه أنَّ رسولَ اللهِ ﷺ قال: «لولا أن أشقَّ على أمَّتي لأمرتُهم بالسِّواكِ عندَ كلِّ صلاةٍ».\u202C",
              hadethNumber: 17,
              soundUrl: 'assets/sounds/17.ogg',
              explainUrl: 'https://youtu.be/bdKl1D0qACY?si=I5dbOWDTA52Q4l-R',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن حُذَيفةَ بنِ اليَمان رضي الله عنه قال:\n"
                  "«كانَ النبي ﷺ إذا قامَ منَ الليلِ يَشوصُ فاهُ بالسِّواكِ».\n\n"
                  "يَشوص: معناه: يَغسِل؛ يُقال: شاصه يشوصه، ومَاصه يَموصه: إذا غسله.\u202C",
              hadethNumber: 18,
              soundUrl: 'assets/sounds/18.ogg',
              explainUrl: 'https://youtu.be/8xcsnqDjDDU?si=J13Ghzvd4j735PFh',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عائشة رضي الله عنها قالت: «دخل عبد الرحمن بن أبي بكر على النبي ﷺ وأنا مسندته إلى صدري، ومع عبد الرحمن سواك رطب يستن به، فأبصره رسول الله ﷺ ببصره، فأخذت السواك فقطعته فمضغته، ثم دفعته إلى النبي ﷺ فاستن به.\n\n"
                  "فما رأيت رسول الله ﷺ استن استناناً أحسن منه، فما عدا أن فرغ رسول الله ﷺ رفع يده – أو إصبعه – ثم قال: «في الرفيق الأعلى» ثلاثاً – ثم قضى. وكانت تقول: مات بين حاقنتي وذاقنتي».\n\n"
                  "وفي لفظ: «رأيته ينظر إليه» – وعرفت أنه يحب السواك – فقلت: آخذه لك؟ فأشار برأسه أن نعم».\n\n"
                  "لفظ البخاري، ولمسلم: نحوه.\u202C",
              hadethNumber: 19,
              soundUrl: 'assets/sounds/19.ogg',
              explainUrl: 'https://youtu.be/yBGPSqmCQlg?si=gPIh-qvysI67-bes',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي موسى رضي الله عنه قال: أتيت النبي ﷺ وهو يستاك بسواك، قال: وطرف السواك على لسانه، يقول: أع أع والسواك في فيه، كأنه يتهوع.\u202C",
              hadethNumber: 20,
              soundUrl: 'assets/sounds/20.ogg',
              explainUrl: 'https://youtu.be/5PmcD-4tcfc?si=TIwXUdsKVHGFoP4a',
            ),
          ],
        ),
        Door(
          doorName: 'باب المسح على الخفين',
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن المغيرة بن شعبة رضي الله عنه قال: كنت مع النبي ﷺ في سفر، فأهويت لأنزع خفيه، فقال: دعهما، فإني أدخلتهما طاهرتين، فمسح عليهما.\u202C",
              hadethNumber: 21,
              soundUrl: 'assets/sounds/21.ogg',
              explainUrl: 'https://youtu.be/NEwkpHznEog?si=CLpJqUA3ZmFMAZj4',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن حذيفة بن اليمان رضي الله عنه قال: كنت مع النبي ﷺ، فبال، وتوضأ، ومسح على خفيه. مختصر.\u202C",
              hadethNumber: 22,
              soundUrl: 'assets/sounds/22.ogg',
              explainUrl: 'https://youtu.be/dPrf1jy4hHU?si=GLXLyGdOiijJVemp',
            ),
          ],
        ),
        Door(
          doorName: "باب في المذي وغيره",
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن علي بن أبي طالب رضي الله عنه قال: كنت رجلاً مذاءً، فاستحييت أن أسأل رسول الله ﷺ لمكان ابنته، فأمرت المقداد بن الأسود فسأله، فقال: يغسل ذكره ويتوضأ.\n\n"
                  "وللبخاري: اغسل ذكرك وتوضأ.\n\n"
                  "ولمسلم: توضأ وانضح فرجك.\u202C",
              hadethNumber: 23,
              soundUrl: 'assets/sounds/23.ogg',
              explainUrl: 'https://youtu.be/dPrf1jy4hHU?si=_XqVxfLQWrHwFvCU',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عباد بن تميم، عن عبد الله بن زيد بن عاصم المازني رضي الله عنه قال: شكي إلى النبي ﷺ الرجل يخيل إليه أنه يجد الشيء في الصلاة، قال: لا ينصرف حتى يسمع صوتاً، أو يجد ريحاً.\u202C",
              hadethNumber: 24,
              soundUrl: 'assets/sounds/24.ogg',
              explainUrl: 'https://youtu.be/hZux9eUg9QY?si=3VEQCuIJtB_tpLK9',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أم قيس بنت محصن الأسدية رضي الله عنها: أنها أتت بابن لها صغير لم يأكل الطعام إلى رسول الله ﷺ فأجلسه رسول الله ﷺ في حجره، فبال على ثوبه، فدعا بماء فنضحه ولم يغسله.\u202C",
              hadethNumber: 25,
              soundUrl: 'assets/sounds/25.ogg',
              explainUrl: 'https://youtu.be/B-CVsCgxWws?si=4P9y9t7JAr3tVzis',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عائشة – أم المؤمنين – رضي الله عنها قالت: أن النبي ﷺ بصبي فبال على ثوبه، فدعا بماء فأتبعه إياه.\n\n"
                  "ولمسلم: فأتبعه بوله ولم يغسله.\u202C",
              hadethNumber: 26,
              soundUrl: 'assets/sounds/26.ogg',
              explainUrl: 'https://youtu.be/KCea7UVzM8s?si=9P44PyrzzcXrpFSQ',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أنس بن مالك رضي الله عنه قال: جاء أعرابي فبال في طائفة المسجد، فزجره الناس، فنهاهم النبي ﷺ، فلما قضى بوله أمر النبي ﷺ بذنوب من ماء فأهريق عليه.\u202C",
              hadethNumber: 27,
              soundUrl: 'assets/sounds/27.ogg',
              explainUrl: 'https://youtu.be/1h-wltVNivs?si=kfCmuKOY1B3qf8WT',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرة رضي الله عنه قال: سمعت النبي ﷺ يقول: الفطرة خمس: الختان، والاستحداد، وقص الشارب، وتقليم الأظفار، ونتف الإبط.\u202C",
              hadethNumber: 28,
              soundUrl: 'assets/sounds/28.ogg',
              explainUrl: 'https://youtu.be/ysPNgP1cqFU?si=pDZdeRbiKYCCyQm8',
            ),
          ],
        ),
        Door(
          doorName: 'باب الجنابة',
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرة رضي الله عنه: أن النبي ﷺ لقيه في بعض طرق المدينة وهو جنب، فانخنست منه، فذهبت فاغتسلت، ثم جئت، فقال: أين كنت يا أبا هريرة؟ قال: كنت جنباً فكرهت أن أجالسك وأنا على غير طهارة، فقال: سبحان الله! إن المؤمن لا ينجس.\n\n"
                  "انخنست: انسلكت.\u202C",
              hadethNumber: 29,
              soundUrl: 'assets/sounds/29.ogg',
              explainUrl: 'https://youtu.be/ZnIUe8-1k8o?si=9lmEirFU4dqNwG4C',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عائشة رضي الله عنها قالت: كان رسول الله ﷺ إذا اغتسل من الجنابة غسل يديه، وتوضأ وضوءه للصلاة، ثم اغتسل.\n\n"
                  "ثم يخلل بيديه شعره، حتى إذا ظن أنه قد أروى بشرته، أفاض عليه الماء ثلاث مرات.\n\n"
                  "ثم غسل سائر جسده.\n\n"
                  "وكانت تقول: كنت أغتسل أنا ورسول الله ﷺ من إناء واحد، نغترف منه جميعاً.\u202C",
              hadethNumber: 30,
              soundUrl: 'assets/sounds/30.ogg',
              explainUrl: 'https://youtu.be/1mNTudMqK_Q?si=OZBtSNo4HRtBFJa1',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن ميمونة بنت الحارث رضي الله عنها – زوج النبي ﷺ – قالت: توضأ رسول الله ﷺ وضوء الجنابة، فأكفأ بيمينه على يساره مرتين – أو ثلاثاً – ثم غسل فرجه، ثم ضرب يده بالأرض – أو الحائط – مرتين – أو ثلاثاً – ثم تمضمض واستنشق، وغسل وجهه وذراعيه، ثم أفاض على رأسه الماء، ثم غسل جسده.\n\n"
                  "ثم تنحى فغسل رجليه، فأتيته بخِرقة فلم يردها، فجعل ينفض الماء بيده.\u202C",
              hadethNumber: 31,
              soundUrl: 'assets/sounds/31.ogg',
              explainUrl: 'https://youtu.be/GBAF0Cx1IRY?si=jwuoKztqx_T-hvv_',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عبد الله بن عمر أن عمر بن الخطاب رضي الله عنه قال: يا رسول الله! أيرقد أحدنا وهو جنب؟ قال: نعم، إذا توضأ أحدكم فليرقد.\u202C",
              hadethNumber: 32,
              soundUrl: 'assets/sounds/32.ogg',
              explainUrl: 'https://youtu.be/zgBmU4CPiG4?si=E6RxNZNNOfXGaaym',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أم سلمة رضي الله عنها – زوج النبي ﷺ – قالت: جاءت أم سليم – امرأة أبي طلحة – إلى رسول الله ﷺ فقالت: يا رسول الله! إن الله لا يستحيي من الحق، هل على المرأة من غسل إذا هي احتلمت؟ فقال رسول الله ﷺ: نعم، إذا رأت الماء.\u202C",
              hadethNumber: 33,
              soundUrl: 'assets/sounds/33.ogg',
              explainUrl: 'https://youtu.be/ChaRwNp0qh0?si=C6wQx8qX7sgqtXh4',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن عائشة رضي الله عنها قالت: كنت أغسل الجنابة من ثوب رسول الله ﷺ، فيخرج إلى الصلاة وإن بقع الماء في ثوبه.\n\n"
                  "وفي لفظ لمسلم: لقد كنت أفركه من ثوب رسول الله ﷺ يابساً فيصلي فيه.\u202C",
              hadethNumber: 34,
              soundUrl: 'assets/sounds/34.ogg',
              explainUrl: 'https://youtu.be/qtyEtksfP_o?si=3ZOLIpSkne8ZG-Qj',
            ),

            Hadeth(
              hadethText:
                  "\u202Bعن أبي هريرة رضي الله عنه أن رسول الله ﷺ قال: إذا جلس بين شعبها الأربع، ثم جهدها، فقد وجب الغسل.\n\n"
                  "وفي لفظ: وإن لم ينزل.\u202C",
              hadethNumber: 35,
              soundUrl: 'assets/sounds/35.ogg',
              explainUrl: 'https://youtu.be/Rmhb2d4tLKY?si=nZxxdG0VAPaTuKZ-',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن أبي جعفر محمد بن علي بن الحسين بن علي بن أبي طالب: أنه كان هو وأبوه عند جابر بن عبد الله، وعنده قوم، فسألوه عن الغسل؟ فقال: يكفيك صاع. فقال رجل: ما يكفيني. فقال جابر: كان يكفي من هو أوفى منك شعراً، وخير منك، يريد النبي ﷺ. ثم أمّ في ثوب.\n\n"
                  "وفي لفظ: كان النبي ﷺ يفرغ على رأسه ثلاثاً.\n\n"
                  "الرجل الذي قال: ما يكفيني: هو الحسن بن محمد بن علي بن أبي طالب، أبوه: ابن الحنفية.\u202C",
              hadethNumber: 36,
              soundUrl: 'assets/sounds/36.ogg',
              explainUrl: 'https://youtu.be/j3sjvd7Vse8?si=efGlJJzruTYQLOXJ',
            ),
          ],
        ),
        Door(
          doorName: 'باب التيمم',
          hadeths: [
            Hadeth(
              hadethText:
                  "\u202Bعن عمران بن حصين رضي الله عنه: أن رسول الله ﷺ رأى رجلاً معتزلاً لم يصل في القوم، فقال: يا فلان! ما منعك أن تصلي في القوم؟ فقال: يا رسول الله! أصابتني جنابة ولا ماء. قال: عليك بالصعيد، فإنه يكفيك.\u202C",
              hadethNumber: 37,
              soundUrl: 'assets/sounds/37.ogg',
              explainUrl: 'https://youtu.be/OUAhQ-mbRF0?si=zQOIeGzv-BULmF1F',
            ),

            Hadeth(
              hadethText:
                  "\u202Bعن عمار بن ياسر رضي الله عنه قال: بعثني رسول الله ﷺ في حاجة فأجنبت، فلم أجد الماء، فتمرغت في الصعيد كما تمرغ الدابة، ثم أتيت النبي ﷺ فذكرت ذلك له.\n\n"
                  "فقال: إنما يكفيك أن تقول بيديك هكذا. ثم ضرب بيديه الأرض ضربة واحدة، ثم مسح الشمال على اليمين، وظاهر كفيه ووجهه.\u202C",
              hadethNumber: 38,
              soundUrl: 'assets/sounds/38.ogg',
              explainUrl: 'https://youtu.be/gsk41R87RgE?si=jfR66xHBd-a7UdaW',
            ),
            Hadeth(
              hadethText:
                  "\u202Bعن جابر بن عبد الله رضي الله عنه أن النبي ﷺ قال: أعطيت خمساً لم يعطهن أحد من الأنبياء قبلي: نصرت بالرعب مسيرة شهر، وجعلت لي الأرض مسجداً وطهوراً، فأيما رجل من أمتي أدركته الصلاة فليصل.\n\n"
                  "وأحلت لي الغنائم، ولم تحل لأحد قبلي، وأعطيت الشفاعة، وكان النبي يبعث إلى قومه خاصة، وبعثت إلى الناس عامة.\u202C",
              hadethNumber: 39,
              soundUrl: 'assets/sounds/39.ogg',
              explainUrl: 'https://youtu.be/o9IYuyVlIHk?si=xc7Br875bZ_T8fZD',
            ),
          ],
        ),
      ],
    ),
  ];
}
