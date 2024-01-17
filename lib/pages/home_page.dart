import 'dart:ffi';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _nameController = TextEditingController();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  String _result = "";

  void calculatorIcm() {
    double weight = double.tryParse(_weightController.text) ?? 0.0;
    double height = double.parse(_heightController.text) / 100.0;

    if (weight > 0 && height > 0) {
      double imc = weight / (height * height);
      _result = "${imc.toStringAsFixed(2)}\n";

        if (imc < 16) {
          _result += "Magreza grave";
        } else if (imc < 17) 
          _result += "Magreza moderada";
         else if (imc < 18.5) 
          _result += "Magreza leve";
         else if (imc < 25) 
          _result += "Saudável";
         else if (imc < 30) 
          _result += "Sobrepeso";
         else if (imc < 35) 
          _result += "Obesidade Grau I";
         else if (imc < 40) 
          _result += "Obesidade Grau II (severa)";
         else 
          _result += "Obesidade Grau III (mórbida)";
        } else {
          _result = "Por favor, insira valores válidos.";
      }

      setState(() {});
  } 

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 0, 29, 171),
          title:const Center(
            child: Text(
              'Calculadora IMC',
              style: TextStyle(fontWeight: FontWeight.w900, fontSize: 22, color: Colors.white),
              ),
          ),
        ),
        body: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                width: 410,
                height: 200,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset('assets/images/logo.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ),
      
              Padding(
                padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 30.0, bottom: 20.0),
                child: Center(
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Nome',
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 20.0),
                child: Center(
                  child: TextField(
                    controller: _weightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Peso (kg)',
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                child: Center(
                  child: TextField(
                    controller: _heightController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Altura (m)',
                    ),
                  ),
                ),
              ),
            
               SizedBox(
                height: 100,
              
                child: Center(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 5, 0, 146),),
                      onPressed:() {
                          calculatorIcm();
                         },
                        child: const Text('Calcular',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                          ),),
                    ),
                  ),
                ),

              Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Center(
                    child: Text( 'Seu IMC: $_result',
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  ),
                ),
            
            ],
          ),
        ),
      ),
    );
  }
}