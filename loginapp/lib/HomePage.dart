import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
           appBar: AppBar(
            centerTitle: true,
              title: Text("LoginApp", style: GoogleFonts.quicksand(
                fontWeight:FontWeight.bold,
                fontSize:25
              ),
              ),
              backgroundColor: Colors.blue,
          ),
          body:const Center(
            child: const Text("Home Page"),
          ),
        ),
    );
  }
}