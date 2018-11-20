import 'package:flutter/material.dart';
import 'news_links.dart';
class NewsGridView extends StatefulWidget {
	@override
	_NewsGridViewState createState() => _NewsGridViewState();
}

class _NewsGridViewState extends State<NewsGridView> {
	NewsLinks news;
	_NewsGridViewState(this.news);
  @override
	Widget build(BuildContext context) {
		return GestureDetector(
			child: Card(
				elevation: 1.5,
				child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						mainAxisSize: MainAxisSize.min,
						verticalDirection: VerticalDirection.down,
						children: <Widget>[
							FlutterLogo(
								size: 100,
							),
							Container(
								
							)
							,
							new Padding(
								padding: EdgeInsets.only(top: 20),
								child: new Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
									new Text("hewllow World"),
									// new Text(country.nativeName),
									// new Text(country.capital),
									],
								),
							)
						],
				),
			),
			onTap: () =>
				print("$news.name")
		);
	}
}