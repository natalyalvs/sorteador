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
  void sortear() 
  {
    int i = 0;
    while(i > 5){
    setState(() {
      imagemSelecionada[0] = Random().nextInt(images.length);
    });
    setState(() {
      imagemSelecionada[1] = Random().nextInt(images.length);
    });
    setState(() {
      imagemSelecionada[2] = Random().nextInt(images.length);
    });
      sleep(Duration(milliseconds:500));
      i++;
    }


    if (imagemSelecionada[0] == imagemSelecionada[1] &&
        imagemSelecionada[1] == imagemSelecionada[2]) {
      showDialog(
        context: context,
        builder:
            (contex) => AlertDialog(
              title: Text("Parabéns!"),
              content: Text("Você Ganhou!"),
            ),
      );
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

        backgroundColor: const Color.fromARGB(255, 62, 15, 234),
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
          Row(
            children: [
              Text("pontos") 
            ],
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class SieedBox {}
