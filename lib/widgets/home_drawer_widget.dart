import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';
import 'package:omdat_alhadeth/screens/font_size_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({super.key, required this.themeProvider});

  final ThemeProvider themeProvider;

  Future<void> _contactDev() async {
    final Uri whatsappUri = Uri.parse("https://wa.me/972592345890");
    if (await canLaunchUrl(whatsappUri)) {
      await launchUrl(whatsappUri, mode: LaunchMode.externalApplication);
    } else {
      throw "Could not launch $whatsappUri";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: themeProvider.getIsDarkTheme
          ? AppColors.darkScaffoldColor
          : AppColors.lightCardColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: themeProvider.getIsDarkTheme
                  ? AppColors.lightCardColor
                  : AppColors.darkScaffoldColor,
            ),
            child: Column(
              children: [
                Text(
                  "اهلا وسهلا بكم في تطبيق عمدة الكتاب",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: themeProvider.getIsDarkTheme
                        ? AppColors.darkScaffoldColor
                        : AppColors.lightCardColor,
                    fontSize: 24,
                    fontFamily: "Reem Kufi",
                  ),
                ),
                Text(
                  "برعاية أخوكم في الله خالد بن سعيد العتيبي",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: themeProvider.getIsDarkTheme
                        ? AppColors.darkScaffoldColor
                        : AppColors.lightCardColor,
                    fontSize: 18,
                    fontFamily: "Reem Kufi",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Drawer Items
          ListTile(
            trailing: const Icon(Icons.text_fields),
            title: const Text(
              "تغيير حجم الخط",
              style: TextStyle(fontFamily: 'Amiri'),
              textAlign: TextAlign.right,
            ),
            subtitle: const Text(
              "اضبط حجم الخط في التطبيق",
              style: TextStyle(fontFamily: 'Amiri'),
              textAlign: TextAlign.right,
            ),

            leading: const Icon(Icons.arrow_back_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FontSizeScreen(themeProvider: themeProvider),
                ),
              );
            },
          ),
          const Divider(),
          ListTile(
            trailing: const Icon(Icons.phone),
            title: const Text(
              textAlign: TextAlign.right,
              "التواصل مع المطور",
              style: TextStyle(fontFamily: 'Amiri'),
            ),
            subtitle: const Text(
              "+972592345890",
              textAlign: TextAlign.right,
              style: TextStyle(fontFamily: 'Amiri'),
            ),
            leading: const Icon(Icons.arrow_back_ios),
            onTap: _contactDev,
          ),
          SwitchListTile(
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
            title: Text(
              themeProvider.getIsDarkTheme ? "الوضع الليلي" : "الوضع النهاري",
              style: TextStyle(fontFamily: 'Amiri'),
              textAlign: TextAlign.right,
            ),
            subtitle: Text(
              style: TextStyle(fontFamily: 'Amiri'),
              textAlign: TextAlign.right,
              themeProvider.getIsDarkTheme
                  ? "تفعيل الوضع الداكن للتطبيق"
                  : "تفعيل الوضع الفاتح للتطبيق",
            ),
            secondary: Icon(
              themeProvider.getIsDarkTheme ? Icons.dark_mode : Icons.light_mode,
              color: Theme.of(context).colorScheme.secondary,
            ),
            activeColor: themeProvider.getIsDarkTheme
                ? const Color.fromARGB(255, 90, 97, 104)
                : const Color.fromARGB(255, 192, 187, 173),
            activeTrackColor: themeProvider.getIsDarkTheme
                ? const Color.fromARGB(255, 76, 80, 84)
                : AppColors.lightCardColor,
          ),
        ],
      ),
    );
  }
}
