//Componenta para gerar as opções de resposta
import 'package:flutter/material.dart';

class Opcoes extends StatelessWidget {
  //Declarção de parametros para o construtor
  final String texto;
  final void Function() onSelected;
  const Opcoes(this.texto, this.onSelected, {super.key});

  //Metodo buid retorna um box com os botoes de opções, recebendo um função para seleção da resposta e o texto da opção
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 84, 13, 125),
          foregroundColor: Colors.white,
        ),
        onPressed: onSelected,
        child: Text(texto),
      ),
    );
  }
}
