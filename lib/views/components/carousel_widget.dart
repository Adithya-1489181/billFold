import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({super.key});

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          items: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Text("Carousel 1"),
                  //Chart(),
                  //Values()
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    offset: Offset(0, 2),
                    blurRadius: 2,
                  ),
                ],
              ),
              padding: EdgeInsets.all(20),
              height: 200,
              width: double.infinity,
              child: Row(
                children: [
                  Text("Carousel 2"),
                  //Chart(),//Values()
                ],
              ),
            ),
          ],
          options: CarouselOptions(viewportFraction: 1),
        ),
      ],
    );
  }
}
