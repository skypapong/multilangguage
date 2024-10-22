import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Twoscreen extends StatefulWidget {
  const Twoscreen({super.key});

  @override
  State<Twoscreen> createState() => _TwoscreenState();
}

class _TwoscreenState extends State<Twoscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.detail),),
      body: Center(
        child: Text(AppLocalizations.of(context)?.countMsg ?? ""),
      ),
    );
  }
}
