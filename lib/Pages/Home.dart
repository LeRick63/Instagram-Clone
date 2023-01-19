import 'package:flutter/material.dart';
import 'package:fluttericon/web_symbols_icons.dart';
import 'package:path/path.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageSate();
  }
}

class HomePageSate extends State<HomePage> {
  final imagepath =
      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg';

  var dummy_images = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    //Add dummy stories
    for (var i = 0; i < 10; i++) {
      dummy_images.add(imagepath);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text(
          "Instagram",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.add_circle, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.favorite_border_outlined, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Icon(Icons.send, color: Colors.black),
          ),
        ],
        //
      ),
      body: ListView.separated(
        scrollDirection: Axis.vertical,
        itemCount: dummy_images.length,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 5),
        itemBuilder: (BuildContext context, int index) {
          if (index == 0) {
            return SizedBox(
              height: MediaQuery.of(context).size.height * 0.10,
              child: Stories(dummy_images),
            );
          } else {
            return Post(dummy_images[index]);
          }
        },
      ),
    );
  }
}

class Stories extends StatelessWidget {
  final List stories;

  const Stories(this.stories, {super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: stories.length,
      separatorBuilder: (BuildContext context, int index) =>
          const SizedBox(width: 10),
      itemBuilder: (BuildContext context, int index) {
        if (index == 0) {
          return IndividualStory(stories[index], "Your Story");
        } else {
          return Story(stories[index], "Ricardo Leitão");
        }
      },
    );
  }
}

class IndividualStory extends StatelessWidget {
  final String imageUrl;
  final String name;

  const IndividualStory(this.imageUrl, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - (3 * 10) - 10) / 3.5,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(children: [
          Expanded(
            flex: 7,
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(2),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(2),
                      child: Container(
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Stack(
                          children: [
                            ClipOval(
                              child: Image(
                                image: NetworkImage(imageUrl),
                              ),
                            ),
                            Align(
                              alignment: const Alignment(2, 2),
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                  border:
                                      Border.all(color: Colors.white, width: 2),
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                name,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class Story extends StatelessWidget {
  final String imageUrl;
  final String name;

  const Story(this.imageUrl, this.name, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: (MediaQuery.of(context).size.width - (3 * 10) - 10) / 3.5,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Column(children: [
          Expanded(
            flex: 7,
            child: ProfileImage(imageUrl),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                overflow: TextOverflow.ellipsis,
                name,
                textAlign: TextAlign.center,
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  const ProfileImage(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Colors.blue,
              Color.fromARGB(255, 215, 72, 193),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(2),
              child: Container(
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.white),
                child: ClipOval(
                  child: Image(
                    image: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Post extends StatelessWidget {
  final String imageUrl;
  const Post(this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: BorderDirectional(
          top: BorderSide(color: Color.fromARGB(255, 173, 171, 171), width: 1),
          bottom:
              BorderSide(color: Color.fromARGB(255, 173, 171, 171), width: 1),
        ),
      ),
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Row(
                children: [
                  ProfileImage(imageUrl),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("Ricardo Leitão"),
                  ),
                  Expanded(child: Container()),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.more_horiz),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Container(
              decoration: const BoxDecoration(color: Colors.blue),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_border_outlined),
                        const SizedBox(width: 10),
                        const Icon(Icons.message_outlined),
                        const SizedBox(width: 10),
                        const Icon(Icons.send),
                        Expanded(child: Container()),
                        const Icon(Icons.bookmark_outline),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "1999 likes",
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
