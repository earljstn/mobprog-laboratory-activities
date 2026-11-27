# baccay_mobprog

A new Flutter project.

Lab Activity 1: Discussion

Integration of Images in the Newsfeed Card

The Image widget was integrated into the newsfeed_card.dart file to display images in newsfeed posts. The hasImage boolean variable determines whether a post contains an image or not. When hasImage is true, the application displays the image using Image.network(). If no image URL is provided or the image cannot be loaded, a Placeholder widget is displayed instead. When hasImage is false, the image section is not displayed.

User Profile Avatar

The CircleAvatar widget was used to display the user's profile picture. It uses an image URL when available and displays a default person icon when no profile image is provided.

Like and Comment Widgets

The Like and Comment buttons were changed into widget-based layouts using InkWell, Row, and Icon. The Like widget displays only the number of likes, while the Comment widget displays its corresponding icon and label. These changes improve the appearance and organization of the newsfeed interface.
