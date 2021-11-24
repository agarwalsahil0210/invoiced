import 'package:flutter/material.dart';
import 'package:invoiced/pdfhelper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String name = "", email = "", phone = "", cname = "";
  bool changeButton = false;

  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async {
    if (_formKey.currentState!.validate()) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Invoiced"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
      ),
      body: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    "Welcome $name",
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter name",
                            labelText: "Name",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Name cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            name = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter email",
                            labelText: "Email",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Email cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            email = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter phone number",
                            labelText: "Phone ",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Phone cannot be empty";
                            }
                            return null;
                          },
                          onChanged: (value) {
                            phone = value;
                            setState(() {});
                          },
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: "Enter company name",
                            labelText: "Company Name",
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Company name cannot be empty";
                            }

                            return null;
                          },
                          onChanged: (value) {
                            cname = value;
                            setState(() {});
                          },
                        ),
                        SizedBox(
                          height: 40.0,
                        ),
                        RaisedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PdfHelper(
                                    name: name,
                                    email: email,
                                    phone: phone,
                                    cname: cname),
                              ),
                            );
                          },
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          color: Colors.deepPurple,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
