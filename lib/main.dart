import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> names = ["1.jpg",'2.jpg',"3.jpg"];
  List<String> titles = [
    'Welcome  ',
    'Something For Everyone',
    'A New Beginning ',
  ];
  List<String> descriptions = [
    'Welcome to GreenHouse... the dopest social network out! We are here to connect stoners to other stoners using interactive live group chats. Grow your following on our platform with a network where everyone is guaranteed to have one thing in common... a love for the plant.',
    'At GreenHouse you will find something for everyone. Whether you are here to chill, sesh with friends, catch a vibe, engage in brain stimulating conversations, or promote your business we have you covered.',
    'GreenHouse offers a deeper level of interactions that connoisseurs of the plant have not experienced. We plan to usher in a new digital age of cannabis social media that will create a positive impact for our users that will last a lifetime. When you are ready click that “Continue” button.',
  ];
  int index = 0;
  increment(){
    if(index ==2){
      setState((){
        index = index;
      });
    }else{
      setState((){
        index++;
      });
    }
  }
  decrement(){
    if(index ==0){
      setState((){
        index = index;
      });
    }else{
      setState((){
        index--;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: screen(names[index], index),
    );
  }

  Widget screen(String imgAddress, int index){

    return Stack(
      children: <Widget>[
        Image.asset(
          'assets/${imgAddress}',
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fill,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomCenter,
                child: index == 0 ?  Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
                            backgroundColor: MaterialStateProperty.all(Color(0xffD8A72D))
                        ),
                        child: Text('Next', style: TextStyle(fontSize: 18),), onPressed: (){
                      increment();
                    }),
                  ),
                ) :
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, left: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
                                backgroundColor: MaterialStateProperty.all(Color(0xff32B66C))
                            ),
                            child: Text('Back', style: TextStyle(fontSize: 18)), onPressed: (){
                          print(index);
                          decrement();
                        }),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20, right: 20),
                        child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 30)),
                                backgroundColor: MaterialStateProperty.all(Color(0xffD8A72D))
                            ),
                            child: Text(index == 2? 'Continue': 'Next', style: TextStyle(fontSize: 18)),
                            onPressed: (){
                              increment();
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Align(
                  child: Text(titles[index],
                  style: TextStyle(color: Color(0xff33B66B),
                      fontSize: 22, fontWeight: FontWeight.bold),)
              ),
              Container(
                padding: EdgeInsets.all(30),
                height: MediaQuery.of(context).size.height - 250,
                alignment: Alignment.bottomCenter,
                child: Text(descriptions[index],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      overflow: TextOverflow.visible,
                      fontWeight: FontWeight.bold,

                  ),

                ),
              )


    ],


    )
        ),
        Container(
          margin: EdgeInsets.only(bottom: 25),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: DotsIndicator(
              dotsCount: 3,
              position: index.toDouble(),
              decorator: DotsDecorator(
                  activeColor: Colors.green,
                  size: Size.square(8),
                  activeSize: Size(10, 10),
                  activeShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )

              ),
            ),
          ),
        ),

        Container(
          padding: EdgeInsets.all(50),
          width: MediaQuery.of(context).size.width,
          child: Container(
            alignment: Alignment.topCenter,
            width: 70,
              height: 150,
              child: Image.asset(
                  'assets/logo.png',
              width: 200,
              ),
          ),
        ),

      ],
    );
  }
}
