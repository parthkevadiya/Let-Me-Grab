import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:letmegrab/controller/home_controller.dart';
import 'package:letmegrab/controller/login_controller.dart';
import 'package:letmegrab/utils/constant.dart';
import 'package:letmegrab/utils/indicator.dart';
import 'package:letmegrab/view/common_widget/common_text.dart';
import 'package:letmegrab/view/common_widget/common_textField.dart';
import 'package:letmegrab/view/home/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final homeCon = Get.put<HomeController>(HomeController());
  final authCon = Get.put<AuthController>(AuthController());
  @override
  void initState() {
    super.initState();
    homeCon.getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(text: "News", fontSize: 20, fontWeight: FontWeight.bold, color: AppColor.white),
        centerTitle: true,
        actions: [
          InkWell(onTap: () => authCon.logOut(), child: const Icon(Icons.logout)),
          const SizedBox(width: 20),
        ],
      ),
      body: SafeArea(
        child: Obx(
          () => Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                CommonTextField(
                    borderColor: AppColor.primaryColor,
                    con: homeCon.search,
                    onChanged: (v) => homeCon.searchingByTitle()),
                const SizedBox(height: 10),
                homeCon.load.value
                    ? Expanded(child: ProgressView(color: AppColor.primaryColor))
                    : homeCon.articles.isEmpty
                        ? const Expanded(
                            child: Center(
                              child: CommonText(
                                text: "No data found",
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        : Expanded(
                            child: homeCon.searchList.isEmpty
                                ? ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                                    itemCount: homeCon.articles.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => DetailScreen(
                                            urlToImage: homeCon.articles[index].urlToImage,
                                            title: homeCon.articles[index].title,
                                            content: homeCon.articles[index].content,
                                            description: homeCon.articles[index].description,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black.withOpacity(0.3), blurRadius: 3, spreadRadius: 3)
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(color: AppColor.primaryColor),
                                              imageUrl: homeCon.articles[index].urlToImage ?? "",
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                            ),
                                            const SizedBox(height: 20),
                                            CommonText(
                                              text: homeCon.articles[index].title ?? "",
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(height: 10),
                                            CommonText(
                                              text: homeCon.articles[index].content ?? "",
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    physics: const BouncingScrollPhysics(),
                                    separatorBuilder: (context, index) => const SizedBox(height: 15),
                                    itemCount: homeCon.searchList.length,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => DetailScreen(
                                            urlToImage: homeCon.searchList[index].urlToImage,
                                            title: homeCon.searchList[index].title,
                                            content: homeCon.searchList[index].content,
                                            description: homeCon.searchList[index].description,
                                          ),
                                        );
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color: AppColor.white,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(0.3),
                                              blurRadius: 3,
                                              spreadRadius: 3,
                                            )
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            CachedNetworkImage(
                                              placeholder: (context, url) =>
                                                  const CircularProgressIndicator(color: AppColor.primaryColor),
                                              imageUrl: homeCon.searchList[index].urlToImage ?? "",
                                              errorWidget: (context, url, error) => const Icon(Icons.error),
                                            ),
                                            const SizedBox(height: 20),
                                            CommonText(
                                              text: homeCon.searchList[index].title ?? "",
                                              fontWeight: FontWeight.w600,
                                            ),
                                            const SizedBox(height: 10),
                                            CommonText(
                                              text: homeCon.searchList[index].content ?? "",
                                              color: Colors.grey,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
