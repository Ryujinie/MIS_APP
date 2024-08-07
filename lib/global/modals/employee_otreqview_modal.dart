// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
// import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';

class ViewOTRequest extends StatefulWidget {
  const ViewOTRequest({super.key});

  @override
  State<ViewOTRequest> createState() => ViewOTRequestState();
}

class ViewOTRequestState extends State<ViewOTRequest> {
  String selectedStatus = 'for approval';

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
                      // title: const Text(
                      //   "Select a Department",
                      //   textAlign: TextAlign.center,
                      // ),
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

                            // ================= Employee Name =================
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
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
                                  const SizedBox(width: 12),
                                  // ================== Employee Name Input ==============
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                                    child: Text(
                                      "Dan Ombao",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== Department ====================

                                  const SizedBox(width: 80),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Department:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                        ),
                                      ),
                                      const SizedBox(width: 22),
                                      Text(
                                        "IT",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // ============== Hours ==================
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  const SizedBox(width: 87),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 30, 2),
                                    child: Text(
                                      "1.5 hrs",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== Status ====================
                                  const SizedBox(width: 109),
                                  const Row(
                                    children: [
                                      Text(
                                        "Status:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                        ),
                                      ),
                                      SizedBox(
                                          width:
                                              50), // Adjust spacing as needed
                                      PillContainer(
                                          color: constants.statusOrange,
                                          width: 150,
                                          label: "For Final Approval",
                                          labelColor: constants.mainTextWhite)
                                      // Container(
                                      //   width:
                                      //       180, // Fixed width for the dropdown
                                      //   height:
                                      //       26, // Height for better touch targets
                                      //   decoration: BoxDecoration(
                                      //     color: constants.statusBlue,
                                      //     borderRadius:
                                      //         BorderRadius.circular(50),
                                      //   ),
                                      //   child: DropdownButtonHideUnderline(
                                      //     child: Padding(
                                      //       padding: const EdgeInsets.fromLTRB(
                                      //           46, 0, 0, 0),
                                      //       child: DropdownButton<String>(
                                      //         style: const TextStyle(
                                      //           color: Colors.white,
                                      //           fontWeight: FontWeight.w600,
                                      //         ),
                                      //         value:
                                      //             selectedStatus, // Ensure this is initialized correctly
                                      //         isExpanded: true,
                                      //         icon: const Icon(
                                      //             Icons.arrow_drop_down,
                                      //             color: Colors.white),
                                      //         iconSize: 24,
                                      //         dropdownColor:
                                      //             constants.statusBlue,
                                      //         items: statusDropDownItems,
                                      //         onChanged: (
                                      //           String? newValue,
                                      //         ) {
                                      //           // setState(() {
                                      //           //   selectedStatus = newValue!;
                                      //           // });
                                      //         },
                                      //       ),
                                      //     ),
                                      //   ),
                                      // ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // ================== From ====================
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 14, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  const SizedBox(width: 90),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 20, 2),
                                    child: Text(
                                      "04/08/2024",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== Start Time ====================
                                  const SizedBox(width: 82),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Start Time:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                        ),
                                      ),
                                      const SizedBox(width: 37),
                                      Text(
                                        "12:00 PM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            // ================= To =================
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 14, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
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
                                  const SizedBox(width: 110),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 20, 2),
                                    child: Text(
                                      "04/09/2024",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== End Time ====================
                                  const SizedBox(width: 82),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "End Time:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                        ),
                                      ),
                                      const SizedBox(width: 43),
                                      Text(
                                        "11:00 PM",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
                                          maxHeight:
                                              78, // Set the maximum height for remarks fields
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
                                const SizedBox(
                                    width:
                                        10), // Optional spacer for visual separation
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

                      // ============================ Action Buttons ============================
                      // actions: <Widget>[
                      //   Row(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       CustomElevatedButton(
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //         },
                      //         color: constants.adminBtn,
                      //         label: const Text(
                      //           "Cancel",
                      //           style: TextStyle(
                      //             color: constants.mainTextWhite,
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //         ),
                      //         borderRadius: 20,
                      //       ),
                      //       const SizedBox(width: 24),
                      //       CustomElevatedButton(
                      //         onPressed: () {
                      //           Navigator.of(context).pop();
                      //         },
                      //         color: constants.adminBtnGreen,
                      //         label: const Text(
                      //           "Save",
                      //           style: TextStyle(
                      //             color: constants.mainTextWhite,
                      //             fontWeight: FontWeight.w400,
                      //           ),
                      //         ),
                      //         borderRadius: 20,
                      //       ),
                      //     ],
                      //   ),
                      // ],
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
