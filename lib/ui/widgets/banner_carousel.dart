import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:onework2/data/models/person_model.dart';

class BannerCarouselWidget extends StatefulWidget {
  final double height;
  final double width;
  final List<Person> bannerList;

  const BannerCarouselWidget({
    required this.bannerList,
    super.key,
    required this.height,
    required this.width,
  });

  @override
  State<BannerCarouselWidget> createState() => _BannerCarouselWidgetState();
}

class _BannerCarouselWidgetState extends State<BannerCarouselWidget> {
  ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              currentIndex.value = index;
            },
            height: widget.height * 0.4 ?? 180,
            viewportFraction: 1,
            autoPlay: true,
          ),
          items: widget.bannerList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: widget.width * 0.9,
                  height: widget.height * 0.4,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.orange[100],
                    borderRadius: BorderRadius.circular(16),
                  ),
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          i.imagePath ?? '',
                          fit: BoxFit.fitHeight,
                          height: widget.height * 0.1,
                        ),
                        SizedBox(
                          height: Get.height * 0.01,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(
                            i.des,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: widget.height * 0.02,
                        ),
                        Text(
                          i.name,
                          style: const TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          i.designation,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(
          height: 4,
        ),
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 14,
                    width: 14,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: i == index ? Colors.black : Colors.white,
                      border: Border.all(
                        color: i == index ? Colors.black54 : Colors.grey,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
              ],
            );
          },
        )
      ],
    );
  }
}
