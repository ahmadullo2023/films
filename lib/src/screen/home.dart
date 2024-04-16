import 'package:films/src/bloc/save_bloc/save_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_screen_bloc.dart';
import '../bloc/home_bloc/home_screen_event.dart';
import '../widget/drawer.dart';
import '../widget/widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerEnableOpenDragGesture: false,
      key: scaffoldKey,
      drawer: const MyDrawer(),
      backgroundColor: Colors.black,
      body: BlocBuilder<HomeScreenBloc, HomeScreenState>(
        bloc: HomeScreenBloc()..add(ServiceDataEvent()),
        builder: (context, state) {
          if (state.loading == true) {
            return const Center(child: CircularProgressIndicator());
          }
          return Stack(
            children: [
              ListView(
                children: [
              /* if(state is SaveCompletedState){} */
                  CardImage(state: state),
                  const HorizontalListView(),
                  Expanded(
                    child: SizedBox(
                      height: 1000,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 10,
                        itemBuilder: (context, index) {
                          return const HorizontalListView();
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      icon: const Icon(Icons.account_circle, size: 40),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.search, size: 40),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
