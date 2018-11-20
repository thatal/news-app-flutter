import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';
// import '../ui/home_page.dart';
class NewsPage extends StatefulWidget {
	final url;
	final title;
	NewsPage({Key key, this.url, this.title}) : super(key:key);
	@override
	_NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
	String currentUrl;
	FlutterWebviewPlugin fluterWebViewp = FlutterWebviewPlugin();
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(primaryColor: Colors.blueGrey),
			title: "Assamese News Paper",
			routes: {
				"/": (_) => new WebviewScaffold(
					scrollBar: true,
					url: widget.url,
					appBar: new AppBar(
						title: new Text("Assamese News"),
						// automaticallyImplyLeading: true,
						actions: <Widget>[
							IconButton(
								icon: Icon(Icons.home),
								onPressed: (){
									setState(() {
										Navigator.pop(context);
									});
								},
							),
							IconButton(
								icon: Icon(
									Icons.refresh
								),
								onPressed: (){
									setState(() {
										fluterWebViewp.reload();
										// Scaffold.of(context).showSnackBar(SnackBar(content: Text("Refreshed.")));
										SnackBar(content: Text("Page Refreshed."));
									});
								},
							),
							IconButton(
								icon: Icon(Icons.share),
								onPressed: (){
									// print("Icon Button Taped");
									setState(() {
										print("${this.currentUrl}");																		  
										Share.share("Check out this News ${this.currentUrl} shared via News App");
									});
								},
							)
						],
					),		  
					withZoom: true,
					withLocalStorage: false,
					hidden: false,
					enableAppScheme: true,
					userAgent: "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:58.0) Gecko/20100101 Firefox/58.0",
					persistentFooterButtons: <Widget>[
						Text("Hi this is for add")
					],
				),
			},
		);
	}
	
	@override
	void initState() {
		super.initState();
		fluterWebViewp.onStateChanged.listen((WebViewStateChanged wvs){
			print(wvs.type);
		});
		fluterWebViewp.onUrlChanged.listen((String url){
			print(url);
			setState(() {
				this.currentUrl = url;
			});
		});
	}
	void dispose(){
		super.dispose();
		fluterWebViewp.dispose();
	}
	
}
