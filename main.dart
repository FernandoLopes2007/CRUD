import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContatoPage(),
    );
  }
}

class ContatoPage extends StatefulWidget {
  @override
  _ContatoPageState createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  // Nosso "Banco de Dados" - Uma Lista simples!
  List<Map<String, String>> contatos = [];
  // Controladores para ler o texto dos campos
  final nomeController = TextEditingController();
  final telController = TextEditingController();

  // Função CREATE (Adicionar)
  void adicionarContato() {
    if (nomeController.text.isNotEmpty && telController.text.isNotEmpty) {
      setState(() {
        contatos.add({
          'nome': nomeController.text,
          'tel': telController.text,
        });
      });
      // Limpa os campos após adicionar
      nomeController.clear();
      telController.clear();
      // Fecha o teclado
      FocusScope.of(context).unfocus();
    }
  }

  // Função DELETE (Deletar)
  void deletarContato(int index) {
    setState(() {
      contatos.removeAt(index);
    });
  }

  // Função EDIT (Editar)
  void atualizarContato(int index) {
  if (nomeController.text.isNotEmpty && telController.text.isNotEmpty) {
    setState(() {
      contatos[index] = {
        'nome': nomeController.text,
        'tel': telController.text,
      };
    });

    // Limpa os campos após editar
    nomeController.clear();
    telController.clear();

    // Fecha o teclado
    FocusScope.of(context).unfocus();
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Contatos (CRUD)'),
        backgroundColor: const Color.fromARGB(173, 57, 51, 60),
        centerTitle: true, // Alinha o texto
        titleTextStyle: const TextStyle( // abre a configuração do text
          fontSize: 42, // Tamanho da fonte
          color: Colors.white, //cor da fonte
          ),
        ),
      
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 50),
            // --- Campos de Texto (CREATE) ---
            TextField(
              controller: nomeController,
              textAlign: TextAlign.center, //centraliza
              style: TextStyle(fontSize: 18, color: Colors.blue), // Deixa azul quando clica (texto e label)
              decoration: InputDecoration(
              labelText: 'Nome',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
                ),
              ),
            ),
            SizedBox(height:15), // Pula algumas linhas
            TextField(
              controller: telController,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.blue),
              decoration: InputDecoration(
              labelText: 'Telefone',
              border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(14),
                ),
              ),
              
            ),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text('Salvar Contato'),
              
              onPressed: adicionarContato, // Chama a função CREATE
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(173, 57, 51, 60), // Accent color
                foregroundColor: Color.fromARGB(255, 219, 223, 227), // Text color
              ),
              
            ),
            SizedBox(height: 20),

            // --- Lista de Contatos (READ & DELETE) ---
            Expanded(
              child: ListView.builder(
                itemCount: contatos.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(contatos[index]['nome']!),
                      subtitle: Text(contatos[index]['tel']!),
                      
                     trailing: Row(
                            mainAxisSize: MainAxisSize.min, // evita ocupar espaço desnecessário
                            children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.grey),
                            onPressed: () => atualizarContato(index), // Chama função de atualizar
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deletarContato(index), // Chama função de deletar
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
