import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:file_picker/file_picker.dart';

class EmployeeCreateTicketModal extends StatelessWidget {
  const EmployeeCreateTicketModal({super.key});

  @override
  Widget build(BuildContext context) {
    return createTicket(context);
  }
}

createTicket(BuildContext context) {
  // String? selectedStatus;
  // String? selectedAsignee;
  showDialog(
    context: context,
    builder: (BuildContext context) {
      final TextStyle? heading = Theme.of(context)
          .textTheme
          .titleLarge
          ?.copyWith(
              color: constants.mainTextBlack, fontWeight: FontWeight.w500);
      final TextStyle? labelText = Theme.of(context)
          .textTheme
          .bodyLarge
          ?.copyWith(color: constants.mainTextBlack, fontSize: 16);
      // final TextStyle? bodyText = Theme.of(context)
      //     .textTheme
      //     .bodyMedium
      //     ?.copyWith(color: constants.mainTextBlack);
      const TextStyle hintText = TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.w400,
          color: constants.lightGray);
      var width = MediaQuery.of(context).size.width;
      return Padding(
        padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
        child: AlertDialog(
          content: SizedBox(
            width: width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(48, 36, 48, 12),
                child: Column(
                  children: [
                    // =========================== Ticket ID =============================
                    Row(
                      children: [
                        //Ticket ID
                        Text(
                          "Ticket ID:",
                          style: heading,
                        ),
                        const SizedBox(width: 12),

                        //Ticket ID Field
                        Text(
                          "23874",
                          style: heading,
                        ),
                      ],
                    ),

                    const SizedBox(height: 18),

                    // ========================== Ticket Details Row ==========================
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ================ Emp Name, Subject, Dept Column =================
                        Expanded(
                          child: Column(
                            children: [
                              // ================= Emp Name Row ==================
                              // Row(
                              //   children: [
                              //     //Employee Name
                              //     Text(
                              //       "Employee Name:",
                              //       style: labelText,
                              //     ),

                              //     const SizedBox(width: 12),

                              //     //Emp Name Field
                              //     const InputContainer(),
                              //   ],
                              // ),

                              const SizedBox(height: 12),

                              // ================= Subject Row =================
                              Row(
                                children: [
                                  //Subject
                                  Text(
                                    "Subject:",
                                    style: labelText,
                                  ),

                                  const SizedBox(width: 79),

                                  //Subject Field
                                  const InputContainer(),
                                ],
                              ),

                              const SizedBox(height: 12),

                              // ================== Dept Row ==================
                              Row(
                                children: [
                                  //Department
                                  Text(
                                    "Department:",
                                    style: labelText,
                                  ),

                                  const SizedBox(width: 45),

                                  //Department Field
                                  const InputContainer(),
                                ],
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 24),

                        // =================== Asignee, Status Column ===================
                        // Expanded(
                        //   child: Column(
                        //     children: [
                        //       // ================ Asignee Row ================
                        //       Row(
                        //         children: [
                        //           //Asignee
                        //           Text(
                        //             "Asignee:",
                        //             style: labelText,
                        //           ),

                        //           const SizedBox(width: 12),

                        //           //Asignee Dropdown
                        //           Expanded(
                        //             child: Container(
                        //               height: 30,
                        //               padding: const EdgeInsets.fromLTRB(
                        //                   12, 2, 2, 2),
                        //               decoration: BoxDecoration(
                        //                 color: constants.lightGray
                        //                     .withOpacity(0.2),
                        //                 borderRadius: const BorderRadius.all(
                        //                   Radius.circular(12),
                        //                 ),
                        //               ),
                        //               child: DropdownButtonHideUnderline(
                        //                 child: DropdownButton(
                        //                   style: bodyText,
                        //                   borderRadius:
                        //                       BorderRadius.circular(8),
                        //                   isDense: true,
                        //                   focusColor: Colors.transparent,
                        //                   autofocus: false,
                        //                   alignment:
                        //                       AlignmentDirectional.centerStart,
                        //                   hint: const Text(
                        //                     "select asignee",
                        //                     style: hintText,
                        //                   ),
                        //                   value: selectedAsignee,
                        //                   items: asigneeDropDownItems,
                        //                   onChanged: (String? newValue) {
                        //                     selectedAsignee = newValue ?? "";
                        //                   },
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),

                        //       const SizedBox(height: 12),

                        //       // ========== Status Row ===========
                        //       Row(
                        //         children: [
                        //           //Status
                        //           Text(
                        //             "Status:",
                        //             style: Theme.of(context)
                        //                 .textTheme
                        //                 .bodyLarge
                        //                 ?.copyWith(
                        //                     color: constants.mainTextBlack,
                        //                     fontSize: 16),
                        //           ),

                        //           const SizedBox(width: 24),

                        //           // ============== Status Dropdown ==============
                        //           Expanded(
                        //             child: Container(
                        //               height: 30,
                        //               decoration: BoxDecoration(
                        //                   color: constants.lightGray
                        //                       .withOpacity(0.2),
                        //                   borderRadius: const BorderRadius.all(
                        //                     Radius.circular(12),
                        //                   )),
                        //               child: Padding(
                        //                 padding: const EdgeInsets.fromLTRB(
                        //                     12, 2, 2, 2),
                        //                 child: DropdownButtonHideUnderline(
                        //                   child: DropdownButton(
                        //                     style: bodyText,
                        //                     borderRadius:
                        //                         BorderRadius.circular(8),
                        //                     isDense: true,
                        //                     focusColor: Colors.transparent,
                        //                     autofocus: false,
                        //                     alignment: AlignmentDirectional
                        //                         .centerStart,
                        //                     hint: const Text(
                        //                       "select status",
                        //                       style: hintText,
                        //                     ),
                        //                     value: selectedStatus,
                        //                     items: statusDropDownItems,
                        //                     onChanged: (String? newValue) {
                        //                       selectedStatus = newValue!;
                        //                     },
                        //                   ),
                        //                 ),
                        //               ),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // ======================== Message =========================
                    Row(
                      children: [
                        Text(
                          "Message:",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Container(
                      height: 150,
                      padding: const EdgeInsets.only(left: 18),
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15),
                        ),
                        color: constants.lightGray.withOpacity(0.2),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ============== TextForm Field =============
                          Expanded(
                            child: SingleChildScrollView(
                              child: SizedBox(
                                child: TextFormField(
                                  keyboardType: TextInputType.multiline,
                                  maxLines: null,
                                  minLines: 1,
                                  decoration: const InputDecoration(
                                    hintText: 'type here...',
                                    hintStyle: hintText,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 14),
                                    enabledBorder: InputBorder.none,
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // ============== Divider =============
                          VerticalDivider(
                            width: 5,
                            thickness: 1,
                            indent: 5,
                            endIndent: 5,
                            color: constants.lightGray.withOpacity(0.2),
                          ),

                          // ============== Attachment Button =============
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AttachmentButton(
                                onPressed: () async {
                                  // ignore: unused_local_variable
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: ['jpg', 'pdf', 'doc'],
                                  );
                                  //print("Attached File: $result");
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ============================ Action Buttons ============================
          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: constants.adminBtn,
                  label: const Text(
                    "Cancel",
                    style: TextStyle(
                      color: constants.mainTextWhite,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  borderRadius: 20,
                ),
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
      );
    },
  );
}

class InputContainer extends StatelessWidget {
  const InputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 200,
      decoration: BoxDecoration(
        color: constants.lightGray.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 8),
          child: TextFormField(
            decoration: const InputDecoration(
              enabledBorder: InputBorder.none,
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
