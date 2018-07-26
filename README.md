# Simple Carousel

Simple carousel for flutter apps with inifinite loop.

## Getting Started

### 1. Import it

```
import 'package:simple_carousel/components/simple_carousel.dart';
```

### 2. Call it
```
SimpleCarousel(
            autoplay: true,
            arrow: true,
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
        )
```

### 3. Properties
| Props                 | Type              | Default               |
| -------------         |:-------------:    | -----------           |
| alignment             | MainAxisAlignment | MainAxisAlignment.end |
| animationCurve        | Curve             | Curves.ease           |
| animationDuration     | Duration          | 300 ms                |
| autoplay              | Bool              | True                  |
| autoplayDuration      | Duration          | 3 s                   |
| arrow                 | Bool              | False                 |
| backgroundArrow       | Color             | Colors.white70        |
| backgroundLink        | Color             | Colors.white70        |
| backgroundTitle       | Color             | Colors.white70        |
| fontColorLink         | Color             | Colors.black          |
| fontColorTitle        | Color             | Colors.black          |
| direction             | Axis              | Axis.horizontal       |
| fit                   | BoxFit            | BoxFit.fill           |
| height                | Double            | 100.0                 |
| visibleLink           | Bool              | True                  |
| visibleTitle          | Bool              | True                  |
| images                | List<String>      | -                     |
| links                 | List<String>      | -                     |
| title                 | List<String>      | -                     |


For help getting started with Flutter, view our online
[documentation](https://flutter.io/).