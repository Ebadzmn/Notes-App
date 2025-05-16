import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notesapp/app/app_routes.dart';
import 'package:notesapp/app/controller_binder.dart';

class NotesApp extends StatefulWidget {
  const NotesApp({super.key});


  @override
  State<NotesApp> createState() => _NotesAppState();
}

class _NotesAppState extends State<NotesApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Colors.white),
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black
        ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: Colors.yellow,
              foregroundColor: Colors.black

      ),
          inputDecorationTheme: InputDecorationTheme(
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: Colors.blueGrey
              )
          ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.yellow
                  )
              ),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: Colors.red
                  )
              ),
            hintStyle: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.grey
            ),

          ),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              backgroundColor: Colors.yellow
            )
          ),
          listTileTheme: ListTileThemeData(
          iconColor: Colors.white,
      )),

    );
  }
}
