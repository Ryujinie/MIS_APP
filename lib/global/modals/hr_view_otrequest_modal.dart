// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
// import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';

class HRViewOTRequest extends StatefulWidget {
  const HRViewOTRequest({super.key});

  @override
  State<HRViewOTRequest> createState() => ViewOTRequestState();
}

class ViewOTRequestState extends State<HRViewOTRequest> {
  String selectedStatus = 'For Approval';

  @override
  Widget build(BuildContext context) {
    return ViewButton(
        onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                var width = MediaQuery.of(context).size.width;
                return SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
                    child: AlertDialog(
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: constants.mainTextBlack),
                      contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
                      content: SizedBox(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // ====================== Overtime Request Form  ======================

                            Row(
                              children: [
                                Text(
                                  "Overtime Request Form",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                          color: constants.mainTextBlack,
                                          fontWeight: FontWeight.w500),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CloseButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      color: constants.adminBtn,
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 3),

                            Row(
                              children: [
                                Text(
                                  "Request ID:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 131, 131, 131),
                                          fontSize: 16),
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  "EMP 001",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: constants.mainTextBlack,
                                          fontSize: 16),
                                ),
                              ],
                            ),

                            const Padding(
                              padding: EdgeInsets.only(top: 12, bottom: 12),
                              child: Divider(
                                color: constants.darkGray,
                                thickness: 0.5,
                              ),
                            ),

                            // ============================ Schedule Details ============================
                            Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  Text(
                                    "Overtime Request Details:",
                                    textAlign: TextAlign.start,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium
                                        ?.copyWith(
                                          color: constants.mainTextBlack,
                                        ),
                                  ),
                                ],
                              ),
                            ),

                            // ================= Employee Name, Hours, From, To =================
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Employee Name:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 131, 131, 131),
                                            fontWeight: FontWeight.w400,
                                          ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Hours:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 131, 131, 131),
                                              fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "From:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 131, 131, 131),
                                              fontWeight: FontWeight.w400),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "To:",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: const Color.fromARGB(
                                                  255, 131, 131, 131),
                                              fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                // ================= Fields =================
                                const SizedBox(width: 32),
                                // Employee Name
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Dan Ombao",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // Hours
                                    Text(
                                      "1.5 hrs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // From
                                    Text(
                                      "04/08/2024",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    // To
                                    Text(
                                      "04/09/2024",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 280),
                                // ================= Department, Status, Start Time, End Time=================
                                const Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Department:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Status:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "Start Time:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      "End Time:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  width: 32,
                                ),
                                // ================= Fields =================
                                // Department
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "IT",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Status
                                    Container(
                                      width:
                                          180, // Fixed width for the container
                                      height:
                                          26, // Height for better touch targets
                                      decoration: BoxDecoration(
                                        color: constants.statusBlue,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Center(
                                        child: Text(
                                          selectedStatus, // Ensure this is initialized correctly
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // Start Time
                                    const Text(
                                      "12:00 PM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    // End Time
                                    const Text(
                                      "11:00 PM",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                )
                              ],
                            ),

                            const SizedBox(height: 30),

                            // ============================= Reason =============================
                            Row(
                              children: [
                                Text(
                                  "Reason:",
                                  textAlign: TextAlign.start,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                        color: constants.mainTextBlack,
                                      ),
                                ),
                              ],
                            ),

                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(15)),
                                  color: constants.lightGray.withOpacity(0.2),
                                  //border: Border.all(color: constants.lightGray)
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(9),
                                  child: SingleChildScrollView(
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                            textAlign: TextAlign.justify,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 6,
                                        ),
                                        //AttachmentButton(), //add onpressed
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),

                            // ============================= Remarks/Notes =============================
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Supervisor Remarks:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                      ConstrainedBox(
                                        constraints: const BoxConstraints(
                                          maxHeight: 78,
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: constants.lightGray
                                                .withOpacity(0.2),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(9),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Manager Remarks:",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                            ),
                                      ),
                                      ConstrainedBox(
                                        constraints:
                                            const BoxConstraints(maxHeight: 78),
                                        child: Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: constants.lightGray
                                                .withOpacity(0.2),
                                          ),
                                          child: const Padding(
                                            padding: EdgeInsets.all(9),
                                            child: SingleChildScrollView(
                                              child: Text(
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                                textAlign: TextAlign.justify,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ));
  }
}

// ========================== Dropdown Menu ==========================
List<DropdownMenuItem<String>> get statusDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "for approval", child: Text("For Approval")),
    const DropdownMenuItem(
        value: "for final approval", child: Text("For Final Approval")),
    const DropdownMenuItem(value: "approved", child: Text("Approved")),
    const DropdownMenuItem(value: "declined", child: Text("Declined")),
  ];
  return menuItems;
}
