
import 'package:flutter/material.dart';
import 'package:story_view/story_view.dart';

import 'Model.dart';

class Story extends StatefulWidget {
  int index;

  Story(this.index);

  @override
  State<Story> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  StoryController storyView = StoryController();

  void timer() {
    Duration(seconds: 5);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryView(
        onComplete: timer,
        storyItems: [
          for(int i = 0; i<Model.Story_photos.length; i++)
          StoryItem.pageImage(
              url: "${Model.Story_photos[i]}",
              caption: "${Model.Story_Title[i]}",
              duration: Duration(seconds: 3),
              controller: storyView),
        ],
        controller: storyView,
      ),
    );
  }
}
