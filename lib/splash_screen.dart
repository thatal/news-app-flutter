import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
	Widget build(BuildContext context) {
		return MaterialApp(
			title: "Assamese News Paper",
			theme: ThemeData(
				primaryColor: Colors.redAccent,
				accentColor: Colors.white,
				brightness: Brightness.light
			),
			home: new SplashScreenContent(),
		);
	}
}
class SplashScreenContent extends StatelessWidget {
  @override
	Widget build(BuildContext context) {
		return Scaffold(
			// appBar: AppBar(
			// 	// title: Text("Assamese News Paper"),
			// 	backgroundColor: Colors.transparent,
			// ),
			backgroundColor: Colors.redAccent,
			body: Stack(
				children: <Widget>[
					Column(
						textBaseline: TextBaseline.alphabetic,
						mainAxisAlignment: MainAxisAlignment.center,
						children: <Widget>[
							Center(
								child:FlutterLogo(
									size: 100,
								)
							),
							// Container(
							// 	height: 20,
							// ),
							// Center(
							// 	child: CircularProgressIndicator(
							// 		strokeWidth: 3,
							// 	)
							// ),
							// Center(
							// 	child: Text("Welcome")
								
							// )
						],
					)
				],
			),

		);
	}
}