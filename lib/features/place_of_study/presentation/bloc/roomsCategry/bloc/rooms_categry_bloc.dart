
import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/rooms_gategry.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'rooms_categry_event.dart';
import 'rooms_categry_state.dart';

class RoomsCategryBloc extends Bloc<RoomsCategryEvent, RoomsCategryState> {
  final GetRoomsCategryUseCase _getRoomsCategryUseCase;
  final PostRoomsCategryUseCase _postRoomsCategryUseCase;
  final PutRoomsCategryUseCase _putRoomsCategryUseCase;
  final DeletRoomsCategryUseCase _deletRoomsCategryUseCase;

  RoomsCategryBloc(this._getRoomsCategryUseCase, this._postRoomsCategryUseCase, this._putRoomsCategryUseCase, this._deletRoomsCategryUseCase) : super(const RoomsCategrysLoadingState()) {
    on<GetRoomsCategrys>(onGetRoomsCategrys);

    on<PostRoomsCategry>(onPostRoomsCategrys);

    on<PutRoomsCategry>(onPutRoomsCategrys);
    
    on<DeletRoomsCategry>(onDeletRoomsCategrys);
  }

  void onGetRoomsCategrys(GetRoomsCategrys event, Emitter<RoomsCategryState> emit) async {
    final dataState = await _getRoomsCategryUseCase(params:event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RoomsCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsCategrysErrorState(dataState.exception!));
    }
  }

   void onPostRoomsCategrys(PostRoomsCategry event, Emitter<RoomsCategryState> emit) async {
    final dataState = await _postRoomsCategryUseCase(idPlace: event.idPlace,params: event.roomsCategryEntity,);

    if (dataState is DataSuccess ) {
      emit(PostRoomsCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsCategrysErrorState(dataState.exception!));
    }
  }
   void onPutRoomsCategrys(PutRoomsCategry event, Emitter<RoomsCategryState> emit) async {
    final dataState = await _putRoomsCategryUseCase(id:event.id ,params: event.roomsCategryEntity, idPlace: event.idPlace);

    if (dataState is DataSuccess ) {
      emit(PutRoomsCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsCategrysErrorState(dataState.exception!));
    }
  }
   void onDeletRoomsCategrys(DeletRoomsCategry event, Emitter<RoomsCategryState> emit) async {
    final dataState = await _deletRoomsCategryUseCase(params: event.id,idPlace:event.idPlace ,);

    if (dataState is DataSuccess ) {
      emit(DeletRoomsCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(RoomsCategrysErrorState(dataState.exception!));
    }
  }
}
