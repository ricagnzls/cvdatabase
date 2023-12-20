import 'package:flutter/material.dart';

class PersonalInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Personal Information"),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 13, 203, 228), // Set the background color to white
        padding: EdgeInsets.all(70), // Add padding for spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add your personal information here as Text widgets in a Column
            _buildInfoText("Name: kersten sean calimlim"),
            _buildInfoText("Age: 22 years old"),
            _buildInfoText("Address: Mangin,Dagupan Pangasinan"),
            _buildInfoText("Date of Birth: Jan, 11, 2001"),
            _buildInfoText("Place of Birth: San carlos, Pangasinan"),
            _buildInfoText("Sex: Male"),
            _buildInfoText("Citizenship: Filipino"),
            _buildInfoText("Civil Status: Single"),
            _buildInfoText("Religion: Roman Catholic"),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        text,
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0), // Set the text color to black
          fontSize: 16, // Set the font size
          fontWeight: FontWeight.bold, // Set the font weight to bold
          fontStyle: FontStyle.italic, // Set the font style to italic
        ),
      ),
    );
  }
}
