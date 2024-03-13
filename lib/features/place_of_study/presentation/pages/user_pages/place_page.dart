import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/place/bloc/place_of_cafes_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/place/bloc/place_of_cafes_state.dart';
import '../../widgets/place_widget.dart';
import '../../widgets/shimmer_loading.dart';

class PagePlace extends StatelessWidget {
  const PagePlace({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<PlaceOfCafesBloc>().add(const GetPlaces());
        },
        child: BlocConsumer<PlaceOfCafesBloc, PlaceOfCafesState>(
          listener: (context, state) {

            if (state is LocalPlacesDone) {
               ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Colors.green,
                            content: const Text('data is local'),
                          ),
                        );
                      
              
            }
          },
          builder: (context, state) {
            if (state is PlacesDoneState) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.places!.length,
                itemBuilder: (context, index) => PlaceWidget(
                  place: state.places![index],
                ),
              );
            }else if (state is LocalPlacesDone) {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.places!.length,
                itemBuilder: (context, index) => PlaceWidget(
                  place: state.places![index],
                ),
              );
            } else if (state is PlacesErrorState) {
              return Center(
                child: InkWell(
                    onTap: () {
                      context.read<PlaceOfCafesBloc>().add(const GetPlaces());
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
