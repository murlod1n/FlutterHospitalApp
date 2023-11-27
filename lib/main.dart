import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "app/feature/home/domain/usecase/get_doctor_list_usecase.dart";
import "app/feature/home/domain/usecase/get_service_list_usecase.dart";
import "app/feature/home/domain/usecase/post_record_usecase.dart";
import "app/feature/home/presentation/bloc/doctor_bloc/doctor_bloc.dart";
import "app/feature/home/presentation/bloc/record_bloc/record_bloc.dart";
import "app/feature/home/presentation/bloc/service_bloc/service_bloc.dart";
import "app/routing/app_router.dart";
import "app/service_locator/locator_config.dart";

Future<void> main() async {
  await initializeLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<DoctorBloc>(
            create: (BuildContext context) => DoctorBloc(
                getDoctorListUseCase: locator<GetDoctorListUseCase>())
              ..add(GetDoctorList())),
        BlocProvider<ServiceBloc>(
            create: (BuildContext context) => ServiceBloc(
                getServiceListUseCase: locator<GetServiceListUseCase>())),
        BlocProvider<RecordBloc>(create: (BuildContext context) => RecordBloc(postRecordUseCase: locator<PostRecordUseCase>()))
      ],
      child: MaterialApp.router(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          routerConfig: router),
    );
  }
}
