import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text('Best Iranian Actors and Actreses'), //, style: GoogleFonts.notoSans(fontSize: 32)),
          const Text('March 2020'), //, style: GoogleFonts.notoSans(fontSize: 18)),
          ListBody(
              // scrollDirection: Axis.vertical,
              // padding: const EdgeInsets.all(8.0),
              children: [
                const SizedBox(
                  height: 50,
                ),
                Column(
                  children: [
                    Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: Image.network(
                            'https://hips.hearstapps.com/hmg-prod/images/hbz090123icons-028-wm-64e31a880a6fa.png')),
                    const Text('Golshifteh'),
                        //style: GoogleFonts.quicksand(fontSize: 32)),
                    const Text('Farahani',
                        //style: GoogleFonts.quicksand(
                            // fontSize: 22,
                            // color: const Color.fromARGB(255, 75, 75, 75)))
                )],
                ),
              ]),
        ],
      ),
    );
  }
}
