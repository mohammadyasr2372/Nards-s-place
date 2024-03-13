import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/room.dart';
import 'room_event.dart';
import 'room_state.dart';

class RoomOfCafesBloc extends Bloc<RoomEvent, RoomState> {
  final GetRoomUseCase _getRoomUseCase;
  final GetRoomByCategryUseCase _getRoomByCategryUseCase;
  final PostRoomUseCase _postRoomUseCase;
  final PutRoomUseCase _putRoomUseCase;
  final DeletRoomUseCase _deletRoomUseCase;

  RoomOfCafesBloc(this._getRoomUseCase, this._getRoomByCategryUseCase,
      this._postRoomUseCase, this._putRoomUseCase, this._deletRoomUseCase)
      : super(const RoomsLoadingState()) {
    on<GetRooms>(onGetRooms);

    on<GetRoomsByCategry>(onGetRoomsByCategry);

    on<PostRoom>(onPostRooms);

    on<PutRoom>(onPutRooms);

    on<DeletRoom>(onDeletRooms);
  }

  void onGetRooms(GetRooms event, Emitter<RoomState> emit) async {
    final dataState = await _getRoomUseCase(params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RoomsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsErrorState(dataState.exception!));
    }
  }

  void onGetRoomsByCategry(
      GetRoomsByCategry event, Emitter<RoomState> emit) async {
    final dataState = await _getRoomByCategryUseCase(
        idCategry: event.idCategry, params: event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RoomsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsErrorState(dataState.exception!));
    }
  }

  void onPostRooms(PostRoom event, Emitter<RoomState> emit) async {
    final dataState = await _postRoomUseCase(
      idPlace: event.idPlace,
      params: event.roomEntity,
    );

    if (dataState is DataSuccess) {
      emit(PostRoomsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsErrorState(dataState.exception!));
    }
  }

  void onPutRooms(PutRoom event, Emitter<RoomState> emit) async {
    final dataState = await _putRoomUseCase(
        id: event.id, params: event.roomEntity, idPlace: event.idPlace);

    if (dataState is DataSuccess) {
      emit(PutRoomsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsErrorState(dataState.exception!));
    }
  }

  void onDeletRooms(DeletRoom event, Emitter<RoomState> emit) async {
    final dataState = await _deletRoomUseCase(
      params: event.id,
      idPlace: event.idPlace,
    );

    if (dataState is DataSuccess) {
      emit(DeletRoomsDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsErrorState(dataState.exception!));
    }
  }
}
