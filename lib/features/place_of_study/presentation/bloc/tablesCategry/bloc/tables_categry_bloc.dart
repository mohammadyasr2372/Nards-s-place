import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/usecases/tables_categry.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_event.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TablesCategryBloc extends Bloc<TablesCategryEvent, TablesCategryState> {
  final GetTablesCategryUseCase _getTablesCategryUseCase;
  final PostTablesCategryUseCase _postTablesCategryUseCase;
  final PutTablesCategryUseCase _putTablesCategryUseCase;
  final DeletTablesCategryUseCase _deletTablesCategryUseCase;

  TablesCategryBloc(this._getTablesCategryUseCase, this._postTablesCategryUseCase, this._putTablesCategryUseCase, this._deletTablesCategryUseCase) : super(const TablesCategrysLoadingState()) {
    on<GetTablesCategrys>(onGetTablesCategry);

    on<PostTablesCategry>(onPostTablesCategry);

    on<PutTablesCategry>(onPutTablesCategry);

    on<DeletTablesCategry>(onDeletTablesCategry);
  }

  void onGetTablesCategry(GetTablesCategrys event, Emitter<TablesCategryState> emit) async {
    final dataState = await _getTablesCategryUseCase(params:event.idPlace);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(TablesCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TablesCategrysErrorState(dataState.exception!));
    }
  }

   void onPostTablesCategry(PostTablesCategry event, Emitter<TablesCategryState> emit) async {
    final dataState = await _postTablesCategryUseCase(idPlace: event.idPlace,params: event.tablesCategryEntity);

    if (dataState is DataSuccess ) {
      emit(PostTablesCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TablesCategrysErrorState(dataState.exception!));
    }
  }
   void onPutTablesCategry(PutTablesCategry event, Emitter<TablesCategryState> emit) async {
    final dataState = await _putTablesCategryUseCase(id:event.id ,params: event.tablesCategryEntity, idPlace: event.idPlace);

    if (dataState is DataSuccess ) {
      emit(PutTablesCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TablesCategrysErrorState(dataState.exception!));
    }
  }
   void onDeletTablesCategry(DeletTablesCategry event, Emitter<TablesCategryState> emit) async {
    final dataState = await _deletTablesCategryUseCase(params: event.id,idPlace:event.idPlace );

    if (dataState is DataSuccess ) {
      emit(DeletTablesCategrysDoneState(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(TablesCategrysErrorState(dataState.exception!));
    }
  }
}
