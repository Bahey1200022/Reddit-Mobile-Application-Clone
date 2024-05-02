import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UrlSheet extends StatelessWidget {
  final String? title;

  const UrlSheet({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment:
      //     MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.facebook,
                color: Colors.blue,
                size: 15,
              ),
              label: const Text(
                'Facebook',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.reddit_rounded,
                color: Colors.orange,
                size: 15,
              ),
              label: const Text(
                'Reddit',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(
                Icons.tiktok,
                color: Colors.black,
                size: 15,
              ),
              label: const Text(
                'Tiktok',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.twitter,
                  color: Colors.blue, size: 15),
              // icon: const Icon(
              //   Icons.facebook,
              //   color: Colors.blue,
              //   size: 15,
              // ),
              label: const Text(
                'Twitter',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.soundcloud,
                  color: Colors.orange, size: 15),
              label: const Text(
                'SoundCloud',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.youtube,
                  color: Colors.red, size: 15),
              label: const Text(
                'Youtube',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton.icon(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.link,
                  // color: Colors.red,
                  size: 15),
              label: const Text(
                'custom link',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color.fromARGB(180, 255, 255, 255),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}