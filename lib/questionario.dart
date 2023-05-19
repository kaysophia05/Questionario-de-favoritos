//componente para gerar o questionário, manipulando as questões e opçoes a responder e as respostas
import 'package:flutter/material.dart';
import './questao.dart';
import 'opcoes.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> listadeperguntas;
  final int numeroPergunta;
  final void Function(int) onReply;

//declaração de parametros para o construtor
  const Questionario(
      {required this.listadeperguntas,
      required this.numeroPergunta,
      required this.onReply,
      super.key});

  bool get inSelectedQuestion {
    return numeroPergunta < listadeperguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    //Se houver uma pergunta selecionada, obtém as respostas associadas a essa pergunta.
    //As respostas são armazenadas na chave "respostas" como uma lista de strings
    List<Map<String, Object>> respostas = inSelectedQuestion
        ? listadeperguntas[numeroPergunta]['respostas']
            as List<Map<String, Object>>
        : [];
    //metodoo buid retorna o wwidget column com as perguntas e as opções de respostas
    return Column(
      children: [
        //Questão é responsável por exibir a pergunta na interface.
        Questao(listadeperguntas[numeroPergunta]['texto'] as String),
        //chamada da lista de respostas
        ...respostas.map((resp) {
          //Opções é respnção por exibir as opções de respostas
          return Opcoes(
            resp['texto'] as String,
            () => onReply(resp['pontuacao'] as int),
          );
        }).toList(),
      ],
    );
  }
}
//na função MAP ocorre a converção das lista string de respostas das perguntas para widget "Opçoes", com o map