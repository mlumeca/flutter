import 'package:flutter/material.dart';
import 'package:starwhat/models/people_response/people.dart';

class PeopleDetailScreen extends StatefulWidget {
  final People peopleItem;
  const PeopleDetailScreen({super.key, required this.peopleItem});

  @override
  State<PeopleDetailScreen> createState() => _PeopleDetailScreenState();
}

class _PeopleDetailScreenState extends State<PeopleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final index = int.parse(widget.peopleItem.url!.split('/')[5]);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 165, 92, 23),
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
                width: 50,
                child: Image.network('assets/images/Death-Star-icon.png',
                    fit: BoxFit.cover)),
            Text(' ${widget.peopleItem.name!}',
                style: const TextStyle(fontFamily: 'Starjedi'))
          ])),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('assets/images/desert-texture-background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 20, top: 30, left: 20),
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(100),
                  ),
                  child: Hero(
                    tag: 'character',
                    child: Image(
                      image: NetworkImage(
                          'https://starwars-visualguide.com/assets/img/characters/$index.jpg'),
                      height: 500,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Año de nacimiento: ${widget.peopleItem.birthYear}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Starjedi'),
                    ),
                    Text(
                      "Género: ${widget.peopleItem.gender}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Starjedi'),
                    ),
                    Text(
                      "Peso: ${widget.peopleItem.mass} kg",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Starjedi'),
                    ),
                    Text(
                      "Altura: ${widget.peopleItem.height}",
                      style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontFamily: 'Starjedi'),
                    ),
                  ]),
            ],
          ),
        ]),
      ),
    );
  }
}
