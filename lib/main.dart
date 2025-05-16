import 'package:flutter/material.dart';
import 'package:notesapp/app/app.dart';
import 'package:notesapp/app/controller_binder.dart';

void main() {
  ControllerBinder().dependencies();
  runApp(const NotesApp());
}