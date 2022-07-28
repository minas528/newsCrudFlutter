import 'package:equatable/equatable.dart';
import 'package:news_app/News/model/news.dart';

class NewsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class NewsInitState extends NewsState {}

class NewsLoadingState extends NewsState {}

class NewsSuccessState extends NewsState {
  final List<News> newsList;

  NewsSuccessState({required this.newsList});
}

class NewsErrorState extends NewsState {
  final int statusCode;
  final String errorMessage;

  NewsErrorState({required this.statusCode, required this.errorMessage});
}
