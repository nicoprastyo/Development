import 'package:development/pages/form_registration.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:development/model/intro.dart';
import 'package:development/assets/ColorPellete.dart';

class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final List<Intro> introList = [
    Intro(
        image: "assets/images/intro-slider1.png",
        title: "Looking for the Best Careers Near You?",
        description:
            "Dive into Thousands of most looked-for positions top industries and software skills"),
    Intro(
        image: "assets/images/intro-slider2.png",
        title: "Easy to Use",
        description:
            "User-friendly, easy to navigate. find your dream career on-the-go!"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Swiper.children(
        index: 0,
        autoplay: false,
        loop: false,
        pagination: SwiperPagination(
          margin: EdgeInsets.only(bottom: 20.0),
          builder: DotSwiperPaginationBuilder(
              color: ColorPalette.dotColor,
              activeColor: ColorPalette.dotColorActive,
              size: 10.0,
              activeSize: 10.0),
        ),
        control: SwiperControl(
          iconNext: null,
          iconPrevious: null,
        ),
        children: _buildPage(context),
      ),
    );
  }

  List<Widget> _buildPage(BuildContext context) {
    List<Widget> widgets = [];
    for (int i = 0; i < introList.length; i++) {
      Intro intro = introList[i];
      widgets.add(Container(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 6,
        ),
        child: ListView(
          children: <Widget>[
            Image.asset(intro.image,
                height: MediaQuery.of(context).size.height / 3.5),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 20.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 20.0),
              child: Text(
                intro.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 35.0),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height / 20.0),
              child: Text(
                intro.description,
                style: TextStyle(
                  color: ColorPalette.descriptionColor,
                  fontSize: 12.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0, right: 30, left: 30),
              child: InkWell(
                splashColor: Colors.red,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => FormRegistration()));
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      // gradient: LinearGradient(
                      // colors: [Color(0XFFEAA060), Color(0XFF096D65)]),
                      color: Color(0XFF096D65),
                      borderRadius: BorderRadius.circular(3.0)),
                  child: Text('Registration',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.w600)),
                ),
              ),
            ),
          ],
        ),
      ));
    }
    return widgets;
  }
}
