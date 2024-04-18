import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_bloc/home_screen_bloc.dart';
import '../bloc/home_bloc/home_screen_event.dart';
import 'film_view.dart';

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      bloc: HomeScreenBloc()..add(ServiceDataEvent()),
      builder: (context, state) {
        if (state.loading == true) {
          return const Center(child: CircularProgressIndicator());
        }
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "  tesla",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w600),
            ),
            Container(
              height: 220,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListView.builder(
                itemCount: state.articles?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final articles = state.articles?[index + 1];
                  return FilmsView(articles: articles);
                },
              ),
            ),
          ],
        );
      },
    );
  }
}

class CardImage extends StatelessWidget {
  const CardImage({super.key, this.state});

  final state;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 500,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage(state.articles?[0].urlToImage ?? ""),
            )));
  }
}