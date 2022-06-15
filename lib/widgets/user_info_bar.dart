import 'package:flutter/material.dart';
import '../models/sizes.dart';

class UserInfoBar extends StatelessWidget {
  final String iconImage;
  final String titleText;
  final String subText;
  final Widget buttonIcon;
  final Size size;
  final Function() pressResult;
  final Color iconBackground;
  UserInfoBar(this.iconImage, this.titleText, this.subText, this.buttonIcon,
      this.size, this.pressResult, this.iconBackground);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: iconBackground,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(iconImage),
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                left: sizeGuide(size.height).getS(),
                right: sizeGuide(size.height).getS(),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titleText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 25,
                          )
                        ]),
                  ),
                  SizedBox(
                    height: sizeGuide(size.height).getXXXS(),
                  ),
                  Text(
                    subText,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white70,
                        shadows: [
                          Shadow(
                            color: Colors.black,
                            offset: Offset(0, 0),
                            blurRadius: 25,
                          )
                        ]),
                  ),
                ],
              ),
            ),
          ),
          IconButton(
            icon: buttonIcon,
            onPressed: pressResult,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
