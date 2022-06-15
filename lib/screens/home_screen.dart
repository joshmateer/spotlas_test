import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/posts.dart';
import '../models/post_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ScrollController(initialScrollOffset: 0);

  @override
  void initState() {
    Provider.of<Posts>(context, listen: false).getUrlData();
    controller.addListener(() {
      if (controller.position.pixels >= controller.position.maxScrollExtent) {
        Provider.of<Posts>(context, listen: false).getUrlData();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postsData = Provider.of<Posts>(context);
    final posts = postsData.items;

    return postsData.items.isEmpty
        ? Scaffold(
            body: Center(child: CircularProgressIndicator()),
          )
        : Scaffold(
            appBar: null,
            body: ListView.builder(
              controller: controller,
              scrollDirection: Axis.vertical,
              itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
                value: posts[i],
                child: PostTile(),
              ),
              itemCount: posts.length,
            ),
          );
  }
}
