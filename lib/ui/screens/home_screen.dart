import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/widgets/banner_carousel.dart';
import 'package:onework2/ui/widgets/servicesSizedBox.dart';

import '../widgets/home_image_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        onPressed: () {},
        child: const Icon(
          Icons.add,
          size: 40,
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Onework',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontFamily: 'poppins',
                          ),
                        ),
                        Text(
                          'At your side for your job search.',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black,
                            fontFamily: 'poppins',
                          ),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage:
                          AssetImage("assets/images/avaterImage.png"),
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.016,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      fillColor: Colors.grey[300],
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                        color: Colors.black,
                      ),
                      hintText: "Search Anything..",
                      hintStyle: const TextStyle(
                          fontSize: 14,
                          fontFamily: "poppins",
                          color: Colors.black)),
                ),
                SizedBox(
                  height: height * 0.024,
                ),
                SingleChildScrollView(
                  child: Row(
                    children: [
                      Expanded(
                          child: homeImageContainer(
                        "assets/images/open work image 1.jpg",
                        "Large Retail",
                      )),
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Expanded(
                          child: homeImageContainer(
                        "assets/images/open work Image 2.jpg",
                        "Hotel and Catering",
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Container(
                  height: height * 0.23,
                  width: double.infinity,
                  color: Colors.deepOrange.withOpacity(0.13),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        servicesSizedBox(
                            width,
                            "assets/images/tool Icon.png",
                            "Our Expertise",
                            "OneWork is recognized for its reliable expertise for both candidates and companies looking for qualified talent."),
                        servicesSizedBox(
                            width,
                            "assets/images/message icon.png",
                            "The Onework Process",
                            "OneWork implements a rigorous recruitment process to ensure the quality of service."),
                        servicesSizedBox(
                            width,
                            "assets/images/shopping bag icon.png",
                            "Tailored to your needs",
                            "We are committed to offering a personalized service, tailored to the specific needs of our clients and candidates."),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Card(
                    child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          CircleAvatar(
                            backgroundImage:
                                AssetImage("assets/images/avaterImage.png"),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "  Sarah Adel  ",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 18,
                                  ),
                                ],
                              ),
                              Text("   Cashier",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.black)),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      const Text(
                          'Onework consultants supported me thoughtout my mission search',
                          style: TextStyle(fontSize: 12, color: Colors.black))
                    ],
                  ),
                )),
                BannerCarouselWidget(
                  bannerList: carouselImageList,
                  height: height,
                  width: width,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
