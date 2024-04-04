import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notes/blocs/tasks/tasks_block.dart';
import 'package:notes/blocs/tasks/tasks_event.dart';

import 'package:notes/screens/routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_)=> TasksBloc()..add(GetTasksEvent()))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        ScreenUtil.init(context);
        return const MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RoutesName.home,
          onGenerateRoute: AppRoutes.generateRoute,
        );
      },
    );
  }
}
