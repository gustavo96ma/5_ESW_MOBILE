import 'package:flutter/material.dart';

import 'widgets/button.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: 'https://xgetstahyivhigwrbjfp.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhnZXRzdGFoeWl2aGlnd3JiamZwIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2OTgzNTksImV4cCI6MjA1NjI3NDM1OX0.fMKvSp9uTc-7cNWq0VJK_pgvbUg2WW6rdfgXUCqfuu8',
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
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
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Color(0xff859572),
                              filled: true,
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Color(0xffd4cebe)),
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
                            style: TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: InputDecoration(
                              fillColor: Color(0xff859572),
                              filled: true,
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Color(0xffd4cebe)),
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
                                onPressed: () {},
                                text: 'Cadastro',
                              ),
                              SizedBox(
                                width: 16,
                              ),
                              Button(
                                buttonColor: Color(0xffdc9e46),
                                buttonHeight: 30,
                                buttonWidth: 100,
                                onPressed: () {},
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
        ),
      ),
    );
  }
}
