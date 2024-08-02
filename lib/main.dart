import 'package:eloan/DB/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:eloan/root.dart';
import 'package:hive_flutter/hive_flutter.dart';
void main() async{
  await Hive.initFlutter();
  if(!Hive.isAdapterRegistered(UserAdapter().typeId))
  {
    Hive.registerAdapter(UserAdapter());
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Root();
    
  }
}
