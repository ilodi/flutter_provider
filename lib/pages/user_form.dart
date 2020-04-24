import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:providers/providers/user_provider.dart';

class UserFormPage extends StatefulWidget {

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  //para el textEditingControlles solo funciona en un fullwidget  y se tiene
  // que desactivar al terminar
  final TextEditingController _nameControler = TextEditingController();
  final TextEditingController _lastnameControler = TextEditingController();

  @override
  void dispose() {
    _nameControler.dispose();
    _lastnameControler.dispose();
    super.dispose();

  }

  @override
  Widget build(BuildContext context) {
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          child: Column(
            children: <Widget>[
              TextField(
                controller: _nameControler,
                decoration: InputDecoration(hintText: "name"),
                onChanged: (text) {
                  provider.setName(text);
                },
              ),
              TextField(
                controller: _lastnameControler ,
                decoration: InputDecoration(hintText: "lastname"),
                onChanged: (text) {
                  provider.setLastname(text);
                },
              ),
              Consumer<UserProvider>(builder: (_, _provider, widget) {
                return Slider(
                    min: 0,
                    max: 100,
                    onChanged: (vale) {
                      _provider.setAge(vale.toInt());
                    },
                    value:
                        _provider.age != null ? _provider.age.toDouble() : 0);
              }),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                color: Colors.black12,
                padding: EdgeInsets.all(10),
                child: Consumer<UserProvider>(
                  builder: (_, _provider, widget) {
                    return Text(
                        "name: ${_provider.name},lastname:${_provider.lastname}, age ${_provider.age}");
                  },
                ),
              ),
              FlatButton(
                child: Text("log out"),
                onPressed: () {
                  provider.logOut();
                  _nameControler.text='';
                  _lastnameControler.text='';
                },
              ),
              FlatButton(
                child: Text("Go to detail"),
                onPressed: (){
                  Navigator.popAndPushNamed(context, 'detail');
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
