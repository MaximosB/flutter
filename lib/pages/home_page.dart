import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test2/pages/configuracoes_page.dart';
import 'package:flutter_test2/pages/conquista_page.dart';
import 'package:flutter_test2/pages/principal_page.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int paginaAtual = 0;
  late PageController pc;

  @override
  void initState() {
    super.initState();
    pc = PageController(initialPage: paginaAtual);
  }

  setPaginaAtual(pagina) {
    setState(() {
      paginaAtual = pagina;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          PrincipalPage(),
          ConquistaPage(),
          ConfiguracoesPage(),
        ],
        onPageChanged: setPaginaAtual,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: paginaAtual,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Principal'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border_outlined), label: 'Conquistas'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Configurações'),
        ],
        onTap: (pagina) {
          pc.animateToPage(
            pagina,
            duration: Duration(milliseconds: 400),
            curve: Curves.ease,
          );
        },
        // backgroundColor: Colors.grey[100],
      ),
    );
  }
}
