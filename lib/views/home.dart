import 'package:flutter/material.dart';
import 'package:simple_carousel/components/simple_carousel.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  List<String> _titles = [
    "PES 2017",
    "PES 2018",
    "PES 2019",
    "FIFA 17",
    "FIFA 18",
    "FIFA 19",
  ];

  List<String> _links = [
    "Link to PES 2017",
    "Link to PES 2018",
    "Link to PES 2019",
    "Link to FIFA 17",
    "Link to FIFA 18",
    "Link to FIFA 19",
  ];

  List<String> _images = [
    "https://i.ytimg.com/vi/tSntvZtQSZc/maxresdefault.jpg",
    "https://i.ytimg.com/vi/HFVffivP1RU/maxresdefault.jpg",
    "https://i.ytimg.com/vi/7fgZD42pGDo/maxresdefault.jpg",
    "https://d26bwjyd9l0e3m.cloudfront.net/wp-content/uploads/2016/11/FIFA-17-Featured.jpg",
    "http://assets1.ignimgs.com/2018/02/16/fifa-18-blogroll-1518781457127_1280w.jpg",
    "https://the18.com/sites/default/files/styles/feature_image_with_focal/public/feature-images/20180418-The18-Image-Fifa-19-Champions-League-Possibility.jpg?itok=KWQmA0pg",
  ];



  Axis direction = Axis.vertical;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new SafeArea(
        child: new Container(
          child: SimpleCarousel(
            autoplay: true,
            direction: Axis.horizontal,
            fit: BoxFit.fill,
            fontColorLink: Colors.black,
            images: _images,
            height: 250.0,
            links: _links,
            titles: _titles,
            visibleTitle: true,
            visibleLink: true,
          ),
        ),
      )
    );
  }
}