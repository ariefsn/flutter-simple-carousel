import 'dart:async';
import 'package:flutter/material.dart';

// Create by Arief Setiyo Nugroho <ayiexz22@gmail.com>
// https://github.com/ayiexz/flutter-simple-carousel

class SimpleCarousel extends StatefulWidget {
  SimpleCarousel({
      this.alignment          = MainAxisAlignment.end,
      this.animationCurve     = Curves.ease,
      this.animationDuration  = const Duration(milliseconds: 300),
      this.autoplay           = true,
      this.autoplayDuration   = const Duration(seconds: 3),
      this.arrow              = false,
      this.backgroundLink     = Colors.white70,
      this.backgroundTitle    = Colors.white70,
      this.backgroundArrow    = Colors.white70,
      this.direction          = Axis.horizontal,
      this.fit                = BoxFit.fill,
      this.fontColorLink      = Colors.black,
      this.fontColorTitle     = Colors.black,
      this.height             = 100.0,
      this.images,
      this.links,
      this.titles,
      this.visibleLink        = true,
      this.visibleTitle       = true,
  });

  final MainAxisAlignment alignment;
  final Curve animationCurve;
  final Duration animationDuration;
  final bool autoplay;
  final bool arrow;
  final Duration autoplayDuration;
  final Color backgroundTitle;
  final Color backgroundLink;
  final Color backgroundArrow;
  final Color fontColorTitle;
  final Color fontColorLink;
  final List<String> images;
  final List<String> links;
  final List<String> titles;
  final Axis direction;
  final double height;
  final BoxFit fit;
  final visibleTitle;
  final visibleLink;

  @override
  _SimpleCarouselState createState() => _SimpleCarouselState();
}

class _SimpleCarouselState extends State<SimpleCarousel> {
  PageController _ctrlPage = new PageController(initialPage: 999, keepPage: true);
  int _imageIndex;

  goToLink(String link){
    print(link);
  }

  @override
    void initState() {
      // TODO: implement initState
      PageStorageKey(_ctrlPage);
      super.initState();
      autoplay();
    }

  autoplay(){
    if(widget.autoplay) {
      new Timer.periodic(widget.autoplayDuration, (_) {
        _ctrlPage.nextPage(duration: widget.animationDuration, curve: widget.animationCurve);
      });
    }
  }

  void _dialogImageTap(int index, [String title = '', String link = '']){
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        content: new Container(
          height: 50.0,
          child: new Column(
            children: <Widget>[
              title != '' ? new Text("Title : "+title) : null,
              link != '' ? new Text("Link : "+link) : null,
            ],
          ),
        )
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: widget.height,
          child: new GestureDetector(
            onTap: (){
              int index     = _imageIndex % widget.links.length;
              String title  = widget.titles[_imageIndex % widget.titles.length];
              String link   = widget.links[_imageIndex % widget.links.length];
              print(title);
              print(link);
              _dialogImageTap(index, title, link);
            },
            child: new PageView.builder(
              scrollDirection: widget.direction,
              controller: _ctrlPage,
              onPageChanged: (int index){
                setState(() {
                  _imageIndex = index.floor();
                });
                print("ctrPage = "+_ctrlPage.page.round().toString());
                print("state = "+_imageIndex.toString());
              },
              key: new PageStorageKey(_ctrlPage),
              itemBuilder: (context, index) {
                return new Stack(
                  children: <Widget>[
                    new Center(
                      child: new CircularProgressIndicator(),
                    ),
                    new Center(
                      child: new Image.network(
                        widget.images[index % widget.images.length],
                        fit: widget.fit,
                        height: double.infinity,
                        width: double.infinity,
                        alignment: Alignment.center,
                      )
                    ),
                    new Column(
                      mainAxisAlignment: widget.alignment,
                      children: <Widget>[
                        widget.arrow == true ?
                        new Arrow(
                          background: Colors.white70,
                          height: widget.height,
                          previous: (){
                            _ctrlPage.previousPage(
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 300)
                            );
                          },
                          next: (){
                            _ctrlPage.nextPage(
                              curve: Curves.ease,
                              duration: Duration(milliseconds: 300)
                            );
                          },
                        ) : new Container(),
                        new Container(
                          padding: new EdgeInsets.only(top: 10.0, bottom: 10.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              widget.visibleTitle ? TitleImage(bgTitle: widget.backgroundTitle, title: widget.titles[index % widget.titles.length], fontColor: widget.fontColorTitle,) : new Container(),
                              widget.visibleLink ? LinkImage(bgLink: widget.backgroundLink, index: _imageIndex, link: widget.links[index % widget.links.length], title: widget.titles[index % widget.titles.length], onTap: (){_dialogImageTap(_imageIndex % widget.links.length, widget.titles[_imageIndex % widget.titles.length], "Button to "+widget.links[_imageIndex % widget.links.length]); }, fontColor: widget.fontColorLink,) : new Container(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        )
      ],
    );
  }
}

class TitleImage extends StatelessWidget {
  TitleImage({
    this.bgTitle,
    this.fontColor,
    this.title
  });
  final Color bgTitle;
  final Color fontColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: bgTitle,
      padding: new EdgeInsets.only(left: 10.0, right: 10.0),
      child: new Text(title, style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: fontColor)),
    );
  }
}

class LinkImage extends StatelessWidget {
  LinkImage({
    this.index,
    this.bgLink,
    this.fontColor,
    this.link,
    this.onTap,
    this.title
  });
  final int index;
  final Color bgLink;
  final Color fontColor;
  final String link;
  final Function onTap;
  final String title;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      child: new Container(
        color: bgLink,
        padding: new EdgeInsets.only(left: 10.0),
        child: new Row(
          children: <Widget>[
            new Text("Visit", style: new TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: fontColor),),
            new Icon(Icons.arrow_right, color: fontColor,)
          ],
        ),
      ),
      onTap: onTap
    );
  }
}

class Arrow extends StatelessWidget {
  Arrow({
    @required this.height,
    @required this.background,
    @required this.previous,
    @required this.next,
  });

  final double height;
  final Color background;
  final Function previous;
  final Function next;

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: new EdgeInsets.only(bottom: height/3.8),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new FlatButton(
            child: new Icon(Icons.arrow_left, size: 50.0, color: background,),
            onPressed: previous,
          ),
          new FlatButton(
            child: new Icon(Icons.arrow_right, size: 50.0, color: background,),
            onPressed: next,
          ),
        ],
      ),
    );
  }
}