import 'package:binus_lite/screens/login_screen.dart';
import 'package:binus_lite/screens/navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const LoginScreen(),
      routes: { '/navigation': (context) => Navigation() },
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF6DCAF6),
          centerTitle: true,
          foregroundColor: Color(0xFFFFFFFF),
          titleTextStyle: TextStyle(
            color: Color(0xFFFFFFFF),
            fontFamily: "Century Gothic",
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            overflow: TextOverflow.clip
          ),

          toolbarHeight: 100.0
        ),

        bottomNavigationBarTheme: const BottomNavigationBarThemeData(backgroundColor: Color(0xFF018ED5)),
        elevatedButtonTheme: const ElevatedButtonThemeData(style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Color(0xFFEF8800)),
            foregroundColor: WidgetStatePropertyAll(Color(0xFFFFFFFF))
        )),

        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0xFFEF8800),
          foregroundColor: Color(0xFFFFFFFF)
        ),

        fontFamily: "Century Gothic",
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16.0)),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFFF0000))
          ),

          filled: true,
          fillColor: const Color(0xFFFFFFFF),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFEF8800))
          ),

          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16.0),
            borderSide: const BorderSide(color: Color(0xFFFF0000))
          )
        ),

        sliderTheme: const SliderThemeData(
          activeTrackColor: Color(0xFFEF8800),
          showValueIndicator: ShowValueIndicator.onlyForDiscrete,
          thumbColor: Color(0xFFEF8800),
          valueIndicatorColor: Color(0xFFEF8800),
          valueIndicatorShape: RectangularSliderValueIndicatorShape(),
          valueIndicatorTextStyle: TextStyle(color: Color(0xFFFFFFFF))
        ),
        
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFEF8800),
          selectionColor: Color(0xFFEF8800),
          selectionHandleColor: Color(0xFFEF8800)
        ),

        useMaterial3: true
      ),

      title: "BinusLite"
    );
  }
}
