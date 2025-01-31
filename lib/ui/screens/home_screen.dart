import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onework2/data/controller/auth_controller.dart';
import 'package:onework2/data/utilities/style.dart';
import 'package:onework2/ui/screens/apply_screen.dart';
import 'package:onework2/ui/screens/auth/login_screen.dart';
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
        onPressed: () {
          Get.to(() => const ApplyScreen());
        },
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
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

                    AuthController.token == null ? const SizedBox() :

                    PopupMenuButton<dynamic>(
                        icon: const Icon(
                          CupertinoIcons.person_alt_circle,
                          size: 40,
                        ),
                        itemBuilder: (context) {
                          return [
                            PopupMenuItem(
                              child: Container(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  children: [
                                    Text(
                                      AuthController.user?.user?.name ?? "",
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: 'poppins'),
                                    ),
                                    Text(
                                      AuthController.user?.user?.email ?? "",
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: 'poppins'),
                                    ),
                                    Text(
                                      AuthController.user?.user?.phone ?? "",
                                      style: const TextStyle(
                                          fontSize: 16, fontFamily: 'poppins'),
                                    ),
                                    AuthController.token == null
                                        ? const SizedBox()
                                        : MaterialButton(
                                            color: Colors.red,
                                            onPressed: () {
                                              AuthController().clearAuthData();
                                              Get.to(
                                                  () => const LoginScreen());
                                            },
                                            child: const Text(
                                              "Logout",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontFamily: 'poppins',
                                                  color: Colors.white),
                                            ),
                                          )
                                  ],
                                ),
                              ),
                            ),
                          ];
                        })
                  ],
                ),
                SizedBox(
                  height: height * 0.016,
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.deepOrange.withOpacity(0.13),
                  ),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        servicesSizedBox(
                            width,
                            "assets/images/tool Icon.png",
                            "Our Expertise",
                            "OneWork is recognized for its reliable expertise for both candidates and companies looking for qualified talent."),
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
                // _reviewCard(height),
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

  Card _reviewCard(double height) {
    return Card(
        child: Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          const Row(
            children: [
              CircleAvatar(
                child: Icon(Icons.person),
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
                      style: TextStyle(fontSize: 9, color: Colors.black)),
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
    ));
  }
}
