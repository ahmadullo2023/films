part of 'home_screen_bloc.dart';

class HomeScreenState extends Equatable {
  const HomeScreenState({this.articles, this.loading});

  final List<Article>? articles;
  final bool? loading;

  @override
  List<Object?> get props => [articles, loading];

  HomeScreenState copyWith({
    List<Article>? articles,
    bool? loading,
  }) {
    return HomeScreenState(
      articles: articles ?? this.articles,
      loading: loading ?? this.loading,
    );
  }
}

