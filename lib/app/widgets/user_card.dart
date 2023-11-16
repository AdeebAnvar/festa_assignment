import 'package:flutter/material.dart';

import '../modules/home/controllers/home_controller.dart';

Widget buildUserCard(int index, HomeController controller) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Card(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 140,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 70,
                  color: Colors.teal[800],
                ),
                Align(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(width: 5, color: Colors.teal[800]!),
                    ),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        controller.data[index].picture!.medium.toString(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            'Hi! My name is',
            style: TextStyle(color: Colors.grey.shade600),
          ),
          const SizedBox(height: 5),
          Text(
            '${controller.data[index].name?.title} ${controller.data[index].name?.first} ${controller.data[index].name?.last}',
            style: TextStyle(
              color: Colors.teal[800],
              fontSize: 17,
              fontWeight: FontWeight.w800,
            ),
          ),
          const Divider(
            endIndent: 100,
            indent: 100,
            thickness: 3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.mail),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.calendar_month),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.streetview_sharp),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.phone),
              ),
            ],
          ),
          const SizedBox(height: 30),
        ],
      ),
    ),
  );
}
