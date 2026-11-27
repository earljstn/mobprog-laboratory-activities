import 'package:material_ui/material_ui.dart';

import '../widgets/newsfeed_card.dart';

class NewsFeedScreen extends StatelessWidget {
  const NewsFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        NewsFeedCard(
          userName: 'Earl Justine Baccay',
          postContent: 'Hi +1 HBD SAKIN!',
          numOfLikes: 100,
          date: 'October 11',
          hasImage: false,
          avatarUrl: 'assets/images/icon.jpg',
        ),

        NewsFeedCard(
          userName: 'Earl Justine Baccay',
          postContent: '— In a world full of algorithms 🌐',
          numOfLikes: 200,
          date: 'December 17',
          hasImage: true,
          imageUrl: 'assets/images/icon2.jpg',
          avatarUrl: 'assets/images/icon.jpg',
        ),
      ],
    );
  }
}
