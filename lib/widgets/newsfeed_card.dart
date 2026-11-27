import 'package:material_ui/material_ui.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../constants.dart';
import 'custom_text.dart';

class NewsFeedCard extends StatelessWidget {
  final String userName;
  final String postContent;
  final String date;
  final int numOfLikes;
  final bool hasImage;
  final String? imageUrl;
  final String? avatarUrl;

  const NewsFeedCard({
    super.key,
    required this.userName,
    required this.postContent,
    this.numOfLikes = 0,
    this.hasImage = false,
    required this.date,
    this.imageUrl,
    this.avatarUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(ScreenUtil().setSp(10)),
      child: Padding(
        padding: EdgeInsets.all(ScreenUtil().setSp(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // USER PROFILE: Enhancement 2
            Row(
              children: [
                CircleAvatar(
                  radius: ScreenUtil().setSp(20),
                  backgroundColor: Colors.grey[300],
                  backgroundImage: avatarUrl != null
                      ? AssetImage(avatarUrl!)
                      : null,
                  child: avatarUrl == null ? const Icon(Icons.person) : null,
                ),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: userName,
                      fontSize: ScreenUtil().setSp(15),
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: date,
                          fontSize: ScreenUtil().setSp(12),
                          color: Colors.grey,
                        ),
                        SizedBox(width: ScreenUtil().setWidth(3)),
                        Icon(
                          Icons.public,
                          color: Colors.grey,
                          size: ScreenUtil().setSp(15),
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(Icons.more_horiz),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // POST CONTENT
            CustomText(
              text: postContent,
              fontSize: ScreenUtil().setSp(12),
              color: Colors.black,
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            if (hasImage)
              ClipRRect(
                borderRadius: BorderRadius.circular(ScreenUtil().setSp(5)),
                child: imageUrl != null
                    ? Image.asset(
                        imageUrl!,
                        width: double.infinity,
                        height: ScreenUtil().setHeight(200),
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return _imagePlaceholder();
                        },
                      )
                    : _imagePlaceholder(),
              ),

            SizedBox(height: ScreenUtil().setHeight(5)),

            // LIKE, COMMENT AND SHARE: Enhancement 3
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _ActionButton(
                  icon: Icons.thumb_up,
                  label: numOfLikes.toString(),
                  onPressed: () {
                    debugPrint('Liked');
                  },
                ),
                _ActionButton(
                  icon: Icons.comment,
                  label: 'Comment',
                  onPressed: () {
                    debugPrint('Comment');
                  },
                ),
                _ActionButton(
                  icon: Icons.share,
                  label: 'Share',
                  onPressed: () {
                    debugPrint('Share');
                  },
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            // WRITE A COMMENT
            Row(
              children: [
                const Icon(Icons.person),
                SizedBox(width: ScreenUtil().setWidth(10)),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: ScreenUtil().setSp(10),
                    ),
                    alignment: Alignment.centerLeft,
                    height: ScreenUtil().setHeight(30),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(
                        ScreenUtil().setSp(10),
                      ),
                    ),
                    child: CustomText(
                      text: 'Write a comment...',
                      fontSize: ScreenUtil().setSp(11),
                      color: Colors.grey,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: ScreenUtil().setHeight(10)),

            CustomText(
              text: 'View comments',
              fontSize: ScreenUtil().setSp(12),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }

  // PLACEHOLDER IMAGE WIDGET
  Widget _imagePlaceholder() {
    return Container(
      width: double.infinity,
      height: ScreenUtil().setHeight(200),
      color: Colors.grey[300],
      child: const Center(
        child: Icon(Icons.image, size: 50, color: Colors.grey),
      ),
    );
  }
}

// REUSABLE ACTION BUTTON WIDGET
class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ActionButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, color: FB_DARK_PRIMARY, size: 18),
      label: Text(
        label,
        style: TextStyle(
          color: FB_DARK_PRIMARY,
          fontSize: ScreenUtil().setSp(12),
        ),
      ),
    );
  }
}
