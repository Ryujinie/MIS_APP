import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/features/screens/login_screens/login_form_screen.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';

const String empBackgroundImagePath = 'assets/images/emp_bg.png';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String selectedInput;

  // init state
  @override
  void initState() {
    // Initializing variables
    selectedInput = '';
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage(empBackgroundImagePath), context);
    });
  }

  // build state
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color(0xff41caff),
      body: Stack(
        children: [
          //Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(empBackgroundImagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Selection
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              width: 450,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.5),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ================== Selection ================== //
                  Text(
                    'Login as',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          color: constants.mainTextBlack,
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),

                  //
                  const SizedBox(height: 10),

                  // ================== Admin Button ================== //
                  SizedBox(
                    width: 300,
                    child: CustomElevatedButton(
                      // On pressed function
                      onPressed: () {
                        // Set variable value
                        setState(() {
                          selectedInput = 'admin';
                          debugPrint('Selected role $selectedInput');
                        });

                        // Navigate to the screen and pass the value
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginFormScreen(
                              selectedInput: selectedInput,
                            ),
                          ),
                        );
                      },

                      // Styles
                      color: constants.loginBtn,
                      borderRadius: 16,

                      // Label
                      label: Text(
                        'Admin',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: constants.mainTextWhite,
                            ),
                      ),
                    ),
                  ),

                  //
                  const SizedBox(height: 14),

                  // ================== Employee Button ================== //
                  SizedBox(
                    width: 300,
                    child: CustomElevatedButton(
                      // On pressed function
                      onPressed: () {
                        // Set variable value
                        setState(() {
                          selectedInput = 'employee';
                          debugPrint('Selected role $selectedInput');
                        });

                        // Navigate to the screen and pass the value
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginFormScreen(
                              selectedInput: selectedInput,
                            ),
                          ),
                        );
                      },

                      // Styles
                      color: constants.loginBtn,
                      borderRadius: 16,

                      // Label
                      label: Text(
                        'Employee',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: constants.mainTextWhite,
                            ),
                      ),
                    ),
                  ),

                  //
                  const SizedBox(height: 14),

                  // ================== Hr Button ================== //
                  SizedBox(
                    width: 300,
                    child: CustomElevatedButton(
                      // On pressed function
                      onPressed: () {
                        // Set variable value
                        setState(() {
                          selectedInput = 'hr';
                          debugPrint('Selected role $selectedInput');
                        });

                        // Navigate to the screen and pass the value
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginFormScreen(
                              selectedInput: selectedInput,
                            ),
                          ),
                        );
                      },

                      // Styles
                      color: constants.loginBtn,
                      borderRadius: 16,

                      // Label
                      label: Text(
                        'HR',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: constants.mainTextWhite,
                            ),
                      ),
                    ),
                  ),

                  //
                  const SizedBox(height: 14),

                  // ================== Supervisor Button ================== //
                  SizedBox(
                    width: 300,
                    child: CustomElevatedButton(
                      // On pressed function
                      onPressed: () {
                        // Set variable value
                        setState(() {
                          selectedInput = 'supervisor';
                          debugPrint('Selected role $selectedInput');
                        });

                        // Navigate to the screen and pass the value
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginFormScreen(
                              selectedInput: selectedInput,
                            ),
                          ),
                        );
                      },

                      // Styles
                      color: constants.loginBtn,
                      borderRadius: 16,

                      // Label
                      label: Text(
                        'Supervisor',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: constants.mainTextWhite,
                            ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 14),

                  // ================== Manager Button ================== //
                  SizedBox(
                    width: 300,
                    child: CustomElevatedButton(
                      // On pressed function
                      onPressed: () {
                        // Set variable value
                        setState(() {
                          selectedInput = 'manager';
                          debugPrint('Selected role $selectedInput');
                        });

                        // Navigate to the screen and pass the value
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginFormScreen(
                              selectedInput: selectedInput,
                            ),
                          ),
                        );
                      },

                      // Styles
                      color: constants.loginBtn,
                      borderRadius: 16,

                      // Label
                      label: Text(
                        'Manager',
                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                              color: constants.mainTextWhite,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // MIs Logo
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/mis_logo.jpg',
              height: 150,
              width: 150,
            ),
          ),
        ],
      ),
    );
  }
}
