import 'package:flutter/material.dart';
import 'package:sistema_login/dados_mock.dart';
import 'package:sistema_login/pages/home_page.dart';

class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  bool esconderSenha = true;

  void entrar(){
    String email = emailController.text.trim();
    String senha = senhaController.text.trim();

    if(email.isEmpty || senha.isEmpty){
      mostrarMensagem('preencha p e-mail e senha');
      return;
    }
    Map<String, String>? usuarioEncontrado;

    for(var usuario in usuarios){
      if(usuario['email'] == email &&
      usuario['senha'] == senha ){
        usuarioEncontrado = usuario;
        break;
      }
    }
    if(usuarioEncontrado == null){
      mostrarMensagem('E-mail ou senha incorreta');
      return;
    }
    
  }
  void mostrarMensagem(String mensagem){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(mensagem),)
    );
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar : AppBar(
          title: const Text('Login'),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20,),

              const Icon(
                Icons.account_circle,
                size: 100,
              ),

              const SizedBox(height: 20,),

              const Text(
                'Bem-vindo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold
                ),
              ),
              
              const SizedBox(height: 20,),

              const Text(
                'Entre com sua conta para acessar o sistema',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 30,),

              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'E-mail',
                  hintText: 'Digite seu email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),
              ),

              const SizedBox(height: 15,),

              TextField(
                controller: senhaController,
                obscureText: esconderSenha,
                decoration:  InputDecoration(
                  labelText: 'Senha',
                  hintText: 'Digite sua senha',
                  prefixIcon: Icon(Icons.lock),    
                  border: OutlineInputBorder(),             
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        esconderSenha = !esconderSenha;
                      });
                    }, 
                    icon: Icon(
                      esconderSenha 
                      ? Icons.visibility
                      : Icons.visibility_off
                    ),
                  )
                ),
              ),

            const SizedBox(height: 25,),

          ElevatedButton.icon(
            onPressed: entrar,
            icon: const Icon(Icons.login),
            label: const Text("Entrar"),
            ),
          OutlinedButton.icon(
            onPressed: (){},
            icon: const Icon(Icons.person_add),
            label: const Text("Criar Usuario"),
            ),

            ],
          ),
        )
    );
  }
}