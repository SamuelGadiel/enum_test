import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String backendTitle = "Um titulo enviado pelo backend";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ENUM TEST'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OnboardingClass.get(Onboarding.title, backendTitle),
            OnboardingClass.get(Onboarding.description),
            OnboardingClass.get(Onboarding.button),
          ],
        ),
      ),
    );
  }
}



enum Onboarding {
  title("TITLE"),
  description("DESCRIPTION"),
  button("BUTTON"),
  checkbox("CHECKBOX");

  final String value;
  const Onboarding(this.value);
}

class OnboardingClass {
  static CodeTitle getTitle(String title) => CodeTitle(title);

  static CodeDescription getDescription() => const CodeDescription();

  static CodeButton getButton() => const CodeButton();

  static Widget get(Onboarding widgetType, [dynamic value]) {
    if (widgetType == Onboarding.title) {
      return CodeTitle(value as String);
    } else if (widgetType == Onboarding.description) {
      return getDescription();
    } else if (widgetType == Onboarding.button) {
      return getButton();
    } else {
      return const SizedBox();
    }
  }
}

class CodeTitle extends StatelessWidget {
  final String title;
  const CodeTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title);
  }
}

class CodeDescription extends StatelessWidget {
  const CodeDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
        'Laboris ipsum aute fugiat consectetur esse eiusmod consequat sint. Magna incididunt aliquip consequat consectetur exercitation Lorem mollit enim cillum tempor. Tempor est incididunt quis consectetur sunt officia minim ex id. Deserunt minim irure nostrud sit. Incididunt pariatur amet et excepteur cillum cupidatat officia dolor deserunt amet ullamco commodo. Voluptate velit Lorem eu adipisicing ex eiusmod qui reprehenderit exercitation commodo in amet est. Fugiat excepteur eiusmod fugiat sint id fugiat consequat consectetur irure excepteur sit officia exercitation.');
  }
}

class CodeButton extends StatelessWidget {
  const CodeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: const Text('BOTÃO'));
  }
}
