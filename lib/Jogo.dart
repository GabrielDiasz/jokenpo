import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  const Jogo({Key key}) : super(key: key);

  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage('images/padrao.png');
  var _resultado = 'Escolha uma opção abaixo';
  void _opcaoSelecionada(String escolhaUsiario){
    var opcoes = ['pedra', 'papel', 'tesoura'];
    var numero = new Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    if(escolhaApp == 'pedra'){
      setState(() {
        this._imagemApp = AssetImage('images/pedra.png');
      });
    }else if(escolhaApp == 'papel') {
      setState(() {
        this._imagemApp = AssetImage('images/papel.png');
      });
    }else
      setState(() {
        this._imagemApp = AssetImage('images/tesoura.png');
      });
    //usuario ganhador
    if(
          (escolhaUsiario == 'pedra' && escolhaApp == 'tesoura') ||
          (escolhaUsiario == 'tesoura' && escolhaApp == 'papel') ||
          (escolhaUsiario == 'papel' && escolhaApp == 'pedra')
    ){
        setState(() {
          this._resultado = 'Você ganhou!!!';
        });
    }else if /*app ganhador*/(
            (escolhaUsiario == 'pedra' && escolhaApp == 'papel')||
            (escolhaUsiario == 'papel' && escolhaApp == 'tesoura')||
            (escolhaUsiario == 'tesoura' && escolhaApp == 'pedra')
    ){
        setState(() {
          this._resultado = 'Você perdeu!!!\nGAMER OVER.';
        });
    }else{
        setState(() {
          this._resultado = 'EMPATE!!!';
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JokenPo'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 15),
            child: Text(
              'Escolha do App',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          Image(image: this._imagemApp,),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 50),
            child: Text(
              this._resultado,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () => _opcaoSelecionada('pedra'),
                child: Image.asset('images/pedra.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('papel'),
                child: Image.asset('images/papel.png', height: 100,),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada('tesoura'),
                  child: Image.asset('images/tesoura.png', height: 100,)
              )
            ],
          ),
        ],
      ) ,
    );
  }
}
