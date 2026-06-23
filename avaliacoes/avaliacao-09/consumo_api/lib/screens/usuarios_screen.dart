import 'package:flutter/material.dart';
import '../models/usuario.dart';
import '../services/api_service.dart';

class UsuariosScreen extends StatefulWidget {
  const UsuariosScreen({super.key});

  @override
  State<UsuariosScreen> createState() => _UsuariosScreenState();
}

class _UsuariosScreenState extends State<UsuariosScreen> {
  final ApiService apiService = ApiService();

  List<Usuario> usuarios = [];

  bool carregando = true;
  String? erro;

  @override
  void initState() {
    super.initState();
    carregarUsuarios();
  }

  Future<void> carregarUsuarios() async {
    try {
      setState(() {
        carregando = true;
        erro = null;
      });

      // Simula uma demora de 3 segundos
      await Future.delayed(const Duration(seconds: 3));

      final dados = await apiService.buscarUsuarios();

      setState(() {
        usuarios = dados;
      });
    } catch (e) {
      setState(() {
        erro =
            "Não foi possível carregar os usuários.\nVerifique sua conexão e tente novamente.";
      });
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  void adicionarUsuario() {
    final nomeController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Novo Usuário"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              if (nomeController.text.isEmpty || emailController.text.isEmpty) {
                return;
              }

              setState(() {
                usuarios.add(
                  Usuario(
                    id: usuarios.length + 1,
                    nome: nomeController.text,
                    email: emailController.text,
                  ),
                );
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Usuário adicionado com sucesso!"),
                ),
              );
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  void editarUsuario(int index) {
    final nomeController = TextEditingController(text: usuarios[index].nome);

    final emailController = TextEditingController(text: usuarios[index].email);

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Editar Usuário"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(labelText: "Nome"),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: "Email"),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                usuarios[index].nome = nomeController.text;
                usuarios[index].email = emailController.text;
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Usuário atualizado!")),
              );
            },
            child: const Text("Salvar"),
          ),
        ],
      ),
    );
  }

  void excluirUsuario(int index) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Confirmar exclusão"),
        content: Text("Deseja remover ${usuarios[index].nome}?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancelar"),
          ),
          ElevatedButton(
            onPressed: () {
              final nome = usuarios[index].nome;

              setState(() {
                usuarios.removeAt(index);
              });

              Navigator.pop(context);

              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text("$nome removido.")));
            },
            child: const Text("Excluir"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: adicionarUsuario,
        icon: const Icon(Icons.person_add),
        label: const Text("Adicionar"),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f172a), Color(0xff1e293b)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Usuários",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: carregando
                    ? const Center(child: CircularProgressIndicator())
                    : erro != null
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.wifi_off,
                                size: 80,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 20),
                              Text(
                                erro!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: carregarUsuarios,
                                child: const Text("Tentar novamente"),
                              ),
                            ],
                          ),
                        ),
                      )
                    : RefreshIndicator(
                        onRefresh: carregarUsuarios,
                        child: ListView.builder(
                          padding: const EdgeInsets.all(12),
                          itemCount: usuarios.length,
                          itemBuilder: (context, index) {
                            final usuario = usuarios[index];

                            return Card(
                              elevation: 8,
                              margin: const EdgeInsets.only(bottom: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: ListTile(
                                contentPadding: const EdgeInsets.all(12),
                                leading: CircleAvatar(
                                  radius: 28,
                                  child: Text(usuario.nome[0].toUpperCase()),
                                ),
                                title: Text(
                                  usuario.nome,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(usuario.email),
                                trailing: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    IconButton(
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      ),
                                      onPressed: () => editarUsuario(index),
                                    ),
                                    IconButton(
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                      onPressed: () => excluirUsuario(index),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
