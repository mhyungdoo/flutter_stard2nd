
import 'package:flutter/material.dart';
import 'package:flutter_stard2nd_accidentv2/view/main_page.dart';



void main() => runApp(MyApp());


class MyApp extends StatelessWidget {  //상태 변경할 필요가 없으므로 stateless로 변경. 상태 변경은 다른 파일로 분리
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: LoginPage(),  매번 로그인 페이지로 들어가니 바로 MainPage로 가도록 변경함.
      home: MainPage(),
    );
  }
}
