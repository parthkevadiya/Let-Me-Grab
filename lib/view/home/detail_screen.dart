import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:letmegrab/utils/constant.dart';
import 'package:letmegrab/view/common_widget/common_text.dart';

class DetailScreen extends StatelessWidget {
  String? urlToImage;
  String? title;
  String? content;
  String? description;
  DetailScreen({super.key, this.urlToImage, this.title, this.content, this.description});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          text: "News Detail",
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColor.white,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              CachedNetworkImage(
                placeholder: (context, url) => const CircularProgressIndicator(color: AppColor.primaryColor),
                imageUrl: urlToImage ?? "",
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
              const SizedBox(height: 20),
              CommonText(
                text: title ?? "",
                fontWeight: FontWeight.w600,
              ),
              const SizedBox(height: 10),
              CommonText(
                text: content ?? "",
                color: Colors.grey,
              ),
              const SizedBox(height: 10),
              CommonText(
                text: description ?? "",
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
