import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miniappflutter/screens/homescreen.dart';

class Login extends StatefulWidget {
  @override
  State<Login>
  createState() => _FormLoginState();

}

class _FormLoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  //Controllers para campos de entrada
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  //recebe valores
  String? _outemail ='';
  String? _outsenha = '';

  void _validar(){
     String email = _emailController.text.trim();
     String senha = _senhaController.text.trim();

    if(email == 'admin' && senha == '123'){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Deu boa'),
          duration: Duration(seconds: 4),
        ),
      );
      Navigator.push(context,
        MaterialPageRoute(builder: (context)=>
          MyHomePage()
        )
      );
    }
    else
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Deu ruim'))
      );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        labelText: 'Email please',
                        border: OutlineInputBorder()
                      ),
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'Não pode ficar vazio';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _senhaController,
                      decoration: InputDecoration(
                        labelText: 'senha',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                      validator: (value){
                        if(value == null || value.isEmpty){
                          return 'precisa por a senha';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 10,),
                    ElevatedButton(
                        onPressed: (){
                          _validar();
                        },
                        child: Text('Entrar')
                    )
                  ],
                ),
              )
            ],
          ),
      ),
    );
  }



}