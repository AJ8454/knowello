import 'dart:developer';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:knowello/models/knowello_models.dart';
import 'package:knowello/providers/knowello_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, this.controller}) : super(key: key);
  final PageController? controller;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isImageLike = false;
  bool isImageLoading = true;
  int activeIndex = 0;
  List<Post>? _allPosts;

  @override
  void initState() {
    super.initState();
    log('${widget.controller}');
    _refreshPost();
  }

  Future<void> _refreshPost() async {
    setState(() => isLoading = true);
    final provider =
        Provider.of<KnowelloServiceProvider>(context, listen: false);
    await provider.getKnowelloGram();
    _allPosts = provider.items;
    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    log('build');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                  color: Colors.white,
                  strokeWidth: 1,
                ),
              )
            : RefreshIndicator(
                onRefresh: _refreshPost,
                backgroundColor: Colors.black,
                color: Colors.white,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  controller: widget.controller,
                  padEnds: false,
                  itemCount: _allPosts!.length,
                  itemBuilder: (context, index) {
                    return _postBody(index, size);
                  },
                ),
              ),
      ),
    );
  }

  Widget _postBody(int index, Size size) {
    var utilData = _allPosts![index].interactions;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CircleAvatar(
                radius: 13,
                backgroundImage: NetworkImage(
                  _allPosts![index].profileImage!,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                _allPosts![index].postedBy!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Colors.white,
                      width: 0.2,
                    )),
                child: const Text(
                  'Follow',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  size: 18,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Stack(
          children: [
            InkWell(
              onDoubleTap: () {
                setState(() => isImageLike = true);
              },
              child: CarouselSlider.builder(
                options: CarouselOptions(
                  height: size.height * 0.50,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) =>
                      setState(() => activeIndex = index),
                ),
                itemCount: _allPosts![index].images.length,
                itemBuilder: (context, i, realIndex) {
                  return CachedNetworkImage(
                    imageUrl: _allPosts![index].images[i],
                    width: size.width,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => const Center(
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.black,
                        color: Colors.white,
                        strokeWidth: 1,
                      ),
                    ),
                    errorWidget: (context, url, error) => const Center(
                      child: Text(
                        "Couldn't load image.",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            _allPosts![index].images.length == 1
                ? const SizedBox.shrink()
                : Positioned(
                    right: 20,
                    top: 20,
                    child: Container(
                      width: 40,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          '${activeIndex + 1}/${_allPosts![index].images.length}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  setState(() => isImageLike = !isImageLike);
                },
                child: Image.asset(
                  isImageLike
                      ? 'assets/icons/heart_active.png'
                      : 'assets/icons/heart.png',
                  color: isImageLike ? Colors.red : Colors.white,
                  height: 22,
                ),
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/icons/comment.png',
                color: Colors.white,
                height: 22,
              ),
              const SizedBox(width: 10),
              Image.asset(
                'assets/icons/message.png',
                color: Colors.white,
                height: 22,
              ),
              const SizedBox(width: 60),
              _allPosts![index].images.length == 1
                  ? const SizedBox.shrink()
                  : AnimatedSmoothIndicator(
                      activeIndex: activeIndex,
                      count: _allPosts![index].images.length,
                      effect: const SlideEffect(
                        activeDotColor: Colors.blue,
                        dotColor: Colors.white,
                        dotWidth: 5,
                        dotHeight: 5,
                      ),
                    ),
              const Spacer(),
              Image.asset(
                'assets/icons/save.png',
                color: Colors.white,
                height: 22,
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${utilData!.likes} likes',
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 5),
              ReadMoreText(
                _allPosts![index].description!,
                trimLines: 1,
                trimMode: TrimMode.Line,
                trimCollapsedText: "more",
                trimExpandedText: 'less',
              ),
            ],
          ),
        ),
        const SizedBox(height: 5),
      ],
    );
  }
}
