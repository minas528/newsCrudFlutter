import 'package:flutter/material.dart';
import 'package:news_app/News/presentation/news_listing_page.dart';

class PageRouter {
  static Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case NewsListingPage.routeName:
        return MaterialPageRoute(builder: (context) {
          return const NewsListingPage();
        });
    }
    return null;
  }
}
