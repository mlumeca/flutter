import 'package:flutter/material.dart';
import 'package:starwhat/models/people_response/people.dart';
import 'package:starwhat/models/people_response/people_response.dart';
import 'package:http/http.dart' as http;
import 'package:starwhat/screens/people_detail_screen.dart';

class PeopleScreen extends StatefulWidget {
  const PeopleScreen({super.key});

  @override
  State<PeopleScreen> createState() => _PeopleScreenState();
}

class _PeopleScreenState extends State<PeopleScreen> {
  late Future<PeopleResponse> peopleResponse;

  @override
  void initState() {
    super.initState();
    peopleResponse = getPeople();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 165, 92, 23),
          title: Row(children: [
        SizedBox(
            width: 50,
            child: Image.network('assets/images/Death-Star-icon.png',
                fit: BoxFit.cover)),
        const Text('   Star Whooot?', 
        style: TextStyle(fontFamily: 'Starjedi'))
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
        child: FutureBuilder<PeopleResponse>(
          future: peopleResponse,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _buildPeopleList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
        
            // By default, show a loading spinner.
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }

  Future<PeopleResponse> getPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));

    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(response.body);
    } else {
      throw Exception('Failed to load album');
    }
  }

  Widget _buildPeopleList(PeopleResponse peopleResponse) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: peopleResponse.results!.length,
        itemBuilder: (context, index) {
          
        });
  }

    Widget _buildPeopleItem(BuildContext context, People people) {
      final name = people.name; // ????
      final url = people.url;
      final id = url!.split('/')[5];
    return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => PeopleDetailScreen(peopleItem: people),
            ),
          );
        },
        child: SizedBox(
            width: 350,
            child: Padding(
              padding: const EdgeInsets.only(right: 20, top: 60, left: 20),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(100),
                    ),
                    child: Image(
                      image: NetworkImage(
                          'https://starwars-visualguide.com/assets/img/characters/$id.jpg'),
                      height: 600,
                      width: 300,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 450),
                    alignment: Alignment.center,
                    height: 150,
                    width: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(0, 185, 135, 87),
                            Color.fromARGB(255, 185, 135, 87)
                          ],
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(100),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        peopleResponse.peopleItem.name!, //results![index].name!, ????
                        style: const TextStyle(
                            fontSize: 22,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontFamily: 'Starjedi'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        );
  }
}

// add safe space
// add dropshadow en las cards
// add footer
// add navigation