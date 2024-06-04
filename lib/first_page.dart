import 'package:flutter/material.dart';
import 'package:gs_flutter/argument.dart';

class firstPage extends StatefulWidget {
  const firstPage({super.key});

  @override
  State<firstPage> createState() => _ListaPageState();
}

class _ListaPageState extends State<firstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Lista de Sala",
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.pink),
      body: ListView.builder(
          itemCount: alunos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: CircleAvatar(
                  child: Text(
                    alunos[index].nome.substring(0, 1),
                  ),
                ),
                title: Text(
                  alunos[index].nome,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                ),
                subtitle: Text(
                  "Nota: ${alunos[index].nota.toString()}",
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, color: Colors.black),
                ),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 12,
                  children: <Widget>[
                    statusText(alunos[index].nota),
                    statusCircle(alunos[index].nota),
                    IconButton(
                      icon: const Icon(
                        Icons.arrow_forward,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/second",
                            arguments: Aluno(
                              alunos[index].nome,
                              alunos[index].nota,
                            ));
                      },
                    ),
                  ],
                ));
          }),
    );
  }
}

Widget statusText(double nota) {
  if (nota > 6) {
    return Text("Aprovado", style: TextStyle(fontSize: 15),);
  } else if (nota == 6) {
    return Text("Média", style: TextStyle(fontSize: 15),);
  } else {
    return Text("Reprovado", style: TextStyle(fontSize: 15),);
  }
}

Widget statusCircle(double nota) {
  if (nota > 6) {
    return Icon(Icons.circle, color: Colors.green);
  } else if (nota == 6) {
    return Icon(Icons.circle, color: Colors.yellow);
  } else {
    return Icon(Icons.circle, color: Colors.red);
  }
}