
import 'package:flutter/material.dart';
import 'package:omdat_alhadeth/core/constants/app_colors.dart';
import 'package:omdat_alhadeth/providers/theme_provider.dart';

class HomeDrawerWidget extends StatelessWidget {
  const HomeDrawerWidget({
    super.key,
    required this.themeProvider,
  });

  final ThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Drawer Header
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 182, 181, 178),
            ),
            child: Text(
              "اهلا وسهلا بكم في تطبيق عمدة الكتاب",
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: "Reem Kufi",
              ),
            ),
          ),
          // Drawer Items
          ListTile(
            leading: Icon(Icons.home),
            title: Text("Home"),
            onTap: () {
              Navigator.pop(context); // Close drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SwitchListTile(
            activeThumbColor: themeProvider.getIsDarkTheme
                ? const Color.fromARGB(255, 90, 97, 104)
                : const Color.fromARGB(255, 192, 187, 173),
            activeTrackColor: themeProvider.getIsDarkTheme
                ? const Color.fromARGB(255, 76, 80, 84)
                : AppColors.lightCardColor,
    
            value: themeProvider.getIsDarkTheme,
            onChanged: (value) {
              themeProvider.setDarkTheme(themeValue: value);
            },
            title: Align(
              alignment: Alignment.centerLeft,
              child: Icon(
                themeProvider.getIsDarkTheme
                    ? Icons.light_mode
                    : Icons.dark_mode,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
