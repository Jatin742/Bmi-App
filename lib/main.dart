import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _MyHomePage();
}

class _MyHomePage extends State<MyHomePage>{
  var weightcontroller=TextEditingController();
  var htcontroller=TextEditingController();
  var result="";
  var bgcolor=Colors.indigo.shade200;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('BMI'),
        ),
        body: Container(
          color: bgcolor,
          child: Center(
            child: Container(
              width: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('BMI', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),),
                  SizedBox(height: 21,),
                  TextField(
                    controller: weightcontroller,
                    decoration: InputDecoration(label: Text('Enter Weight in kg')),
                    keyboardType: TextInputType.number,),
                  SizedBox(height: 21,),
                  TextField(
                    controller: htcontroller,
                    decoration: InputDecoration(label: Text('Enter Height in meter')),
                    keyboardType: TextInputType.number,),
                  SizedBox(height: 16,),
                  ElevatedButton(onPressed: (){
                    var wt=weightcontroller.text.toString();
                    var ht=htcontroller.text.toString();
                    if(wt!="" && ht!=""){
                      var iwt=double.parse(wt);
                      var iht=double.parse(ht);
                      var bmi=iwt/(iht*iht);
                      var msg="";
                      if(bmi>25){
                        bgcolor=Colors.orange.shade200;
                        msg="You are overweight";
                      }
                      else if(bmi<18){
                        bgcolor=Colors.red.shade200;
                        msg="You are under weight";
                      }
                      else{
                        bgcolor=Colors.green.shade200;
                        msg="You are Fit!";
                      }
                      setState(() {
                        result="$msg\nYour bmi is ${bmi.toStringAsFixed(4)}";
                      });
                    }
                    else{
                      setState(() {
                        result="Please fill all required blanks!!";
                      });
                    }
                  }, child: Text('Calculate')),
                  SizedBox(height: 11,),
                  Text('$result',style: TextStyle(fontSize: 19),)
                ],
              ),
            ),
          ),
        )
    );
  }
}