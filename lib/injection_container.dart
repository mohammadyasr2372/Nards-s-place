import 'package:dashbord_cafe/config/theme/bloc/theme_app_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/place_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/room_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/rooms_categry_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/table_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/data_sources/remote/tables_categry_api_service.dart';
import 'package:dashbord_cafe/features/place_of_study/data/repository/place_repository_impl.dart';
import 'package:dashbord_cafe/features/place_of_study/data/repository/rooms_categry_repository_impl.dart';
import 'package:dashbord_cafe/features/place_of_study/data/repository/table_repository_impl.dart';
import 'package:dashbord_cafe/features/place_of_study/data/repository/tables_categry_repository_impl.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/place_repository.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/rooms_categry_repository.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/table_repository.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/tables_categry_repository.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/places.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/room.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/rooms_gategry.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/tables_categry.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/room/bloc/room_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/roomsCategry/bloc/rooms_categry_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

import 'features/place_of_study/data/data_sources/local/app_database.dart';
import 'features/place_of_study/data/data_sources/remote/reservation_api_service.dart';
import 'features/place_of_study/data/repository/reservation_repository_impl.dart';
import 'features/place_of_study/data/repository/room_repository_impl.dart';
import 'features/place_of_study/domain/repository/reservation_repository.dart';
import 'features/place_of_study/domain/repository/room_repository.dart';
import 'features/place_of_study/domain/usecases/reservation.dart';
import 'features/place_of_study/domain/usecases/table.dart';
import 'features/place_of_study/presentation/bloc/reservation_room/bloc/reservation_room_bloc.dart';
import 'features/place_of_study/presentation/bloc/reservation_table/bloc/reservation_table_bloc.dart';
import 'features/place_of_study/presentation/bloc/table/bloc/table_bloc.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);


  final database =
      await $FloorAppDatabase.databaseBuilder('app_database.db').build();
  sl.registerSingleton<AppDatabase>(database);

  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<PlaceApiService>(PlaceApiService(sl()));
  sl.registerSingleton<PlaceRepository>(PlaceRepositoryImpl(sl(), sl()));

  sl.registerSingleton<RoomApiService>(RoomApiService(sl()));
  sl.registerSingleton<RoomRepository>(RoomRepositoryImpl(sl()));

  sl.registerSingleton<RoomsCategryApiService>(RoomsCategryApiService(sl()));
  sl.registerSingleton<RoomsCategryRepository>(
      RoomsCategryRepositoryImpl(sl()));

  sl.registerSingleton<TableApiService>(TableApiService(sl()));
  sl.registerSingleton<TableRepository>(TableRepositoryImpl(sl()));

  sl.registerSingleton<TablesCategryApiService>(TablesCategryApiService(sl()));
  sl.registerSingleton<TablesCategryRepository>(
      TablesCategryRepositoryImpl(sl()));

  sl.registerSingleton<ReservationApiService>(ReservationApiService(sl()));
  sl.registerSingleton<ReservationRepository>(ReservationRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetPlaceUseCase>(GetPlaceUseCase(sl()));
  sl.registerSingleton<GetPlaceInfoUseCase>(GetPlaceInfoUseCase(sl()));
  sl.registerSingleton<PostPlaceUseCase>(PostPlaceUseCase(sl()));
  sl.registerSingleton<PutPlaceUseCase>(PutPlaceUseCase(sl()));
  sl.registerSingleton<DeletPlaceUseCase>(DeletPlaceUseCase(sl()));
  sl.registerSingleton<GetSavedPlaceUseCase>(GetSavedPlaceUseCase(sl()));
  sl.registerSingleton<SavePlaceUseCase>(SavePlaceUseCase(sl()));
  sl.registerSingleton<RemovePlaceUseCase>(RemovePlaceUseCase(sl()));

  sl.registerSingleton<GetRoomUseCase>(GetRoomUseCase(sl()));
  sl.registerSingleton<GetRoomByCategryUseCase>(GetRoomByCategryUseCase(sl()));
  sl.registerSingleton<PostRoomUseCase>(PostRoomUseCase(sl()));
  sl.registerSingleton<PutRoomUseCase>(PutRoomUseCase(sl()));
  sl.registerSingleton<DeletRoomUseCase>(DeletRoomUseCase(sl()));

  sl.registerSingleton<GetRoomsCategryUseCase>(GetRoomsCategryUseCase(sl()));
  sl.registerSingleton<PostRoomsCategryUseCase>(PostRoomsCategryUseCase(sl()));
  sl.registerSingleton<PutRoomsCategryUseCase>(PutRoomsCategryUseCase(sl()));
  sl.registerSingleton<DeletRoomsCategryUseCase>(
      DeletRoomsCategryUseCase(sl()));

  sl.registerSingleton<GetTableUseCase>(GetTableUseCase(sl()));
  sl.registerSingleton<PostTableUseCase>(PostTableUseCase(sl()));
  sl.registerSingleton<PutTableUseCase>(PutTableUseCase(sl()));
  sl.registerSingleton<DeletTableUseCase>(DeletTableUseCase(sl()));

  sl.registerSingleton<GetTablesCategryUseCase>(GetTablesCategryUseCase(sl()));
  sl.registerSingleton<PostTablesCategryUseCase>(
      PostTablesCategryUseCase(sl()));
  sl.registerSingleton<PutTablesCategryUseCase>(PutTablesCategryUseCase(sl()));
  sl.registerSingleton<DeletTablesCategryUseCase>(
      DeletTablesCategryUseCase(sl()));

  sl.registerSingleton<GetReservationRoomUseCase>(
      GetReservationRoomUseCase(sl()));
  sl.registerSingleton<GetReservationTableUseCase>(
      GetReservationTableUseCase(sl()));
  sl.registerSingleton<PostReservationRoomUseCase>(
      PostReservationRoomUseCase(sl()));
  sl.registerSingleton<PostReservationTableUseCase>(
      PostReservationTableUseCase(sl()));

  // Blocs
  sl.registerFactory<PlaceOfCafesBloc>(
      () => PlaceOfCafesBloc(sl(), sl(), sl(), sl(), sl(), sl(), sl(), sl()));
  sl.registerFactory<ReservationRoomBloc>(
      () => ReservationRoomBloc(sl(), sl()));
  sl.registerFactory<ReservationTableBloc>(
      () => ReservationTableBloc(sl(), sl()));
  sl.registerFactory<RoomOfCafesBloc>(() => RoomOfCafesBloc(
        sl(),
        sl(),
        sl(),
        sl(),
        sl(),
      ));
  sl.registerFactory<TableBloc>(() => TableBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<TablesCategryBloc>(
      () => TablesCategryBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<RoomsCategryBloc>(
      () => RoomsCategryBloc(sl(), sl(), sl(), sl()));
  sl.registerFactory<ThemeAppBloc>(() => ThemeAppBloc());

}
