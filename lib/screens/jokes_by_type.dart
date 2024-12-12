import 'package:flutter/material.dart';
import 'package:new_flutter_project/services/api_service.dart';


class JokesByType extends StatefulWidget {
  final String type;
  const JokesByType({super.key, required this.type});

  @override
  State<JokesByType> createState() => _JokesByTypeState();
}

class _JokesByTypeState extends State<JokesByType> {
  List<Map<String, dynamic>> jokes = [];

  @override
  void initState() {
    super.initState();
    getJokes();
  }

  void getJokes() async {
    ApiService.getJokesByType(widget.type).then((response) {
      setState(() {
        jokes = List<Map<String, dynamic>>.from(response);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("${widget.type.toUpperCase()} Jokes", style: const TextStyle(color: Colors.white)),
      ),
      body: jokes.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
        padding: const EdgeInsets.all(8.0),
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jokes[index]['setup']),
            subtitle: Text(jokes[index]['punchline']),
          );
        },
        separatorBuilder: (context, index) => const Divider(),
      ),
    );
  }
}
