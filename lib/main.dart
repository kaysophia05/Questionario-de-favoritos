import 'package:flutter/material.dart';
import './questionario.dart';
import './resultado.dart';

void main() {
  runApp(const PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  // variável com o indice da pergunta, controla qual pergunta será exibida n
  var _numeroPergunta = 0;
  //variável armazenando a pontuação total
  var pontuacaototal = 0;

  //lista com as perguntas e suas respostas associadas
  // chave 'texto' armazena o texto da pergunta.
  // chave 'respostas' armazena uma lista de respostas para essa pergunta.
  // cgave  'texto2' amazena cada opcao de resposta da pergunta
  final List<Map<String, Object>> _listadeperguntas = const [
    {
      'texto': 'Qual o seu livro Favorito?',
      'respostas': [
        {'texto': 'Jogos vorazes', 'pontuacao': 3},
        {'texto': 'Rainha Vermelha ', 'pontuacao': 3},
        {'texto': 'Harry Potter', 'pontuacao': 6},
        {'texto': 'Sherlock Homes', 'pontuacao': 3},
      ],
    },
    {
      'texto': 'Qual é o seu Hobie favorito?',
      'respostas': [
        {'texto': 'Musculação', 'pontuacao': 5},
        {'texto': 'Dança', 'pontuacao': 2},
        {'texto': 'Leitura', 'pontuacao': 3},
        {'texto': 'Programar', 'pontuacao': 6},
      ],
    },
    {
      'texto': 'Qual sua Serie Favorita??',
      'respostas': [
        {'texto': 'One day of the Time', 'pontuacao': 3},
        {'texto': 'The flash', 'pontuacao': 2},
        {'texto': 'The originals', 'pontuacao': 5},
        {'texto': 'Supergirl', 'pontuacao': 2},
      ],
    },
  ];

// A cada vez que o método _responder é chamado, o valor de _numeroPergunta é incrementado, permitindo que a próxima pergunta seja exibida.
  void _responder(int pontuacao) {
    if (inSelectedQuestion) {
      setState(() {
        _numeroPergunta++;
        pontuacaototal += pontuacao;
      });
    }
  }

// A cada vez que p metodo restart é chamado, as variáveis que controlam o indice e a pontuação são zeradas, permitindo reiniciar o questionário
  void _reiniciarQuestionario() {
    setState(() {
      _numeroPergunta = 0;
      pontuacaototal = 0;
    });
  }

//Função para verificar se o valor do indice das perguntas é menor que o tamanho da lista, Se sim, retorna true, se nãon false
  bool get inSelectedQuestion {
    return _numeroPergunta < _listadeperguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 84, 13, 125),
          title: const Text('Perguntas'),
        ),
        //metodo coondicional aplicado no body
        body: inSelectedQuestion // se a função retorna true, o questionário é exibido ou incrementado, se não, o resultado é exibido
            ? Questionario(
                //questionário recebe  3 parametros, importantes para a manipulação no codigo
                listadeperguntas: _listadeperguntas,
                numeroPergunta: _numeroPergunta,
                onReply: _responder,
              )
            : //Resultado recebe 2 parametros, a pontuação total que irá gerar o resultado e a função de reiniciar
            Resultado(
                pontuacaototal,
                _reiniciarQuestionario,
              ),
      ),
    );
  }
}

//classe com estado mutavel
class PerguntaApp extends StatefulWidget {
  const PerguntaApp({super.key});
  @override
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
