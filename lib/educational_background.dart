import 'package:flutter/material.dart';

class EducationalBackgroundScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Educational Background"),
      ),
      body: Container(
        color: Color.fromARGB(
            255, 6, 219, 202), // Set the background color to white
        padding: EdgeInsets.all(20), // Add padding for spacing
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Add your educational background information here as Text widgets in a Column
            _buildInfoText("Tertiary Education:"),
            _buildInfoText("Bachelor of Science in Information Technology"),
            _buildInfoText(
                "The Philippine College of Science and Technology (PhilCST)"),
            _buildInfoText("Graduation Year: 2024"),
            SizedBox(height: 20), // Add some spacing between sections
            _buildInfoText("High School Diploma:"),
            _buildInfoText("DCNHS School"),
            _buildInfoText("Graduation Year: 2020"),
            SizedBox(height: 20), // Add some spacing between sections
            _buildInfoText("Primary Education:"),
            _buildInfoText("MTES"),
            _buildInfoText("Graduation Year: 2014"),
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
          color:
              const Color.fromARGB(255, 0, 0, 0), // Set the text color to black
          fontSize: 16, // Set the font size
          fontWeight: FontWeight.bold, // Set the font weight to bold
          fontStyle: FontStyle.italic, // Set the font style to italic
        ),
      ),
    );
  }
}
