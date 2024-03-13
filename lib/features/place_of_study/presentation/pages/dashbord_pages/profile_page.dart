import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/di.dart';
import '../../../../../injection_container.dart';
import '../../bloc/place/bloc/place_of_cafes_state.dart';
import '../../widgets/place_widget.dart';
import '../../widgets/shimmer_loading.dart';

class ProfilePlace extends StatelessWidget {
  const ProfilePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<PlaceOfCafesBloc>(
        create: (context) => sl<PlaceOfCafesBloc>()
          ..add(GetPlaceInfo(
              idPlace: config.get<SharedPreferences>().getInt('idPlace')!)),
        child: BlocConsumer<PlaceOfCafesBloc, PlaceOfCafesState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            if (state is PlacesInfoDoneState) {
              return PlaceWidget(place: state.place!);
           } else if (state is PlacesErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context
                          .read<PlaceOfCafesBloc>()
                          .add(GetPlaceInfo(idPlace: config.get<SharedPreferences>().getInt('idPlace') !));
                    },
                    child: const Icon(Icons.refresh_outlined)),
              );
            } else if (state is PlacesLoadingState) {
              return const Center(
                child: ShimmerLoading(),
              );
            } else {
              return Center(
                child: Text(state.toString()),
              );
            }
          },
        ),
      ),
    );
  }
}
