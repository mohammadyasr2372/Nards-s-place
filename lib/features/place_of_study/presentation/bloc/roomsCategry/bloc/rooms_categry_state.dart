
import 'package:dashbord_cafe/features/place_of_study/domain/entities/romms_categry_entity.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class RoomsCategryState extends Equatable {
  final List<RoomsCategryEntity>? roomsCategrys;
  final RoomsCategryEntity? roomsCategry;
  final String? massege;

  final DioException? exception;
  const RoomsCategryState({
    this.roomsCategrys,
    this.roomsCategry,
    this.massege,
    this.exception,
  });


  @override
  List<Object ?> get props => [roomsCategrys, roomsCategry,massege ,exception];
}

class RoomsCategrysLoadingState extends RoomsCategryState {
  const RoomsCategrysLoadingState();
}

class RoomsCategrysDoneState extends RoomsCategryState {
  const RoomsCategrysDoneState(List<RoomsCategryEntity> roomsCategrys) : super(roomsCategrys: roomsCategrys);
}

class RoomsCategrysErrorState extends RoomsCategryState {
  const RoomsCategrysErrorState(DioException exception) : super(exception: exception);
}
class PostRoomsCategrysDoneState extends RoomsCategryState {
  const PostRoomsCategrysDoneState(RoomsCategryEntity roomsCategry) : super(roomsCategry: roomsCategry);
}

class PutRoomsCategrysDoneState extends RoomsCategryState {
  const PutRoomsCategrysDoneState(RoomsCategryEntity roomsCategry) : super(roomsCategry: roomsCategry);
}
class DeletRoomsCategrysDoneState extends RoomsCategryState {
  const DeletRoomsCategrysDoneState(String massege) : super(massege: massege);
}
