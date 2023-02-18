import 'package:demo/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controller/data_controller.dart';
import 'controller/data_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [

  
    ChangeNotifierProvider<DataController>(
  create: (_) => DataController(),)
  
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
   
          primarySwatch: Colors.blue,
        ),
        home:  SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
   SplashScreen({super.key, });
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    Future<void> _delayAndGotoNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));
   
    Navigator.of(context).push(
    MaterialPageRoute(
      builder: (context) => const MaineScreen(),
    ),
  );
    // Go to intro screen
 }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _delayAndGotoNextScreen();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Center(
        child: Text("Welcome")
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}



class MaineScreen extends StatefulWidget {
  const MaineScreen({super.key});

  @override
  State<MaineScreen> createState() => _MaineScreenState();
  
  
}

class _MaineScreenState extends State<MaineScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final dataController=Provider.of<DataController>(context,listen: false);
     dataController.getMainData(context);
  }
  @override
  Widget build(BuildContext context) {
        final dataController=Provider.of<DataController>(context,listen: false);

    return Scaffold(
       
        body:  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            dataController.mainData?.fullPrice.toString()??"",
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(child: Text('Dummy Card Text')),
                  ),
            ),
          ),
          Text(
            'Demo Headline 2',
            style: TextStyle(fontSize: 18),
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemBuilder: (ctx,int){
                return Card(
                  child: ListTile(
                      title: Text('Motivation $int'),
                      subtitle: Text('this is a description of the motivation')),
                );
              },
            ),
          ),
        ],
      ),
      );
  }
}

