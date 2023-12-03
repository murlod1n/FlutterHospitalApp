import "dart:io";

import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:intl/date_symbol_data_local.dart";
import "app/feature/home/domain/usecase/get_doctor_list_usecase.dart";
import "app/feature/home/domain/usecase/get_service_list_usecase.dart";
import "app/feature/home/domain/usecase/insert_record_usecase.dart";
import "app/feature/home/domain/usecase/post_record_usecase.dart";
import "app/feature/home/presentation/bloc/doctor_bloc/doctor_bloc.dart";
import "app/feature/home/presentation/bloc/home_bloc/home_bloc.dart";
import "app/feature/home/presentation/bloc/service_bloc/service_bloc.dart";
import "app/feature/record/domain/usecase/delete_record_usecase.dart";
import "app/feature/record/domain/usecase/get_record_list_usecase.dart";
import "app/feature/record/presentation/bloc/record_bloc.dart";
import "app/routing/app_router.dart";
import "app/service_locator/locator_config.dart";
import "app/theme/theme.dart";

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

Future<void> main() async {
  HttpOverrides.global = MyHttpOverrides();
  await initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);


    initializeDateFormatting("ru_RU");
    return _multiBlocProviderWrapper(
      child: MaterialApp.router(
        title: "Hospital Flutter App",
        theme: AppTheme.light,
        routerConfig: router,
      ),
    );
  }

  MultiBlocProvider _multiBlocProviderWrapper({required Widget child}) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorBloc>(
          create: (BuildContext context) => DoctorBloc(
            getDoctorListUseCase: locator<GetDoctorListUseCase>()
          )..add(GetDoctorList())
        ),
        BlocProvider<ServiceBloc>(
          create: (BuildContext context) => ServiceBloc(
            getServiceListUseCase: locator<GetServiceListUseCase>()
          )
        ),
        BlocProvider<HomeBloc>(
          create: (BuildContext context) => HomeBloc(
            postRecordUseCase: locator<PostRecordUseCase>(),
            insertRecordUseCase: locator<InsertRecordUseCase>()
          )
        ),
        BlocProvider<RecordBloc>(
          create: (BuildContext context) => RecordBloc(
            getRecordListUseCase: locator<GetRecordListUseCase>(),
            deleteRecordUseCase: locator<DeleteRecordUseCase>()
          )..add(GetRecordList())
        ),
      ],
      child: child
    );
  }

}
