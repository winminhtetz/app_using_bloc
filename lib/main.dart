import 'package:app_using_bloc/bloc/get/cubit/get_post_cubit.dart';
import 'package:app_using_bloc/module.dart';
import 'package:app_using_bloc/screen_ui/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  locator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Sample',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BlocProvider<GetPostCubit>(
        create: (context) => getIt.call(),
        child: HomeScreen(),
      ),
    );
  }
}
