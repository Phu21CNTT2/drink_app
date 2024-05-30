import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:drinkapp/view/resource/responsive.dart';

class CarouselSliderHome extends StatelessWidget {
  final List<String> slides;
  const CarouselSliderHome({super.key, required this.slides});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: slides.length,
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            slides[index],
            fit: BoxFit.contain,
          ),
        );
      },
      options: CarouselOptions(
        height: Responsive.size(context) / 2,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn, // tốc độ chạy
        pauseAutoPlayOnTouch: true, // khi chạm vào thì dừng
        aspectRatio: 1.0,
        enlargeCenterPage: true, // phóng to ảnh giữa
        viewportFraction: 1.0, // chiều rộng của ảnh trong slide (1 là full)
      ),
    );
  }
}
