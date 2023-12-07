import 'package:bantu_bersama/firebase_options.dart';
import 'package:bantu_bersama/model/theme_mode_data.dart';
import 'package:bantu_bersama/screen/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'model/data_donasi_provider.dart';
import 'model/donasi_provider.dart';
import 'screen/introduction_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DataDonasiProvider(),
          child: MyApp(),
        ),
        ChangeNotifierProvider(
          create: (context) => DonasiProvider(),
          child: MyApp(),
        ),
        ChangeNotifierProvider(create: (context) => ThemeModeData()),
      ],
      child: Builder(builder: (context) {
        ColorScheme lightScheme = ColorScheme.fromSeed(
          seedColor: Provider.of<ThemeModeData>(context).defaultColor,
          brightness: Brightness.light,
        );
        ColorScheme darkScheme = ColorScheme.fromSeed(
          seedColor: Provider.of<ThemeModeData>(context).defaultColor,
          brightness: Brightness.dark,
        );
        return MaterialApp(
          title: 'Donasi Online',
          theme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.light,
            colorScheme: lightScheme,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Provider.of<ThemeModeData>(context).defaultColor,
                    fontWeight: FontWeight.w400),
              ),
              hintStyle: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Provider.of<ThemeModeData>(context).defaultColor,
                  fontWeight: FontWeight.w400,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Provider.of<ThemeModeData>(context).defaultColor,
                ),
              ),
            ),
            iconTheme: IconThemeData(
                color: Provider.of<ThemeModeData>(context).defaultColor),
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.patrickHand(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              headlineMedium: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Provider.of<ThemeModeData>(context).defaultColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              headlineSmall: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white, fontSize: 13, letterSpacing: 4),
              ),
              bodyLarge: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 17,
                      color: Provider.of<ThemeModeData>(context).defaultColor,
                      fontWeight: FontWeight.bold)),
              bodyMedium: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Provider.of<ThemeModeData>(context).defaultColor,
                      fontWeight: FontWeight.bold)),
              bodySmall: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 12,
                      color: Provider.of<ThemeModeData>(context).defaultColor,
                      fontWeight: FontWeight.normal)),
              displaySmall: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Provider.of<ThemeModeData>(context).defaultColor,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: darkScheme,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: GoogleFonts.lato(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              hintStyle: GoogleFonts.lato(
                textStyle:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w400),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 2,
                  color: Colors.white,
                ),
              ),
            ),
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: TextTheme(
              headlineLarge: GoogleFonts.patrickHand(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
              ),
              headlineMedium: GoogleFonts.lato(
                textStyle: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              headlineSmall: GoogleFonts.lato(
                textStyle: TextStyle(
                    color: Colors.white, fontSize: 13, letterSpacing: 4),
              ),
              bodyLarge: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              bodyMedium: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
              bodySmall: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.normal)),
              displaySmall: GoogleFonts.lato(
                  textStyle: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontWeight: FontWeight.w400)),
            ),
          ),
          // themeMode: ThemeMode.light,
          themeMode: Provider.of<ThemeModeData>(context).themeMode,
          home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return IntroductionPage();
          }
        },
      ),
          // home: IntroductionPage(),
        );
      }),
    );
  }
}
