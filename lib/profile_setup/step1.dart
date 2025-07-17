import 'package:billfold/profile_setup/step2.dart';
import 'package:flutter/material.dart';

class billInfoNote extends StatefulWidget {
  const billInfoNote({super.key});

  @override
  State<billInfoNote> createState() => _billInfoNoteState();
}

class _billInfoNoteState extends State<billInfoNote> {
  bool _agreeToTerms = false;
  int currentStep = 1; // Track the current step in the profile setup
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // allow resize for keyboard
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5, top: 18),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Profile Setup",
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                          "Step 1 of 3",
                        ),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(3, (index) {
                          return Container(
                            width: 30,
                            height: 6,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              color: currentStep > index
                                  ? Colors.orange
                                  : Colors.grey.shade300,
                              borderRadius: BorderRadius.circular(3),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 25),
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFFBD7A1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 15,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Title for the instructions, terms, and conditions
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Instructions, Terms & Conditions",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              // Bulleted list of instructions
                              // Permission and data usage information
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u2022',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "This application requires several permissions to function properly. Please ensure you grant the necessary permissions when prompted.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              // Nessesity of Personal Information
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u2022',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Proprietor Name, Contact, Business Name, Business Logo, Business Address, GSTIN etc. are asked since they will be displayed on the invoice headers you generate. You can edit these details later by navigating to",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    ' ',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Profile > Edit Details.",
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 35, 35, 35),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              // Data Privacy Assurance
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '\u2022',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      "Your Information will be stored securely and used only for generating invoices. We respect your privacy and will not share your data with third parties.",
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),
                              // Checkbox for agreeing to terms and conditions
                              CheckboxListTile(
                                value: _agreeToTerms,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _agreeToTerms = value ?? false;
                                  });
                                },
                                title: Text(
                                  "I agree to the terms and conditions.",
                                  style: TextStyle(fontSize: 16),
                                  textAlign: TextAlign.start,
                                ),
                                controlAffinity:
                                    ListTileControlAffinity.leading,
                                contentPadding: EdgeInsets.zero,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              // Continue button always at the bottom
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _agreeToTerms
                        ? () {
                            // Navigate to the next step
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => billInfo1(),
                              ),
                            );
                          }
                        : null, // Disabled if not agreed
                    child: Text("Continue"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFF59B14), // Button color
                      foregroundColor: Colors.white, // Text color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          30,
                        ), // Rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 32,
                        vertical: 14,
                      ), // Button size
                      textStyle: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
