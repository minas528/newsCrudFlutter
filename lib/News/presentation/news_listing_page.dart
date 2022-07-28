import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/News/bloc/news_bloc.dart';
import 'package:news_app/News/bloc/news_event.dart';
import 'package:news_app/News/bloc/news_state.dart';
import 'package:news_app/News/model/news.dart';

class NewsListingPage extends StatefulWidget {
  static const String routeName = "/newsPage";

  const NewsListingPage({Key? key}) : super(key: key);

  @override
  State<NewsListingPage> createState() => _NewsListingPageState();
}

class _NewsListingPageState extends State<NewsListingPage> {
  @override
  void initState() {
    BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // IconButton(
                //     onPressed: () {
                //       print('we got here');
                //       BlocProvider.of<NewsBloc>(context).add(LoadNewsEvent());
                //     },
                //     icon: const Icon(
                //       Icons.refresh,
                //     )),
                Center(
                  child: BlocBuilder<NewsBloc, NewsState>(
                    builder: (contex, state) {
                      if (state is NewsLoadingState) {
                        return const CircularProgressIndicator();
                      } else if (state is NewsSuccessState) {
                        return state.newsList.isEmpty
                            ? const Center(
                                child: Text('...oppps,  No news found'),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                    children: state.newsList
                                        .sublist(0, 15)
                                        .map((news) => buildNewsCard(news))
                                        .toList()));
                      }
                      return Container();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Card buildNewsCard(News news) {
    print(news.toString());
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Image.network(news.urlToImage == null ? "" : news.urlToImage!),
          ListTile(
            leading: const Icon(Icons.arrow_drop_down_circle),
            title: Text(news.source!.name!),
            subtitle: Text(
              news.author!,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              news.content!,
              style: TextStyle(color: Colors.black.withOpacity(0.6)),
            ),
          ),
          // ButtonBar(
          //   alignment: MainAxisAlignment.start,
          //   children: [
          //     FlatButton(
          //       textColor: const Color(0xFF6200EE),
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: const Text('ACTION 1'),
          //     ),
          //     FlatButton(
          //       textColor: const Color(0xFF6200EE),
          //       onPressed: () {
          //         // Perform some action
          //       },
          //       child: const Text('ACTION 2'),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
