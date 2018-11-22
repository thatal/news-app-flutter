import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';
import 'package:firebase_admob/firebase_admob.dart';
final testDevice = "";
class NewsPage extends StatefulWidget {
	final url;
	final title;
	NewsPage({Key key, this.url, this.title}) : super(key:key);
	@override
	_NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
	static final MobileAdTargetingInfo targetingInfo = new MobileAdTargetingInfo(
		testDevices: <String> [],
		keywords: <String>['Book', 'Book review','educational', 'entertainment'],
		// birthday: new DateTime.now(),
		childDirected: true

	);
	BannerAd _bannerAd;
	InterstitialAd _interstitialAd;

	String currentUrl;
	FlutterWebviewPlugin fluterWebViewp = FlutterWebviewPlugin();
	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			theme: ThemeData(primaryColor: Colors.blueGrey),
			title: "Assamese News Paper",
			debugShowCheckedModeBanner: false,
			routes: {
				"/": (_) => new WebviewScaffold(
					scrollBar: true,
					url: widget.url,
					appBar: new AppBar(
						title: new Text("${widget.title}"),
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
										Scaffold.of(context).showSnackBar(SnackBar(content: Text("Refreshed.")));
										// SnackBar(content: Text("Page Refreshed."));
									});
								}
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
					supportMultipleWindows: true,
					persistentFooterButtons: <Widget>[
						Text("Hi this is for add")
					]
				),
			},
		);
	}
	BannerAd createrBannerAdd(){
		return BannerAd(
			adUnitId: BannerAd.testAdUnitId,
			size: AdSize.banner,
			listener: (MobileAdEvent event){
				print("Baner event: $event");
			}
		);
	}
	InterstitialAd createInterstialAdd(){
		return InterstitialAd(
			adUnitId: BannerAd.testAdUnitId,
			listener: (MobileAdEvent event){
				print("InterstitialAd Banner event: $event");
			}
		);
	}
	
	@override
	void initState() {
		FirebaseAdMob.instance.initialize(appId: FirebaseAdMob.testAppId);
		_bannerAd = createrBannerAdd()..load()..show();
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
		fluterWebViewp.onHttpError.listen((WebViewHttpError error){
			print(error.code);
			setState(() {
				Dialog(
					child: Text("Whoops Something went wrong."),
				);
			});
			
		});
		fluterWebViewp.onDestroy.listen((_){
			if(Navigator.canPop(context)){
				Navigator.of(context).pop();
			}
		});
	}
	void dispose(){
		super.dispose();
		_bannerAd?.dispose();
		_interstitialAd?.dispose();
		fluterWebViewp.dispose();
	}
	
}
