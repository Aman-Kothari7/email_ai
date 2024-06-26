import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../gen/assets.gen.dart';
import '../constants/colors.dart';

class ContainerCard extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  const ContainerCard({required this.child, this.padding, this.margin, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        padding: padding ?? const EdgeInsets.all(18),
        margin: margin ?? const EdgeInsets.all(0),
        decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            )),
        child: child);
  }
}

class PromptCard extends StatelessWidget {
  final Color typeContainerColor;
  final String typeContainerText;
  final bool isBookmark;
  final String titleText;
  final String subTitleText;
  final Function()? onTap;
  final Function()? onBookMark;
  const PromptCard({
    required this.typeContainerColor,
    required this.typeContainerText,
    required this.isBookmark,
    required this.titleText,
    required this.subTitleText,
    required this.onTap,
    required this.onBookMark,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ContainerCard(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
        padding: EdgeInsets.fromLTRB(15, 12, 15, 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    decoration: BoxDecoration(
                        color: this.typeContainerColor,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(5),
                        )),
                    child: Text(
                      typeContainerText.tr,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(color: AppColor.whiteColor),
                    )),
                GestureDetector(
                  onTap: onBookMark,
                  child: isBookmark
                      ? Icon(
                          Icons.bookmark,
                          color: AppColor.lightYellowColor,
                        )
                      : Icon(
                          Icons.bookmark_border,
                          color: AppColor.iconGreyColor,
                        ),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              titleText.tr,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              subTitleText.tr,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.bodyMedium,
            )
          ],
        ),
      ),
    );
  }
}

enum Options { Send, Copy, Share, Delete }

class MyEmailCard extends StatelessWidget {
  final String dateTime;
  final String titleText;
  final String subTitleText;
  final Function()? onTap;
  final Function()? onSend;
  final Function()? onCopy;
  final Function()? onShare;
  final Function()? onDelete;
  MyEmailCard({
    required this.dateTime,
    required this.titleText,
    required this.subTitleText,
    required this.onTap,
    this.onCopy,
    this.onDelete,
    this.onSend,
    this.onShare,
    super.key,
  });

  PopupMenuItem _buildPopupMenuItem(String title, String iconData, int position, context) {
    return PopupMenuItem(
      value: position,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            title,
            style: title == "Delete" ? Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.red) : Theme.of(context).textTheme.bodyLarge,
          ),
          SizedBox(
            width: 20,
          ),
          SvgPicture.asset(
            iconData,
          )
        ],
      ),
    );
  }

  var _popupMenuItemIndex = 0;
  _onMenuItemSelected(int value) {
    //setState(() {
    _popupMenuItemIndex = value;
    if (value == 0) {
      onSend!();
    } else if (value == 2) {
      onShare!();
    } else if (value == 3) {
      onDelete!();
    } else {
      onCopy!();
    }
    //});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ContainerCard(
        margin: EdgeInsets.fromLTRB(15, 0, 15, 15),
        padding: EdgeInsets.fromLTRB(15, 5, 15, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  dateTime.tr,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                PopupMenuButton(
                  padding: EdgeInsets.all(0),
                  icon: SvgPicture.asset(
                    Assets.icons.icnMore,
                  ),
                  onSelected: (value) {
                    _onMenuItemSelected(value as int);
                  },
                  offset: Offset(0.0, 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(0.0),
                    ),
                  ),
                  itemBuilder: (ctx) => [
                    _buildPopupMenuItem('Send', Assets.icons.icnSend, Options.Send.index, context),
                    _buildPopupMenuItem('Copy', Assets.icons.icnCopy, Options.Copy.index, context),
                    _buildPopupMenuItem('Share', Assets.icons.icnShare, Options.Share.index, context),
                    _buildPopupMenuItem('Delete', Assets.icons.icnDelete, Options.Delete.index, context),
                  ],
                )
              ],
            ),
            Text(
              titleText.tr,
              style: Theme.of(context).textTheme.titleMedium,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(
              height: 2,
            ),
            Text(
              subTitleText.tr,
              style: Theme.of(context).textTheme.bodyMedium,
              maxLines: 3,
              overflow: TextOverflow.fade,
            )
          ],
        ),
      ),
    );
  }
}
