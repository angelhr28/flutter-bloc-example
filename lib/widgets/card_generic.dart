import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardGeneric extends StatelessWidget {
  String name;
  String img;
  VoidCallback onPressed;

  CardGeneric(
      {Key? key,
      required this.name,
      required this.img,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        color: Colors.transparent,
        margin: const EdgeInsets.only(
            top: 10.0, left: 20.0, right: 20.0, bottom: 10.0),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                    width: 56.0,
                    height: 56.0,
                    margin: const EdgeInsets.only(
                      right: 20.0,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(image: NetworkImage(img)))),
              ],
            ),
            Text(name)
          ],
        ),
      ),
    );
  }
}
