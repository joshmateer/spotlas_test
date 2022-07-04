import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/post.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:expandable_text/expandable_text.dart';
import '../models/sizes.dart';
import '../widgets/tag_button.dart';
import '../widgets/user_info_bar.dart';

class PostTile extends StatefulWidget {
  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  double? captionHeight;

  void isExpanded(bool expanded) {
    if (expanded) {
      setState(() {
        captionHeight = 100;
      });
    } else {
      setState(() {
        captionHeight = 65;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final controller = PageController(initialPage: 0);

    String timeBetween(DateTime from, DateTime to) {
      int timeHours;
      int timeDays;
      int timeWeeks;
      from = DateTime(from.year, from.month, from.day);
      to = DateTime(to.year, to.month, to.day);
      timeHours = (to.difference(from).inHours).round();
      timeDays = (to.difference(from).inDays).round();
      timeWeeks = (to.difference(from).inDays / 7).round();
      if (timeHours >= 24 && timeDays < 7) {
        return ('$timeDays days ago');
      } else if (timeDays >= 7) {
        return ('$timeWeeks weeks ago');
      } else if (timeHours < 24) {
        return ('$timeHours hours ago');
      }
      return 'no data';
    }

    return Consumer<Post>(
      builder: (ctx, post, child) => Column(
        children: [
          Container(
            height: size.height * .7,
            child: Stack(children: [
              GestureDetector(
                onDoubleTap: post.toggleLike,
                child: PageView.builder(
                  itemCount: post.media == null ? 0 : post.media!.length,
                  controller: controller,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (ctx, i) => Image.network(
                    post.media![i].url!,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: sizeGuide(size.height).getS(),
                  bottom: sizeGuide(size.height).getS(),
                  left: sizeGuide(size.height).getS(),
                  right: sizeGuide(size.height).getL(),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    UserInfoBar(
                        post.author!.photoUrl!,
                        post.author!.username!,
                        post.author!.fullName!,
                        Icon(
                          Icons.more_horiz,
                          size: 30,
                          shadows: [
                            Shadow(
                              color: Colors.black,
                              offset: Offset(0, 0),
                              blurRadius: 25,
                            )
                          ],
                        ),
                        size,
                        () {},
                        Colors.red),
                    UserInfoBar(
                        post.spot!.logo!.url!,
                        post.spot!.name!,
                        '${post.spot!.types![0].name} - ${post.spot!.location!.display}',
                        post.spot!.isSaved!
                            ? SvgPicture.asset(
                                'assets/icons/Star.svg',
                                color: Colors.amber,
                              )
                            : SvgPicture.asset(
                                'assets/icons/Star Border.svg',
                                color: Colors.white,
                              ),
                        size,
                        post.toggleSave,
                        Colors.white)
                  ],
                ),
              ),
            ]),
          ),
          Container(
            child: Column(children: [
              Container(
                margin: EdgeInsets.only(
                  top: sizeGuide(size.height).getM(),
                  left: sizeGuide(size.height).getXXL(),
                  right: sizeGuide(size.height).getXXL(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/Map Border.svg',
                        height: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/icons/Comment.svg',
                        height: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: post.toggleLike,
                      icon: post.isLiked
                          ? SvgPicture.asset(
                              'assets/icons/Heart.svg',
                              height: 30,
                              color: Colors.red,
                            )
                          : SvgPicture.asset(
                              'assets/icons/Heart Border.svg',
                              height: 30,
                              color: Colors.black,
                            ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: SvgPicture.asset(
                          'assets/icons/Share.svg',
                          height: 30,
                        )),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: sizeGuide(size.height).getM(),
                    left: sizeGuide(size.height).getS(),
                    right: sizeGuide(size.height).getS(),
                    bottom: sizeGuide(size.height).getS()),
                alignment: Alignment.centerLeft,
                child: ExpandableText(
                  '${post.caption!.text}',
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  prefixText: '${post.author!.username}',
                  prefixStyle: TextStyle(fontWeight: FontWeight.bold),
                  expandText: 'more',
                  collapseText: 'show less',
                  expandOnTextTap: true,
                  linkColor: Colors.black26,
                ),
              ),
              Container(
                height: post.tags != null ? 40 : 0,
                child: post.tags != null
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: post.tags!.length,
                        itemBuilder: (ctx, i) =>
                            TagsButton(post.tags![i].name, size))
                    : null,
              ),
              Container(
                  padding: EdgeInsets.only(
                    top: sizeGuide(size.height).getS(),
                    left: sizeGuide(size.height).getS(),
                    right: sizeGuide(size.height).getS(),
                    bottom: sizeGuide(size.height).getL(),
                  ),
                  width: double.infinity,
                  child: Text(
                    timeBetween(
                      post.createdAt!,
                      DateTime.now(),
                    ),
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.black26),
                  )),
            ]),
          ),
        ],
      ),
    );
  }
}
