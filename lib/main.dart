import 'package:flutter/material.dart';
import 'package:foodpage/home_page/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('anh/eightytwenty_thumbnail.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomLeft,
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.7),
                  Colors.black.withOpacity(.2),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TweenAnimationBuilder(
                    tween: Tween<Offset>(
                        begin: Offset(1, 0), end: Offset(0, 0)),
                    duration: Duration(milliseconds: 600),
                    builder: (context, Offset offset, child) {
                      return Transform.translate(
                        offset: offset * MediaQuery.of(context).size.width,
                        child: Text(
                          'Talking Order For Delivery',
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            height: 1.3,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<Offset>(
                        begin: Offset(1, 0), end: Offset(0, 0)),
                    duration: Duration(milliseconds: 800),
                    builder: (context, Offset offset, child) {
                      return Transform.translate(
                        offset: offset * MediaQuery.of(context).size.width,
                        child: Text(
                          "See restaurants nearby by \nadding location",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            height: 1.4,
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<Offset>(
                        begin: Offset(1, 0), end: Offset(0, 0)),
                    duration: Duration(milliseconds: 1000),
                    builder: (context, Offset offset, child) {
                      return Transform.translate(
                        offset: offset * MediaQuery.of(context).size.width,
                        child: Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.yellow,
                              Colors.orange,
                            ]),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context)=>Home()
                                  )
                              );
                            },
                            child: Text(
                              'Start',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TweenAnimationBuilder(
                    tween: Tween<Offset>(
                        begin: Offset(1, 0), end: Offset(0, 0)),
                    duration: Duration(milliseconds: 1200),
                    builder: (context, Offset offset, child) {
                      return Transform.translate(
                        offset: offset * MediaQuery.of(context).size.width,
                        child: Align(
                          child: Text(
                            'Now Deliver To Your Door 24/7',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 17,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
