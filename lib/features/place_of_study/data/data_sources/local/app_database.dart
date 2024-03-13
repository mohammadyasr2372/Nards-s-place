import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:dashbord_cafe/features/place_of_study/data/data_sources/local/Dao/place_dao.dart';
import 'package:dashbord_cafe/features/place_of_study/data/models/place_model.dart';
part 'app_database.g.dart';

@Database(version: 1, entities: [PlaceModel])
abstract class AppDatabase extends FloorDatabase {
  PlaceDao get placeDao;
}
