import 'package:flutter/material.dart';
import '../functions/show_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/news_links.dart';
import 'dart:core';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
		return MaterialApp(
			debugShowCheckedModeBanner: false,
			title: "Assamese News Paper",
			theme: ThemeData(
				primaryColor: Colors.blueGrey
			),
			home: Scaffold(
				appBar: AppBar(
					title: Text("Assamese News")
				),
				body: PaperLinkPage(),
			),
		);
    }
}
class PaperLinkPage extends StatefulWidget {
  @override
  _PaperLinkPageState createState() => _PaperLinkPageState();
}

class _PaperLinkPageState extends State<PaperLinkPage> {
	final int links = 2;
	List<NewsLinks> newsLinks;
	@override
	void initState() {
		super.initState();
		newsLinks = _itemList();	
	}
  @override
	Widget build(BuildContext context) {
	// var size = MediaQuery.of(context).size;
	// final double itemHeight = (size.height - kToolbarHeight-24)/2;
	// final double itemWidth = size.width/2;
		return OrientationBuilder(
			builder: (context, orientation){				
				return GridView.count(
					crossAxisCount: orientation==Orientation.portrait ? 2 : 3,
					shrinkWrap: true,
					// childAspectRatio: (itemWidth/itemHeight),
					padding: EdgeInsets.all(1),
					children: List.generate(newsLinks.length, (index){
						return _getNewsGrid(newsLinks[index]);
					}),
				);
			},
		);

	}
	dynamic _showPage(url, name){
		Navigator.push(
			context,
			MaterialPageRoute(builder: (context) => NewsPage(url:url, title:name)),
		);
	}
	Widget _getNewsGrid(NewsLinks item){
		return GestureDetector(
			child: Card(
				elevation: 1.5,
				child: Column(
						crossAxisAlignment: CrossAxisAlignment.center,
						mainAxisSize: MainAxisSize.min,
						verticalDirection: VerticalDirection.down,
						children: <Widget>[
							Container(
								padding: EdgeInsets.only(top: 20),
							),
							Image(image: AssetImage("${item.logo}"),
								height: 90,
								// width: 100,
								fit: BoxFit.fill,
							),
							Container(
								// color: Colors.grey,
								// height: 1,
							),
							new Padding(
								padding: EdgeInsets.only(top: 20),
								child: new Column(
									crossAxisAlignment: CrossAxisAlignment.start,
									children: <Widget>[
										FittedBox(
											child: Text("${item.name}",
												style: TextStyle(
													fontWeight: FontWeight.bold
												),
											),
										)
									// new Text(country.nativeName),
									// new Text(country.capital),
									],
								),
							)
						],
				),
			),
			onTap: (){
				setState(() {
						_showPage(item.url, item.name)	;	  
				});
			},
				// print("$item.name")
		);
	}
	List<NewsLinks> _itemList() {
		var nowDate = DateTime.now();
		var now = new  DateTime(nowDate.year, nowDate.month, nowDate.day-1);;
		var formatter = new DateFormat('ddMMyyyy');
		String formatted = formatter.format(now);
		print(formatted); // something like 2013-04-20
    return [
			NewsLinks(
				name: "Dainik Janambhumi",
				url: "http://dainikjanambhumi.co.in",
				logo: "assets\\news_logo\\log_dainik_janambhumi.jpg"
			),			
			NewsLinks(
				name: "Pratidin",
				url: "https://epaper.asomiyapratidin.in/",
				logo: "assets\\news_logo\\logo_pratidin.jpg"
			),
			NewsLinks(
				name: "Niyomia Barta",
				url: "http://www.niyomiyabarta.org/",
				logo: "assets\\news_logo\\logo_n_barta.jpg"
			),
			NewsLinks(
				name: "Assamiya Khabor",
				url: "http://www.assamiyakhabor.com/",
				logo: "assets\\news_logo\\logo_amar_axom.jpg"
			),
			NewsLinks(
				name: "Amar Asom",
				url: "http://amarasom.glpublications.in/",
				logo: "assets\\news_logo\\logo_amar_axom.jpg"
			),
			NewsLinks(
				name: "Gana Adhikar",
				url: "http://ganaadhikar.com/ganaadhikar/epaper/"+formatted+"/page1.html",
				logo: "assets\\news_logo\\logo_gana_adhikar.jpg"
			),
			NewsLinks(
				name: "Hadin",
				url: "http://www.sadin.co.in/",
				logo: "assets\\news_logo\\logo_hadin.jpg"
			),
			NewsLinks(
				name: "The Assam Tribune",
				url: "http://www.assamtribune.com/epaper/index.html",
				logo: "assets\\news_logo\\logo_tribune.jpg"
			),
			NewsLinks(
				name: "The Sentinal",
				url: "https://www.sentinelassam.com/",
				logo: "assets\\news_logo\\logo_sentinal.jpg"
			),
			NewsLinks(
				name: "Purbanchal Prahari",
				url: "http://pp.glpublications.in/",
				logo: "assets\\news_logo\\logo_purbanchal.jpg"
			),
			NewsLinks(
				name: "Dainik Purbodai",
				url: "http://dainikpurvoday.com/",
				logo: "assets\\news_logo\\logo_dainik_purpadai.jpg"
			),
			NewsLinks(
				name: "Samayik Prasanga",
				url: "http://www.samayikprasanga.in/epaper.php",
				logo: "assets\\news_logo\\logo_prasanga.jpg"
			),
		];
	}
}

	class SecondPageRoute extends CupertinoPageRoute {
		SecondPageRoute()
			: super(builder: (BuildContext context) =>  NewsPage());
		// OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
		// /* @override
		// Widget buildPage(BuildContext context, Animation<double> animation,
		// 	Animation<double> secondaryAnimation) {
		// 	return  FadeTransition(opacity: animation, child:  NewsPage());
		// } */
		 // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
		/* @override
		Widget buildPage(BuildContext context, Animation<double> animation,
			Animation<double> secondaryAnimation) {
				return new RotationTransition(
					turns: animation,
					child: new ScaleTransition(
						scale: animation,
						child: new FadeTransition(
							opacity: animation,
							child: new NewsPage(),
						),
					)
				);
			}
		} */
	}