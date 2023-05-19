//Commponente que gera o resultado final do questionário
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  const Resultado(this.pontuacao, this.onRestart, {super.key});
  final int pontuacao;
  final void Function() onRestart;

  String get message {
    if (pontuacao < 8) {
      return 'Parabéns!!';
    } else if (pontuacao < 12) {
      return 'Nossa!! Você é bom!! ';
    } else if (pontuacao < 16) {
      return 'UAU! Você é incrivel';
    } else {
      return 'Você é impressionante!!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            message,
            style: const TextStyle(fontSize: 25),
          ),
        ),
        TextButton(
            onPressed: onRestart,
            child: const Text(
              'Reiniciar Questionário?',
              style: TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 84, 13, 125),
              ),
            )),
      ],
    );
  }
}
