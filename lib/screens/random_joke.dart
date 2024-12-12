import 'package:flutter/material.dart';
import '../services/api_service.dart';


class RandomJoke extends StatefulWidget {
  const RandomJoke({super.key});

  @override
  State<RandomJoke> createState() => _RandomJokeState();
}

class _RandomJokeState extends State<RandomJoke> {
  String setup = "";
  String punchline = "";

  @override
  void initState() {
    super.initState();
    getTheRandomJoke();
  }

  void getTheRandomJoke() async {
    ApiService.getRandomJoke().then((data) {
      setState(() {
        setup = data['setup'];
        punchline = data['punchline'];
      });
    }).catchError((error) {
      setState(() {
        setup = "Failed to load joke.";
        punchline = "Please try again later.";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text("Random Joke", style: TextStyle(color: Colors.white)),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (setup.isNotEmpty) ...[
                Text(
                  setup,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Montserrat',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  punchline,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ] else ...[
                Text(
                  "Generating a joke...",
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}