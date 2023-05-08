import 'package:first_app/pages/user_info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class RegisterForm extends StatefulWidget {
  @override
  State<RegisterForm> createState() {
    return _RegisterFormState();
  }
}

class _RegisterFormState extends State<RegisterForm> {
  List<String> _countries = ['Russia', 'Ukraine', 'Germany', 'France'];
  String? _currentCountry;
  bool _hidePass = true;
  User userInfo = User();

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _lifeStoryController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _emailFocus = FocusNode();
  final _passwordFocus = FocusNode();
  final _confirmPasswordFocus = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();

    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _lifeStoryController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    _nameFocus.dispose();
    _phoneFocus.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    _confirmPasswordFocus.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode current, FocusNode next) {
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          TextFormField(
            controller: _nameController,
            validator: _nameValidator,
            inputFormatters: [
              FilteringTextInputFormatter(RegExp(r'^[A-Za-z ]+$'), allow: true)
            ],
            focusNode: _nameFocus,
            autofocus: true,
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _nameFocus, _phoneFocus);
            },
            onChanged: (value) => userInfo.name = value,
            decoration: InputDecoration(
              labelText: 'Enter name *',
              hintText: 'Enter your name',
              prefixIcon: const Icon(Icons.person),
              suffixIcon: GestureDetector(
                  child: const Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    _nameController.clear();
                  }),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            inputFormatters: [
              FilteringTextInputFormatter(
                RegExp(r'^[()-\d]{1,15}$'),
                allow: true,
              )
            ],
            validator: _phoneValidator,
            focusNode: _phoneFocus,
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _phoneFocus, _emailFocus);
            },
            onSaved: (value) => userInfo.phone = value!,
            decoration: InputDecoration(
              labelText: 'Phone number *',
              hintText: 'Enter your phone number',
              helperText: 'Phone format XXX-XXXX',
              prefixIcon: const Icon(Icons.phone),
              suffixIcon: GestureDetector(
                  onLongPress: () {
                    _phoneController.clear();
                  },
                  child: const Icon(Icons.delete, color: Colors.red)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            //validator: _emailValidator,
            focusNode: _emailFocus,
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _emailFocus, _passwordFocus);
            },
            onSaved: (value) => userInfo.email = value,
            decoration: InputDecoration(
              labelText: 'Email address',
              hintText: 'Enter your email address',
              prefixIcon: const Icon(Icons.email),
              suffixIcon: GestureDetector(
                onTap: () {
                  _emailController.clear();
                },
                child: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          DropdownButtonFormField(
            items: _countries
                .map(
                  (country) => DropdownMenuItem(
                    value: country,
                    child: Text(country),
                  ),
                )
                .toList(),
            onChanged: (country) {
              setState(() {
                _currentCountry = country;
                userInfo.country = country;
              });
            },
            value: _currentCountry,
            decoration: const InputDecoration(
              labelText: 'Select country',
              hintText: 'Select country',
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Colors.black,
                    width: 2.0,
                  )),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                  borderSide: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  )),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _lifeStoryController,
            maxLines: 3,
            onSaved: (value) => userInfo.story = value,
            decoration: const InputDecoration(
              labelText: 'Life story',
              hintText: 'Enter your biography here',
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _passwordController,
            obscureText: _hidePass,
            maxLength: 8,
            validator: _passwordValidator,
            focusNode: _passwordFocus,
            onFieldSubmitted: (_) {
              _fieldFocusChange(context, _passwordFocus, _confirmPasswordFocus);
            },
            decoration: InputDecoration(
              labelText: 'Password *',
              hintText: 'Enter your password',
              prefixIcon: const Icon(Icons.security),
              suffixIcon: IconButton(
                icon: _hidePass
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _hidePass = !_hidePass;
                  });
                },
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: _hidePass,
            maxLength: 8,
            validator: _passwordValidator,
            focusNode: _confirmPasswordFocus,
            decoration: InputDecoration(
              labelText: 'Confirm password *',
              hintText: 'Confirm your password',
              prefixIcon: const Icon(Icons.border_color),
              suffixIcon: IconButton(
                icon: _hidePass
                    ? const Icon(Icons.visibility)
                    : const Icon(Icons.visibility_off),
                onPressed: () {
                  setState(() {
                    _hidePass = !_hidePass;
                  });
                },
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 2.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 2.0,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              _submitForm(context);
            },
            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            child: const Text(
              'Submit form',
              style: TextStyle(color: Colors.white),
            ),
          )
        ],
      ),
    );
  }

  void _showSnackBar(BuildContext context, String title) {
    final snackBar = SnackBar(
      content: Text(
        title,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.normal),
      ),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
      action: SnackBarAction(
          label: 'action', textColor: Colors.white, onPressed: () {}),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _showAlertDialog(String name) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text('Registration success'),
          content: Text('For $name registration success'),
          actions: [
            TextButton(
              child: const Text('Show info'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserInfoPage(userInfo),
                  ),
                );
              },
            )
          ],
        );
      },
    );
  }

  String? _nameValidator(String? value) {
    RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value != null && value.isEmpty) {
      return 'Name should not be empty';
    } else if (value != null && !nameExp.hasMatch(value)) {
      return 'Name must contain letters';
    }
    return null;
  }

  String? _phoneValidator(String? value) {
    RegExp phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');

    if (value != null && value.isEmpty) {
      return 'Phone should not be empty';
    } else if (value != null && !phoneExp.hasMatch(value)) {
      return 'Phone shoud be (###)###-####';
    }
    return null;
  }

  String? _emailValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Email shoud not be empty';
    } else if (value != null && !value.contains('@')) {
      return 'Email should be example@email.com';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value != null && value.isEmpty) {
      return 'Password should not be empty';
    } else if (value != null && value.length < 8) {
      return 'Password length should be 8';
    } else if (_passwordController.text != _confirmPasswordController.text) {
      return 'Passwords mismatch';
    }
    return null;
  }

  void _submitForm(BuildContext context) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      _showAlertDialog(_nameController.text);

      print('Form is correct');
      print('Name is ${_nameController.text}');
      print('Phone is ${_phoneController.text}');
      print('Email is ${_emailController.text}');
      print('Life story is ${_lifeStoryController.text}');
    } else {
      print('Form is incorrect please check and correct');
      _showSnackBar(context, 'Form is not valid please check and correct');
    }
  }
}
