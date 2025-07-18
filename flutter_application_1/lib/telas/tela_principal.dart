import 'dart:ffi';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //isso é uma lista de texto, que contém o endereço das imagens
  List<String> images = ['assets/1.jpg', 'assets/2.jpg', 'assets/3.jpg'];
  List<int> imagemSelecionada = [0, 1, 2];
  //int somatoria - 0;
  double somatorio = 100.00;

  void sortear() {
    int i = 0;
    while (i < 5) {
      setState(() {
        imagemSelecionada[0] = Random().nextInt(2);
      });
      setState(() {
        imagemSelecionada[1] = Random().nextInt(2);
      });
      setState(() {
        imagemSelecionada[2] = Random().nextInt(2);
      });
      sleep(Duration(milliseconds: 500));
      i++;
    }

    if (imagemSelecionada[0] == imagemSelecionada[1] &&
        imagemSelecionada[1] == imagemSelecionada[2]) {
      somatorio = somatorio + 100.00;
      showDialog(
        context: context,
        builder:
            (contex) => AlertDialog(
              title: Text("Parabéns!"),
              content: Text("Você Ganhou!"),
            ),
      );
      } else{
         somatorio = somatorio - 100.00;
      }
    
  }

  @override
  Widget build(BuildContext context) {
    final larguraTela = MediaQuery.of(context).size.width - 30;
    final larguraImagem = larguraTela / 3;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Baleia",
          style: TextStyle(
            fontSize: 30,
            backgroundColor: const Color.fromARGB(255, 27, 136, 232),
          ),
        ),

        backgroundColor: const Color.fromARGB(255, 27, 136, 232),
      ),
      backgroundColor: const Color.fromARGB(255, 27, 136, 232),
      floatingActionButton: FloatingActionButton.large(
        onPressed: () {
          sortear();
        },
        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
        foregroundColor: const Color.fromARGB(255, 62, 5, 219),
        child: Icon(Icons.dark_mode_rounded),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                images[imagemSelecionada[0]],
                width: larguraImagem,
                height: 400,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[1]],
                width: larguraImagem,
                height: 400,
              ),
              SizedBox(width: 15),
              Image.asset(
                images[imagemSelecionada[2]],
                width: larguraImagem,
                height: 400,
              ),
            ],
          ),
          Text(
            "Pontuação: " + somatorio.toString(),
             style: TextStyle(fontSize: 30,
              color: Colors.black, 
             fontWeight: FontWeight.w900,
             backgroundColor: Color.fromARGB(0,252, 255,255)) 
             ),
  ]
  ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class SieedBox {}
