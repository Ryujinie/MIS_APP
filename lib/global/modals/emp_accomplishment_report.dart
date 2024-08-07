import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/modals/discard_changes_modal.dart';
import 'package:ssi_mis_flutter/global/modals/emp_timeout_modal.dart';
import 'package:ssi_mis_flutter/global/modals/emp_view_accomp_report.dart';

List files = [];

class AccomplishmentReport extends StatefulWidget {
  const AccomplishmentReport({super.key});

  @override
  State<AccomplishmentReport> createState() => _EmpAccomplishmentReportState();
}

class _EmpAccomplishmentReportState extends State<AccomplishmentReport> {
  bool isSubmitted = false;
  FilePickerResult? result;
  PlatformFile? file;
  int fileIndex = 0;
  bool isMax = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final TextStyle? label = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: constants.lightGray,
          fontWeight: FontWeight.w400,
        );

    final TextStyle? body = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: constants.mainTextBlack,
          fontWeight: FontWeight.w500,
        );

    final TextStyle? hintText = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.w400,
            color: constants.lightGray);

    return Padding(
      padding: const EdgeInsets.fromLTRB(48, 112, 48, 30),
      child: AlertDialog(
        // ================================ Title, Description, Close Btn Row ================================
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //
                const SizedBox(),

                // ===================== Title, Description Column =====================
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //
                    const SizedBox(height: 24),

                    // Title
                    Text(
                      "Accomplishment Report",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: constants.mainTextBlack,
                          fontWeight: FontWeight.w700),
                    ),
                    //
                    const SizedBox(height: 8),

                    // Description
                    Text(
                      'Please complete the form before timing out for the day',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: constants.mainTextBlack,
                          ),
                    ),
                  ],
                ),

                // Close Button
                CloseButton(
                  onPressed: () async {
                    int? action = await showDialog<int>(
                        barrierDismissible: false,
                        context: context,
                        builder: (BuildContext context) {
                          return const DiscardChanges(
                            message:
                                'Are you sure you want to discard changes?',
                            user: 'employee',
                          );
                        });

                    if (context.mounted && action == 1) {
                      setState(() {
                        isSubmitted = false;
                        files = [];
                        // viewFiles = files;
                      });

                      Navigator.pop(context, isSubmitted);
                    }
                  },
                  color: constants.adminBtn,
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Divider
            const Divider(
              color: constants.lightGray,
              thickness: 0.5,
              height: 1,
              indent: 60,
              endIndent: 60,
            ),
          ],
        ),
        //
        // contentPadding: const EdgeInsets.fromLTRB(60, 18, 60, 48),
        content: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(60, 12, 60, 48),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ========================== Date Row ==========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Date label
                      Text(
                        "Date:",
                        style: label,
                      ),

                      const SizedBox(width: 48),

                      // Date Field
                      Text(
                          DateFormat('MM/dd/yyyy')
                              .format(DateTime.now())
                              .toString(),
                          style: body),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ========================== Start time ==========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // Start time label
                      Text(
                        "Start Time:",
                        style: label,
                      ),

                      const SizedBox(width: 13),

                      // Start time field
                      Text(
                        "8:30 AM",
                        style: body,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ========================== End time ==========================
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // End time label
                      Text(
                        "End Time:",
                        style: label,
                      ),

                      const SizedBox(width: 20),

                      // End time field
                      Text(
                        "5:00 PM",
                        style: body,
                      ),
                    ],
                  ),

                  // // Employee Name and Date
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Employee Name:",
                  //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //             color: const Color.fromARGB(255, 131, 131, 131),
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //     ),
                  //     const SizedBox(width: 12),
                  //     const Padding(
                  //       padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                  //       child: Text(
                  //         "Dan Ombao",
                  //         style: TextStyle(fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 280),
                  //   ],
                  // ),

                  // Department and Start Time
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       "Department:",
                  //       style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //             color: const Color.fromARGB(
                  //               255,
                  //               131,
                  //               131,
                  //               131,
                  //             ),
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //     ),
                  //     const SizedBox(width: 43),
                  //     const Padding(
                  //       padding: EdgeInsets.fromLTRB(20, 4, 30, 4),
                  //       child: Text(
                  //         "Accounting",
                  //         style: TextStyle(fontWeight: FontWeight.w500),
                  //       ),
                  //     ),
                  //     const SizedBox(width: 270),

                  //   ],
                  // ),

                  // // Status and End Time
                  // Padding(
                  //   padding: const EdgeInsets.fromLTRB(0, 0, 14, 12),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Text(
                  //         "Status:",
                  //         style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  //             color: const Color.fromARGB(255, 131, 131, 131),
                  //             fontWeight: FontWeight.w400),
                  //       ),
                  //       const SizedBox(width: 85),
                  //       Container(
                  //         decoration: BoxDecoration(
                  //           borderRadius:
                  //               const BorderRadius.all(Radius.circular(50)),
                  //           color: constants.hrStatusPresent.withOpacity(0.9),
                  //         ),
                  //         child: const Padding(
                  //           padding:
                  //               EdgeInsets.symmetric(horizontal: 36, vertical: 4),
                  //           child: Text(
                  //             "Present",
                  //             style: TextStyle(color: Colors.white),
                  //           ),
                  //         ),
                  //       ),
                  //       const SizedBox(width: 271),
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           const Text("End Time:",
                  //               style: TextStyle(
                  //                   color: Color.fromARGB(255, 131, 131, 131),
                  //                   fontWeight: FontWeight.w400)),
                  //           const SizedBox(width: 20),
                  //           Text(
                  //             "5:00 PM",
                  //             style: Theme.of(context)
                  //                 .textTheme
                  //                 .bodyMedium
                  //                 ?.copyWith(
                  //                     color: constants.mainTextBlack,
                  //                     fontWeight: FontWeight.w500),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 30),

                  // Details Heading
                  Text(
                    "Details:",
                    textAlign: TextAlign.left,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: constants.mainTextBlack,
                        ),
                  ),

                  const SizedBox(height: 12),

                  // Details Description
                  Row(
                    children: [
                      Text(
                        "Please provide details of completed tasks or any encountered issues:",
                        textAlign: TextAlign.start,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
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
                                minLines: 6,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                    ),
                                decoration: InputDecoration(
                                  hintText: 'type here...',
                                  hintStyle: hintText,
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 2, vertical: 14),
                                  enabledBorder: InputBorder.none,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),

                        //  Divider
                        VerticalDivider(
                          width: 1,
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
                                if (fileIndex < 5) {
                                  // file picker
                                  result = await FilePicker.platform.pickFiles(
                                    type: FileType.custom,
                                    allowedExtensions: [
                                      'jpg',
                                      'pdf',
                                      'doc',
                                      'docx'
                                    ],
                                  );

                                  // add files to list
                                  if (result != null) {
                                    setState(() {
                                      files.add(result!.files.first);
                                      fileIndex++;
                                      //print(fileIndex);
                                    });
                                  }
                                } else {
                                  setState(() {
                                    isMax = true;
                                  });

                                  // Error Display Duration
                                  Future.delayed(const Duration(seconds: 5),
                                      () {
                                    if (mounted) {
                                      setState(() {
                                        isMax = false;
                                      });
                                    }
                                  });
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ========================== File Indicator ==========================
                  Row(
                    children: [
                      // attached files
                      Row(
                        children: List.generate(files.length, (index) {
                          return files.isNotEmpty
                              ? Row(
                                  children: [
                                    //
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(8),
                                        ),
                                        color: constants.lightGray
                                            .withOpacity(0.1),
                                      ),
                                      child: Row(
                                        children: [
                                          //file
                                          TextButton(
                                            onPressed: () async {
                                              // download file
                                              final bytes =
                                                  await File(files[index].path)
                                                      .readAsBytes();

                                              final path =
                                                  await getDocumentsPath() ??
                                                      await getDownloadsPath();

                                              if (path != null &&
                                                  path.isNotEmpty) {
                                                final file = File(
                                                    '$path/${files[index].name}');
                                                await file.writeAsBytes(bytes);
                                              }

                                              // open file
                                              OpenFile.open(
                                                '$path/${files[index].name}',
                                              );
                                            },
                                            style: ButtonStyle(
                                              padding: WidgetStateProperty.all(
                                                  EdgeInsets.zero),
                                              overlayColor:
                                                  const WidgetStatePropertyAll(
                                                      Colors.transparent),
                                            ),

                                            //filename
                                            child: ConstrainedBox(
                                              constraints: const BoxConstraints(
                                                  maxWidth: 100),
                                              child: Text(
                                                files[index]!.name.toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color:
                                                            constants.empFiles,
                                                        fontWeight:
                                                            FontWeight.w500),
                                              ),
                                            ),
                                          ),

                                          // //extension
                                          // Text(
                                          //   ".${files[index]!.extension.toString()}",
                                          // ),

                                          const SizedBox(width: 4),

                                          // remove icon
                                          IconButton(
                                            onPressed: () {
                                              setState(() {
                                                files.removeAt(index);
                                                fileIndex--;
                                                isMax = false;
                                              });
                                            },
                                            icon:
                                                const Icon(Icons.close_rounded),
                                            iconSize: 18,
                                            color: constants.darkGray,
                                            padding: EdgeInsets.zero,
                                            constraints: const BoxConstraints(
                                                maxHeight: 20, maxWidth: 20),
                                          ),

                                          //
                                        ],
                                      ),
                                    ),

                                    //
                                    const SizedBox(width: 6),
                                  ],
                                )
                              : const SizedBox();
                        }),
                      ),

                      // error text
                      isMax == true
                          ? Text(
                              'Max number of attachments reached',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: constants.errorText,
                                    fontStyle: FontStyle.italic,
                                  ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // // Cancel
              // CustomElevatedButton(
              //   onPressed: () {
              //     setState(() {
              //       isSubmitted = false;
              //     });
              //     Navigator.pop(context, isSubmitted);
              //   },
              //   color: constants.adminBtn,
              //   label: const Text(
              //     "Cancel",
              //     style: TextStyle(
              //       color: constants.mainTextWhite,
              //       fontWeight: FontWeight.w400,
              //     ),
              //   ),
              //   borderRadius: 20,
              // ),

              // const SizedBox(width: 24),

              // Submit
              CustomElevatedButton(
                onPressed: () async {
                  // Confirm Time Out
                  int? selectedAction = await showDialog<int>(
                    context: context, //fix
                    builder: (context) => const TimeOut(
                      user: 'employee',
                    ),
                  );

                  if (context.mounted && selectedAction == 1) {
                    setState(() {
                      isSubmitted = true;
                      viewEmpFiles = files;
                      files = [];
                    });
                    Navigator.pop(context, isSubmitted);
                  }
                },
                color: constants.empBtn,
                label: Text(
                  "Submit",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: constants.mainTextWhite,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                borderRadius: 20,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//Get Windows Documents Folder path Function
Future<String?> getDocumentsPath() async {
  try {
    final PathProviderWindows provider = PathProviderWindows();
    final String? documentsPath = await provider.getApplicationDocumentsPath();
    return documentsPath;
  } catch (e) {
    return null;
  }
}

//Get Windows Downloads Folder path Function
Future<String?> getDownloadsPath() async {
  try {
    final PathProviderWindows provider = PathProviderWindows();
    final String? downloadsPath = await provider.getDownloadsPath();
    return downloadsPath;
  } catch (e) {
    return null;
  }
}
