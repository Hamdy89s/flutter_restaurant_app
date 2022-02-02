import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({ Key? key }) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FocusNode _focusNode = FocusNode();
    return Container(
      height: size.width * 0.17,
      child: TextField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none
          ),
          hintText: "Search Food Items",
          hintStyle: GoogleFonts.cairo(
            color: Colors.white,
            letterSpacing: 0.6
          ),
          prefixIcon: const Icon(Icons.search, color: Colors.white,),
          suffixIcon: Container(
            width: size.width * 0.15,
            height: size.width * 100,
            // height: 70,
            decoration: const BoxDecoration(
              color: Colors.white54,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
            ),
            child: const Icon(Icons.menu, color: Colors.white,),
          ),

          fillColor: Colors.white30,
          filled: true,
        ),
      ),
    );
  }
}