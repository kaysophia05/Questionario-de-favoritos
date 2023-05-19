import 'package:flutter/material.dart';

//componente para cada questão pedida
class Questao extends StatelessWidget {
  //ERROS COMETIDOS
  //const Questao(String pergunta, {super.key, required this.texto});
  //const Questao(String pergunta, {Key? key, required this.texto}) super(key: key);
  const Questao(this.texto, {super.key});
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(10),
      child: Text(
        texto,
        style:
            const TextStyle(fontSize: 25), //por que colocar como uma constante
        textAlign: TextAlign.center,
      ),
    );
  }
}
