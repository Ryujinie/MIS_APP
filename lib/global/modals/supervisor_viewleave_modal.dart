import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';

class SupervisorViewLeave extends StatefulWidget {
  const SupervisorViewLeave({super.key});

  @override
  State<SupervisorViewLeave> createState() => _SupervisorViewLeaveState();
}

class _SupervisorViewLeaveState extends State<SupervisorViewLeave> {
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
                    padding: const EdgeInsets.fromLTRB(24, 80, 24, 5),
                    child: AlertDialog(
                      titleTextStyle: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: constants.mainTextBlack),
                      contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 5),
                      content: SizedBox(
                        width: width,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            //
                            // ====================== Header ======================
                            Row(
                              children: [
                                Text(
                                  "Leave Request Form",
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
                                )
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
                                  "53789",
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

                            // ============================ Leave Details ============================
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  Text(
                                    "Leave Details:",
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

                            // ========== Emp Name ==========
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 5),
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
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                                    child: Text(
                                      "Dan Ombao",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== Department ==================
                                  const SizedBox(width: 280),
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

                            // ============= Leave Type ============
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 12, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Leave Type:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 131, 131, 131),
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 46),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 30, 2),
                                    child: Text(
                                      "Sick Leave",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),

                                  // ================== Status ====================
                                  const SizedBox(width: 280),
                                  Row(
                                    children: [
                                      const Text(
                                        "Status:",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                        ),
                                      ),
                                      const SizedBox(
                                          width:
                                              50), // Adjust spacing as needed
                                      Container(
                                        width:
                                            180, // Fixed width for the dropdown
                                        height:
                                            26, // Height for better touch targets
                                        decoration: BoxDecoration(
                                          color: constants.statusBlue,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                        ),
                                        child: DropdownButtonHideUnderline(
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                46, 0, 0, 0),
                                            child: DropdownButton<String>(
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              ),
                                              value:
                                                  selectedStatus, // Ensure this is initialized correctly
                                              isExpanded: true,
                                              icon: const Icon(
                                                  Icons.arrow_drop_down,
                                                  color: Colors.white),
                                              iconSize: 24,
                                              dropdownColor:
                                                  constants.statusBlue,
                                              items: statusDropDownItems,
                                              onChanged: (
                                                String? newValue,
                                              ) {
                                                setState(() {
                                                  selectedStatus = newValue!;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            //
                            // ================== Leave Start Date ===============
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 14, 5),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Leave Start Date:",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium
                                        ?.copyWith(
                                            color: const Color.fromARGB(
                                                255, 131, 131, 131),
                                            fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 12),
                                  const Padding(
                                    padding: EdgeInsets.fromLTRB(20, 4, 20, 2),
                                    child: Text(
                                      "04/08/2024",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  //
                                  // ============= Time Of Leave ===============
                                  const SizedBox(width: 280),
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
                                      const SizedBox(width: 42),
                                      Text(
                                        "-",
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

                            // ================= Leave End Date =================
                            Row(
                              children: [
                                Text(
                                  "Leave End Date:",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                          color: const Color.fromARGB(
                                              255, 131, 131, 131),
                                          fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(width: 16),
                                const Padding(
                                  padding: EdgeInsets.fromLTRB(20, 4, 22, 2),
                                  child: Text(
                                    "04/30/2024",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(width: 280),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text(
                                      "End Time:",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                      ),
                                    ),
                                    const SizedBox(width: 48),
                                    Text(
                                      "-",
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

                            const SizedBox(height: 10),

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

                            // ============================= Reason =============================
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
                                        constraints:
                                            const BoxConstraints(maxHeight: 78),
                                        child: Container(
                                          width: double.infinity,
                                          height: 78,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                const BorderRadius.all(
                                                    Radius.circular(15)),
                                            color: constants.lightGray
                                                .withOpacity(0.2),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(9),
                                            child: SingleChildScrollView(
                                              child: TextFormField(
                                                keyboardType:
                                                    TextInputType.multiline,
                                                maxLines: null,
                                                decoration:
                                                    const InputDecoration(
                                                  hintText: 'type here...',
                                                  hintStyle: TextStyle(
                                                    color: constants.lightGray,
                                                    fontWeight: FontWeight.w300,
                                                    fontStyle: FontStyle.italic,
                                                  ),
                                                  enabledBorder:
                                                      InputBorder.none,
                                                  border: InputBorder.none,
                                                  focusedBorder:
                                                      InputBorder.none,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
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
                                          height: 78,
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
                                                "Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
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
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                      actions: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(width: 24),
                            CustomElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: constants.adminBtnGreen,
                              label: const Text(
                                "Save",
                                style: TextStyle(
                                  color: constants.mainTextWhite,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              borderRadius: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ));
  }
}

List<DropdownMenuItem<String>> get statusDropDownItems {
  return const [
    DropdownMenuItem(value: "for approval", child: Text("For Approval")),
    DropdownMenuItem(
        value: "for final approval", child: Text("For Final Approval")),
    DropdownMenuItem(value: "approved", child: Text("Approved")),
    DropdownMenuItem(value: "declined", child: Text("Decline")),
  ];
}
