import 'package:flutter/material.dart';
import 'package:gs_flutter/argument.dart';

class secondPage extends StatefulWidget {
  const secondPage({super.key});

  @override
  State<secondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<secondPage> {
  int numImg = 0;
  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Aluno;

    return Scaffold(
      appBar: AppBar(
          title: Text(
            "Aluno: ${arguments.nome}",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Image(image: NetworkImage(imagens[numImg])),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (numImg > 0) {
                          numImg--;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_back)
                ),
                IconButton(
                    onPressed: () {
                      setState(() {
                        if (numImg < 4) {
                          numImg++;
                        }
                      });
                    },
                    icon: const Icon(Icons.arrow_forward)
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
