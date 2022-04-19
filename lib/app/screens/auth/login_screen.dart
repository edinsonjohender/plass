import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/buttons/ed_button.dart';
import '../../widgets/inputs/main_input.dart';
import 'controllers/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({ Key? key }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {


  final _formKey                            = GlobalKey<FormState>();
  TextEditingController emailController     = TextEditingController();
  TextEditingController passwordController  = TextEditingController();
  bool formRegister                         = false;

  Widget _form(AuthController _){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFieldEd(controller: emailController, labelText: 'Email  *', required: true),
            TextFieldEd(controller: passwordController, labelText: 'Password  *', required: true, obscureText: true),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: EdButton( 
                text          : 'INGRESAR',
                width         : double.infinity,
                bgColor       : Get.theme.primaryColor, 
               textColor      : Colors.white,
                borderRadius  : 10,
                height        : 60,
                isLoader      : _.isLoader,
                onTap         : () async { 
                  if(!_.isLoader){
                    if(_formKey.currentState!.validate()){
                      _.loginrUser(emailController.text, passwordController.text);
                    } 
                  }
                }
              )
            ),
          ],
        ),
      ),
    );
  }

  Widget _header(_, conxtext){
    return Stack(
      children: [
        SizedBox(        
          height: double.infinity,      
          child: Image.asset('assets/images/bg-auth.jpg', fit: BoxFit.cover),
        ),
        const Center(
          child: Image(image:  AssetImage('assets/images/logo-dark.png'))
        ),
      ]
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (_)=>Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: false,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height / 2,
              flexibleSpace: FlexibleSpaceBar(background: _header(_, context)),
            ),
            SliverList(
              delegate: SliverChildListDelegate([
                _form(_)
              ]),
            )
          ],
        ),
      )
    );
  }
}