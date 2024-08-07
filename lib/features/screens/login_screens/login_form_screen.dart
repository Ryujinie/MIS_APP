import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/sidebar_screen/admin_sidebar_screen.dart';
import 'package:ssi_mis_flutter/features/screens/sidebar_screen/employee_sidebar_screen.dart';
import 'package:ssi_mis_flutter/features/screens/sidebar_screen/hr_sidebar_screen.dart';
import 'package:ssi_mis_flutter/features/screens/sidebar_screen/manager_sidebar_screen.dart';
import 'package:ssi_mis_flutter/features/screens/sidebar_screen/supervisor_sidebar.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key, required this.selectedInput});

  final String selectedInput;

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  @override
  Widget build(BuildContext context) {
    debugPrint('Napasang Value ${widget.selectedInput}');
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheImage(const AssetImage('assets/images/admin_bg.png'), context);
      precacheImage(const AssetImage('assets/images/emp_bg.png'), context);
      precacheImage(const AssetImage('assets/images/hr_bg.png'), context);
      precacheImage(
          const AssetImage('assets/images/accounting_bg.png'), context);
      precacheImage(const AssetImage('assets/images/manager_bg.png'), context);
      precacheImage(
          const AssetImage('assets/images/supervisor_bg.png'), context);
    });

    //
    return Scaffold(
      body: Stack(
        children: [
          // ======================== Background Image ======================== //
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.selectedInput == 'admin'
                    ? const AssetImage('assets/images/admin_bg.png')
                    : widget.selectedInput == 'employee'
                        ? const AssetImage('assets/images/emp_bg.png')
                        : widget.selectedInput == 'hr'
                            ? const AssetImage('assets/images/hr_bg.png')
                            : widget.selectedInput == 'accounting'
                                ? const AssetImage(
                                    'assets/images/accounting_bg.png')
                                : widget.selectedInput == 'manager'
                                    ? const AssetImage(
                                        'assets/images/manager_bg.png')
                                    : widget.selectedInput == 'supervisor'
                                        ? const AssetImage(
                                            'assets/images/supervisor_bg.png')
                                        : const AssetImage(
                                            'assets/images/emp_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // ======================== Arrow Back Icon ======================== //
          Positioned(
            top: 20,
            left: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),

          // ======================== FORM ======================== //
          Center(
            child: Container(
              margin: const EdgeInsets.only(top: 100),
              width: 500,
              height: 350,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.3),
                borderRadius: const BorderRadius.all(Radius.circular(15.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // Header Text
                  Padding(
                    padding: const EdgeInsets.only(top: 60),
                    child: Text(
                      widget.selectedInput.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            color: constants.mainTextBlack,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),

                  // Email Form
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30.0, vertical: 10),
                    child: Row(
                      children: [
                        // Form Field
                        Expanded(
                          child: TextFormField(
                            decoration: const InputDecoration(
                              labelText: 'Enter Your Email',
                              border: OutlineInputBorder(),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                        ),

                        //
                        const SizedBox(width: 10),

                        // Get Otp button
                        SizedBox(
                          width: 110,
                          height: 55,
                          child: CustomElevatedButton(
                            // On Pressed
                            onPressed: () {},

                            // Styles
                            color: widget.selectedInput == 'admin'
                                ? constants.adminBtn
                                : widget.selectedInput == 'employee'
                                    ? constants.empBtn
                                    : widget.selectedInput == 'hr'
                                        ? constants.hrBtn
                                        : widget.selectedInput == 'accounting'
                                            ? constants.acctngBtn
                                            : widget.selectedInput == 'manager'
                                                ? constants.mngrBtn
                                                : widget.selectedInput ==
                                                        'supervisor'
                                                    ? constants.supervisorBtn
                                                    : constants.empBtn,
                            borderRadius: 0,

                            // label
                            label: Text(
                              'Get OTP',
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.copyWith(color: constants.mainTextWhite),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Otp Form
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    child: PinCodeTextField(
                      appContext: context,
                      length: 6,
                      enableActiveFill: true,
                      onChanged: (value) {},
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(0),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        inactiveColor: Colors.white,
                        inactiveFillColor: Colors.white,
                        activeFillColor: Colors.white,
                        selectedFillColor: Colors.white,
                      ),
                    ),
                  ),

                  // Button
                  Center(
                    child: SizedBox(
                      height: 48,
                      width: 250,
                      child: CustomElevatedButton(
                        // On Pressed
                        onPressed: () {
                          if (widget.selectedInput == 'admin') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AdminSidebarScreen(),
                              ),
                            );
                          } else if (widget.selectedInput == 'employee') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EmployeeSidebarScreen(),
                              ),
                            );
                          } else if (widget.selectedInput == 'hr') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const HRSidebarScreen(),
                              ),
                            );
                          } else if (widget.selectedInput == 'accounting') {
                            // navigate to accounting side bar screen
                          } else if (widget.selectedInput == 'manager') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const ManagerSidebarScreen(),
                              ),
                            );
                            // navigate to accounting side bar screen
                          } else if (widget.selectedInput == 'supervisor') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const SupervisorSidebarScreen()),
                            );
                          }
                        },

                        // Styles
                        color: widget.selectedInput == 'admin'
                            ? constants.adminBtn
                            : widget.selectedInput == 'employee'
                                ? constants.empBtn
                                : widget.selectedInput == 'hr'
                                    ? constants.hrBtn
                                    : widget.selectedInput == 'accounting'
                                        ? constants.acctngBtn
                                        : widget.selectedInput == 'manager'
                                            ? constants.mngrBtn
                                            : widget.selectedInput ==
                                                    'supervisor'
                                                ? constants.supervisorBtn
                                                : constants.empBtn,
                        borderRadius: 30,

                        // label
                        label: Text(
                          'Submit',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge
                              ?.copyWith(color: constants.mainTextWhite),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ======================== MIS LOGO ======================== //
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
