// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  Color bgColor = const Color(0xffFCFCFC);
  Color appBlack = const Color(0xff212C2E);
  Color appOrange = const Color(0xffFF6F52);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'ԳՈՌ',
                  style: TextStyle(
                      color: appBlack,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Icon(Icons.chevron_right_outlined, color: appBlack)
              ],
            ),
            Text(
              'էքսպերտ',
              style: TextStyle(color: appBlack, fontSize: 10),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: appBlack,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: appBlack,
            ),
          ),
        ],
        leading: Container(
          margin: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 129, 129, 129),
            // color: Color(0xffF3F5F5),
            shape: BoxShape.circle,
          ),
          child: IconButton(
            iconSize: 20,
            onPressed: () {},
            icon: const Icon(
              Icons.person,
              color: Color(0xff37424A),
            ),
          ),
        ),
      ),
      body: body(),
    );
  }

  Widget body() {
    return SingleChildScrollView(
      child: Column(
        children: [
          balance(),
          services(),
        ],
      ),
    );
  }

  Widget balance() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.all(15),
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xffF3F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.remove_red_eye_sharp),
                    ],
                  ),
                  Text('Հաշվեկշիռ'),
                  Text('0.00 Դ'),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appOrange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: Text(
                            'Համալրել',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Color(0xff6FD8FF),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget services() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          serviceItem(title: '', bgColor: Colors.red, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.green, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.orange, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.black, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.amber, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.cyan, imageURL: ''),
          serviceItem(title: '', bgColor: Colors.yellow, imageURL: ''),
        ],
      ),
    );
  }

  Widget serviceItem(
      {required String title,
      String? subtitle,
      required Color bgColor,
      required String imageURL}) {
    return Container(
      width: 100,
      height: 180,
      color: bgColor,
    );
  }
}
