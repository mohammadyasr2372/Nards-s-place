// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names, prefer_typing_uninitialized_variables
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_bloc.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/bloc/tablesCategry/bloc/tables_categry_state.dart';
import 'package:dashbord_cafe/features/place_of_study/presentation/pages/user_pages/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../injection_container.dart';
import '../../bloc/tablesCategry/bloc/tables_categry_event.dart';
import '../../widgets/shimmer_loading.dart';

class TableCategoryPage extends StatelessWidget {
  final int idPlace;
  final int idRoom;
  const TableCategoryPage({super.key,required this.idPlace,required this.idRoom});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocProvider(
        create: (context) =>
            sl<TablesCategryBloc>()..add(GetTablesCategrys(idPlace: idPlace)),
        child: BlocConsumer<TablesCategryBloc, TablesCategryState>(
          listener: (context, state) {
            if (state is TablesCategrysLoadingState) {}
          },
          builder: (context, state) {
            if (state is TablesCategrysDoneState) {
              state.tablesCategrys!.length;
              List<Tab> tabs = [];
              List<TablePage> TablePages = [];
              for (var element in state.tablesCategrys!) {
                TablePages.add(TablePage(
                  idCategry: element.id!,
                  idRoom: idRoom, idPlace: idPlace,
                ));
                tabs.add(Tab(
                  text: element.shape,
                ));
              }
              return DefaultTabController(
                length: state.tablesCategrys!.length,
                child: Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    leading: Container(),
                    title: Text('Categry of Table'),
                    bottom: TabBar(tabs: tabs),
                  ),
                  body: TabBarView(children: TablePages),
                ),
              );
            } else if (state is TablesCategrysErrorState) {
            return Center(
              child: InkWell(
                  onTap: () {
                    context.read<TablesCategryBloc>().add(GetTablesCategrys(idPlace: idPlace));
                  },
                  child: const Icon(Icons.refresh_outlined)),
            );
          } else if (state is TablesCategrysLoadingState) {
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
