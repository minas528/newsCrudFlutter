import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/News/bloc/news_bloc.dart';
import 'package:news_app/News/data_provider/news_provider.dart';
import 'package:news_app/News/presentation/news_listing_page.dart';
import 'package:news_app/News/repository/news_respository.dart';
import 'package:news_app/routes.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final http.Client httpClient = http.Client();
    final NewsProvider newsProvider = NewsProvider(httpClient: httpClient);
    final NewsRepository newsRepository =
        NewsRepository(provider: newsProvider);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NewsBloc(repository: newsRepository)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: NewsListingPage.routeName,
        onGenerateRoute: PageRouter.generateRoute,
      ),
    );
  }
}
