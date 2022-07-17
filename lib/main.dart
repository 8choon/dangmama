import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dangmama/splash_screen.dart';
import 'package:dangmama/utils/logger.dart';


void main(){
  logger.d('My First log by logger!');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: _splashLoadingWidget(snapshot));
        }
    );
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if(snapshot.hasError){
      print('error');
      return Text('Error occur');
    }else if(snapshot.hasData){
      return TomatoApp();
    }else{
      return SplashScreen();
    }
  }
}


class TomatoApp extends StatelessWidget {
  const TomatoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}
