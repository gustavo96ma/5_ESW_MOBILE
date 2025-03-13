import 'package:flutter/material.dart';

import 'home_page.dart';
import 'widgets/button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xgetstahyivhigwrbjfp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhnZXRzdGFoeWl2aGlnd3JiamZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2OTgzNTksImV4cCI6MjA1NjI3NDM1OX0.fMKvSp9uTc-7cNWq0VJK_pgvbUg2WW6rdfgXUCqfuu8',
  );
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return MaterialApp(
      home: Scaffold(
        body: Builder(builder: (context) {
          final Session? session = Supabase.instance.client.auth.currentSession;

          if (session != null && !session.isExpired) {
            return HomePage();
          }

          return LayoutBuilder(builder: (context, constraints) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                      'https://unicv.edu.br/wp-content/uploads/2020/12/logo-verde-280X100.png'),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: constraints.maxWidth * 0.35,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(20, 20),
                              color: Colors.grey,
                              blurRadius: 40.0,
                              spreadRadius: 0.005),
                        ],
                      ),
                      child: Card(
                        color: const Color(0xff678256),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                              child: TextField(
                                controller: emailController,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  fillColor: Color(0xff859572),
                                  filled: true,
                                  labelText: 'Email',
                                  labelStyle:
                                      TextStyle(color: Color(0xffd4cebe)),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                              child: TextField(
                                controller: passwordController,
                                style: TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: InputDecoration(
                                  fillColor: Color(0xff859572),
                                  filled: true,
                                  labelText: 'Senha',
                                  labelStyle:
                                      TextStyle(color: Color(0xffd4cebe)),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Button(
                                    buttonColor: Color(0xffdc9e46),
                                    buttonHeight: 30,
                                    buttonWidth: 100,
                                    onPressed: () async {
                                      try {
                                        await Supabase.instance.client.auth
                                            .signUp(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage()));
                                      } on AuthApiException catch (e) {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Erro'),
                                            content: const Text(
                                                'Não foi possível realizar o cadastro! Tente novamente mais tarde!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Color(0xFF546f40)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    text: 'Cadastro',
                                  ),
                                  SizedBox(
                                    width: 16,
                                  ),
                                  Button(
                                    buttonColor: Color(0xffdc9e46),
                                    buttonHeight: 30,
                                    buttonWidth: 100,
                                    onPressed: () async {
                                      try {
                                        await Supabase.instance.client.auth
                                            .signInWithPassword(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);

                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const HomePage()));
                                      } on AuthApiException catch (e) {
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: const Text('Erro'),
                                            content: const Text(
                                                'Não foi possível logar no sistema! Tente novamente mais tarde!'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () =>
                                                    Navigator.pop(context),
                                                child: const Text(
                                                  'Ok',
                                                  style: TextStyle(
                                                      color: Color(0xFF546f40)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    },
                                    text: 'Login',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          });
        }),
      ),
    );
  }
}
