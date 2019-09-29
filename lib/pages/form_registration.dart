import 'package:development/assets/ColorPellete.dart';
import 'package:development/pages/dashboard_list.dart';
import 'package:flutter/material.dart';

class FormRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: FormRegistrationPage(),
      ),
    );
  }
}

class FormRegistrationPage extends StatefulWidget {
  @override
  _FormRegistrationPageState createState() => _FormRegistrationPageState();
}

class _FormRegistrationPageState extends State<FormRegistrationPage> {
  final _formkey = GlobalKey<FormState>();
  bool _validasi = false;
  String firstname;
  String lastname;
  String email;
  String password;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formkey, //key global
          autovalidate: _validasi, //wajib di isi
          child: formUI(),
        ),
      ),
    );
  }

  Widget formUI() {
    return Column(
      children: <Widget>[
        // Label fill in field
        Padding(
          padding: const EdgeInsets.only(
              top: 100.0, bottom: 10.0, left: 15.0, right: 15.0),
          child: Text(
            "Fill in Your First name, last name, email, and password",
            style: TextStyle(
                fontSize: 30.0,
                color: ColorPalette.descriptionColor,
                fontWeight: FontWeight.w700),
          ),
        ),
        //Field First Name
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF096D65),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              hintText: 'Fill in your First Name',
              labelText: "First Name",
            ),
            keyboardType: TextInputType.text,
            validator: validateFistname,
            onSaved: (String val) {
              firstname = val;
            },
          ),
        ),
        //Field Last Name
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF096D65),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              hintText: ' Fill in your Last Name',
              labelText: "Last Name",
            ),
            keyboardType: TextInputType.text,
            validator: validateLastName,
            onSaved: (String val) {
              lastname = val;
            },
          ),
        ),
        //Field Email
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF096D65),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              hintText: ' Email',
              labelText: "Fill in your Email",
            ),
            keyboardType: TextInputType.text,
            validator: validateEmail,
            onSaved: (String val) {
              email = val;
            },
          ),
        ),
        //Field Password
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0XFF096D65),
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
              hintText: 'Fill in your Password',
              labelText: "Password",
            ),
            obscureText: true, //password privasi
            validator: validatePassword,
            onSaved: (String val) {
              password = val;
            },
          ),
        ),
        // Label Sign in
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RichText(
            text: TextSpan(
                // set the default style for the children TextSpans
                style: Theme.of(context).textTheme.body1.copyWith(),
                children: [
                  TextSpan(
                    text: 'Already have an account ? ',
                  ),
                  TextSpan(
                      text: 'Sign in', style: TextStyle(color: Colors.blue)),
                  TextSpan(
                    text: ' to Karir account',
                  ),
                ]),
          ),
        ),
        // Label Terms of Use
        Padding(
          padding: const EdgeInsets.only(top: 10, right: 20.0, bottom: 30.0),
          child: Text("Terms Of Use & Privacy Policy"),
        ),
        //Button Sumbit link to Dashboard
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: double.infinity,
            height: 60.0,
            child: RaisedButton(
              color: Color(0XFF096D65),
              child: Text(
                'Registration',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              onPressed: validateInputan,
            ),
          ),
        ),
      ],
    );
  }

  void validateInputan() {
    if (_formkey.currentState.validate()) {
      _formkey.currentState.save();
      //link to dashboard
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Dashboard()));
    } else {
      setState(() {
        _validasi = true;
      });
    }
  }

  //Validate
  String validateFistname(String value) {
    if (value.length < 2) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String validateLastName(String value) {
    if (value.length < 2) {
      return 'Name must be more than 2 charater';
    } else {
      return null;
    }
  }

  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  String validatePassword(String value) {
    if (value.length < 4) {
      return 'Name must be more than 4 charater';
    } else {
      return null;
    }
  }
}
