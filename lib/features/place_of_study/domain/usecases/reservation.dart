import 'package:dashbord_cafe/core/resources/data_state.dart';
import 'package:dashbord_cafe/core/usecases/usecase.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/entities/reservation_entity.dart';
import 'package:dashbord_cafe/features/place_of_study/domain/repository/reservation_repository.dart';

import '../entities/reservation_get_entity.dart';

class GetReservationRoomUseCase
    implements UseCase<DataState<List<ReservationGetEntity>>, int> {
  final ReservationRepository _reservationRepository;

  GetReservationRoomUseCase(this._reservationRepository);

  @override
  Future<DataState<List<ReservationGetEntity>>> call({int? params}) {
    return _reservationRepository.getReservationsRooms(idPlace: params!);
  }
}

class GetReservationTableUseCase
    implements UseCase<DataState<List<ReservationGetEntity>>, int> {
  final ReservationRepository _reservationRepository;

  GetReservationTableUseCase(this._reservationRepository);

  @override
  Future<DataState<List<ReservationGetEntity>>> call({int? params}) {
    return _reservationRepository.getReservationsTable(idPlace: params!);
  }
}

class PostReservationRoomUseCase
    implements UseCase<DataState<ReservationGetEntity>, ReservationEntity> {
  final ReservationRepository _reservationRepository;

  PostReservationRoomUseCase(this._reservationRepository);

  @override
  Future<DataState<ReservationGetEntity>> call({ReservationEntity? params,int?idPlace}) {
    return _reservationRepository.postReservationRoom( idPlace: idPlace!, newReservationRoomEntity: params!);
  }
}

class PostReservationTableUseCase
    implements UseCase<DataState<ReservationGetEntity>, ReservationEntity> {
  final ReservationRepository _reservationRepository;

  PostReservationTableUseCase(this._reservationRepository);

  @override
  Future<DataState<ReservationGetEntity>> call({ReservationEntity? params,int?idPlace}) {
    return _reservationRepository.postReservationTable( idPlace: idPlace!, newReservationTableEntity: params!);
  }
}
