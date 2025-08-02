import 'package:flutter/material.dart';

class SingleImage extends StatelessWidget {
  final String imagePath;
  final String name;
  final String location;
  final String date;
  final bool isShowDeleteButton;
  final VoidCallback onDeletePress;
  const SingleImage({
    super.key,
    required this.imagePath,
    required this.name,
    required this.location,
    required this.date,
    required this.isShowDeleteButton,
    required this.onDeletePress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 100.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: const TextStyle(fontSize: 22, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              location,
              style: const TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              date,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 5,
            ),
            isShowDeleteButton
                ? OutlinedButton(
                    onPressed: onDeletePress, child: const Text("Delete"))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
