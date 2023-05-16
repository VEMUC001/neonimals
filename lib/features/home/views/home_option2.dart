import 'package:cinsie_neonimals/constants/assets_constants.dart';
import 'package:cinsie_neonimals/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neon_widgets/neon_widgets.dart';

import '../controller/auth_controller.dart';

class HomeOption2 extends ConsumerStatefulWidget {
  const HomeOption2({super.key});

  @override
  ConsumerState<HomeOption2> createState() => _HomeOption2State();
}

class _HomeOption2State extends ConsumerState<HomeOption2> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void onSubscribe() {
    ref.read(authControllerProvider.notifier).subscribe(
          email: _controller.text,
          context: context,
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallete.primaryBackground,
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            colors: [Colors.deepOrange, Pallete.primaryBackground],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: const Image(
                  image: AssetImage(AssetConstants.noBgLogoImage),
                  fit: BoxFit.fitHeight,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: NeonText(
                  text: "The Neonimals - Dancing Owl Collection",
                  fontFamily: AssetConstants.font,
                  spreadColor: Colors.pink,
                  blurRadius: 20,
                  textSize: 18,
                  textColor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height - 100,
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Image(
                        image: AssetImage(AssetConstants.noBgOwlImage),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  buildSideView(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildEmailInputField() {
    // a text input field with box decoration and with submit icon button
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          keyboardType: TextInputType.emailAddress,
          controller: _controller,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w200),
          textInputAction: TextInputAction.send,
          onSubmitted: (value) {
            onSubscribe();
            _controller.clear();
          },
          decoration: InputDecoration(
            icon: const Icon(
              Icons.email,
              color: Colors.white70,
            ),
            filled: true,
            fillColor:
                const Color.fromARGB(255, 210, 194, 251).withOpacity(0.2),
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusColor: Colors.white,
            hoverColor: Colors.transparent,
            labelText: 'Enter your email to get invited for limited drops',
            labelStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.w200),
          ),
        ),
      ),
    );
  }

  final text =
      "Introducing our exclusive rave accessories and clothing line, featuring limited edition merchandise that you won't find anywhere else. Our collection is designed for those who want to stand out and make a statement wherever you decide to rave. From vibrant colors to unique designs, our rave merch is perfect for those who want to express their individuality.\n\nBut that's not all - we're also offering limited entries to our upcoming drops, so you can get your hands on our latest gear before anyone else. Don't miss your chance to be part of the exclusive few who get to own our limited edition merchandise.\n\nJoin our community and stay up-to-date on our latest drops and exclusive offers. Be part of the movement and get ready to rave in style.";

  Widget buildSideView() {
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        children: [
          buildEmailInputField(),
          NeonContainer(
            width: MediaQuery.of(context).size.width * 0.4,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            borderWidth: 0.5,
            borderColor: Colors.pink.shade200,
            spreadColor:
                const Color.fromARGB(255, 189, 114, 255).withOpacity(0.3),
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
              child: NeonText(
                text: text,
                fontFamily: AssetConstants.font,
                textAlign: TextAlign.start,
                spreadColor: Colors.pinkAccent,
                textColor: Colors.white,
                blurRadius: 2,
                // fontWeight: FontWeight.w500,
                textSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
