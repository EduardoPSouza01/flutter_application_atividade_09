import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // Import do go_router
import 'package:flutter_application_atividade_09/classes/login_details.dart';
import 'package:flutter_application_atividade_09/widgets/aula09.dart';
import 'package:flutter_application_atividade_09/widgets/login_text_field.dart';
import 'package:collection/collection.dart';
import 'package:flutter_application_atividade_09/widgets/tipo_login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // Criação do GoRouter
  static final GoRouter _router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(path: '/', builder: (context, state) => const MyHomePage()),
      GoRoute(
        path: '/aula09',
        builder: (context, state) {
          // Pega o argumento enviado na navegação
          final args = state.extra as Map<String, String>? ?? {};
          final usuario = args['usuario'] ?? 'Usuário';
          return Aula09(usuario: usuario);
        },
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tela de Login',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      routerConfig: _router,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late TextEditingController _userController;
  late TextEditingController _senhaController;
  TiposLogin _tipoCampoLogin = TiposLogin.email;
  var _senhaEscondida = true;
  var memorizar = false;

  var _tipologin = [true, false, false];

  void _alterarTipoLogin(int idx) {
    setState(() {
      _tipoCampoLogin = TiposLogin.values[idx];
      _tipologin =
          _tipologin.mapIndexed((indice, chave) => indice == idx).toList();
      _userController.text = '';
    });
  }

  var loginMap = LoginDetails.loginDetails();

  void alterarVisibilidade() {
    setState(() {
      _senhaEscondida = !_senhaEscondida;
    });
  }

  @override
  void initState() {
    super.initState();
    _userController = TextEditingController();
    _senhaController = TextEditingController();
  }

  @override
  void dispose() {
    _userController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.75,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(width: 150, 'assets/images/download.png'),
              SizedBox(height: 48),
              TipoLogin(tipoLogin: _tipologin, onPressed: _alterarTipoLogin),
              SizedBox(height: 12),
              LoginTextField(
                controller: _userController,
                tiposLogin: _tipoCampoLogin,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _senhaController,
                obscureText: _senhaEscondida,
                decoration: InputDecoration(
                  label: Text('Senha'),
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: alterarVisibilidade,
                    icon: Icon(
                      _senhaEscondida ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Memorizar dados'),
                  SizedBox(width: 8),
                  Switch(
                    value: memorizar,
                    onChanged: (bool) {
                      setState(() {
                        memorizar = !memorizar;
                      });
                    },
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_userController.text.isEmpty ||
                      _senhaController.text != 'admin') {
                    showDialog(
                      context: context,
                      builder:
                          (context) => AlertDialog(
                            title: Text('Erro no login'),
                            content: Text('Usuário vazio ou senha incorreta!'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('OK'),
                              ),
                            ],
                          ),
                    );
                  } else {
                    // Navega usando go_router e envia argumentos
                    context.go(
                      '/aula09',
                      extra: {'usuario': _userController.text},
                    );
                  }
                },
                child: Center(child: Text('Login')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
