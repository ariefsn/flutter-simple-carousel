# Simple Carousel

Simple carousel for flutter apps with inifinite loop.

## Getting Started
1. [Import It](#1-import-it)
2. [Call It](#2-call-it)
3. [Props](#3-properties)

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
| -------------         |-------------      | -----------           |
| alignment             | MainAxisAlignment | MainAxisAlignment.end |
| animationCurve        | Curve             | Curves.ease           |
| animationDuration     | Duration          | 300 ms                |
| arrow                 | Bool              | False                 |
| autoplay              | Bool              | True                  |
| autoplayDuration      | Duration          | 3 s                   |
| backgroundArrow       | Color             | Colors.white70        |
| backgroundLink        | Color             | Colors.white70        |
| backgroundTitle       | Color             | Colors.white70        |
| direction             | Axis              | Axis.horizontal       |
| fit                   | BoxFit            | BoxFit.fill           |
| fontColorLink         | Color             | Colors.black          |
| fontColorTitle        | Color             | Colors.black          |
| height                | Double            | 100.0                 |
| images                | List<String>      | -                     |
| links                 | List<String>      | -                     |
| title                 | List<String>      | -                     |
| visibleLink           | Bool              | True                  |
| visibleTitle          | Bool              | True                  |

For help getting started with Flutter, view our online
[documentation](https://flutter.io/).