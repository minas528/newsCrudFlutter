import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/News/bloc/news_event.dart';
import 'package:news_app/News/bloc/news_state.dart';
import 'package:news_app/News/repository/news_respository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository repository;

  NewsBloc({required this.repository}) : super(NewsInitState()) {
    // Triggered when LoadNewsEvent is added
    on<LoadNewsEvent>((event, emit) async {
      emit(NewsLoadingState());
      try {
        final newsList = await repository.getNewsList();

        emit(NewsSuccessState(newsList: newsList));
      } catch (e) {
        emit(NewsErrorState(statusCode: 500, errorMessage: e.toString()));
      }
    });

  }
}
