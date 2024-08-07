import 'dart:io';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/global/modals/discard_changes_modal.dart';

List viewFiles = [];

class ViewTicket extends StatefulWidget {
  const ViewTicket({super.key});

  @override
  State<ViewTicket> createState() => _ViewTicketState();
}

class _ViewTicketState extends State<ViewTicket> {
  String? selectedStatus = 'in progress';
  String? selectedAsignee = 'ryujin';
  String? message =
      'Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before the final copy is available.';

  @override
  Widget build(BuildContext context) {
    // final TextStyle? heading = Theme.of(context)
    //     .textTheme
    //     .titleLarge
    //     ?.copyWith(color: constants.mainTextBlack, fontWeight: FontWeight.w500);
    final TextStyle? labelText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.lightGray,
              fontWeight: FontWeight.w400,
            );
    final TextStyle? bodyText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextBlack,
              fontWeight: FontWeight.w500,
            );
    const TextStyle hintText = TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: constants.lightGray);
    var width = MediaQuery.of(context).size.width;

    final TextStyle? buttonText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextWhite,
            );

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 40),
      child: AlertDialog(
        // title: Column(
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       //crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         // =========================== Ticket ID =============================
        //         // Column(
        //         //   children: [
        //         //     const SizedBox(height: 32),
        //         //     Row(
        //         //       children: [
        //         //         const SizedBox(width: 48),
        //         //         //Ticket ID
        //         //         Text(
        //         //           "Ticket ID:",
        //         //           style: heading,
        //         //         ),
        //         //         const SizedBox(width: 12),

        //         //         //Ticket ID Field
        //         //         Text(
        //         //           "23874",
        //         //           style: heading,
        //         //         ),
        //         //       ],
        //         //     ),
        //         //   ],
        //         // ),

        //         // Close Button
        //         CloseButton(
        // onPressed: () async {
        //   int? action = await showDialog<int>(
        //       barrierDismissible: false,
        //       context: context,
        //       builder: (BuildContext context) {
        //         return const DiscardChanges(
        //           message:
        //               "Are you sure you want to discard changes?",
        //         );
        //       });

        //   if (context.mounted && action == 1) {
        //     Navigator.pop(context);
        //   }
        // },
        //           color: constants.adminBtn,
        //         ),
        //       ],
        //     ),
        //     // const SizedBox(height: 12),
        //     // Divider(
        //     //   color: constants.lightGray.withOpacity(0.3),
        //     //   indent: 48,
        //     //   endIndent: 48,
        //     // )
        //   ],
        // ),
        // titlePadding: const EdgeInsets.only(top: 14, right: 20),

        content: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 36, 48, 0),
              child: Column(
                children: [
                  // ========================== Ticket Details Row ==========================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================= Emp Name, Subject Column ================
                      Expanded(
                        child: Column(
                          children: [
                            // =============== Emp Name Row ===============
                            Row(
                              children: [
                                //Employee Name
                                Text(
                                  "Employee Name:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 12),

                                //Emp Name Field
                                FieldContainer(
                                  child: Text(
                                    "Sasha White",
                                    style: bodyText,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // ================= Subject Row ================
                            Row(
                              children: [
                                //Subject
                                Text(
                                  "Subject:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 69),

                                //Subject Field
                                FieldContainer(
                                  child: Text(
                                    "Late Salary",
                                    style: bodyText,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 10),

                            // ================== Dept Row =================
                            Row(
                              children: [
                                //Department
                                Text(
                                  "Department:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 40),

                                //Department
                                FieldContainer(
                                  child: Text(
                                    "Accounting",
                                    style: bodyText,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      // ================= Asignee, Status Column ================
                      Expanded(
                        child: Column(
                          children: [
                            // ================ Asignee Row ================
                            Row(
                              children: [
                                //Asignee
                                Text(
                                  "Asignee:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 12),

                                // Assignee Dropdown
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color:
                                          constants.lightGray.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 2, 2, 2),
                                      child: DropdownButtonFormField(
                                        style: bodyText,
                                        borderRadius: BorderRadius.circular(8),
                                        isDense: true,
                                        focusColor: Colors.transparent,
                                        autofocus: false,
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        hint: const Text(
                                          "select assignee",
                                          style: hintText,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                        ),
                                        value: selectedAsignee,
                                        items: asigneeDropDownItems,
                                        onChanged: (String? newValue) {
                                          selectedAsignee = newValue!;
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                // spacer
                                const SizedBox(width: 180),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= Status Row ===================
                            Row(
                              children: [
                                //Status
                                Text(
                                  "Status:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 24),

                                //Status Dropdown
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: selectedStatus == 'open'
                                          ? constants.statusGray
                                              .withOpacity(0.6)
                                          : selectedStatus == 'in progress'
                                              ? constants.statusOrange
                                                  .withOpacity(0.9)
                                              : selectedStatus == 'processing'
                                                  ? constants.statusBlue
                                                      .withOpacity(0.8)
                                                  : selectedStatus == 'closed'
                                                      ? constants.statusGreen
                                                          .withOpacity(0.9)
                                                      : constants.lightGray
                                                          .withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          12, 2, 2, 2),
                                      child: DropdownButtonFormField(
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack,
                                                fontWeight: FontWeight.w500),
                                        isDense: true,
                                        focusColor: Colors.transparent,
                                        autofocus: false,
                                        alignment:
                                            AlignmentDirectional.centerStart,
                                        hint: const Text(
                                          "select status",
                                          style: hintText,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                        ),
                                        value: selectedStatus,
                                        items: statusDropDownItems,
                                        // items: status
                                        //     .map<DropdownMenuItem<String>>(
                                        //         (item) {
                                        //   return DropdownMenuItem<String>(
                                        //     value: item,
                                        //     child: Text(
                                        //       item.toString(),
                                        //       style: bodyText,
                                        //     ),
                                        //   );
                                        // }).toList(),
                                        // selectedItemBuilder: (BuildContext ctxt) {
                                        //   return status
                                        //       .map<DropdownMenuItem<String>>(
                                        //           (item) {
                                        //     return DropdownMenuItem<String>(
                                        //       value: item,
                                        //       child: Text(
                                        //         item.toString(),
                                        //         style: bodyText,
                                        //       ),
                                        //     );
                                        //   }).toList();
                                        // },
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            selectedStatus = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                ),

                                // spacer
                                const SizedBox(width: 180),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 36),

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
                    padding: const EdgeInsets.fromLTRB(18, 12, 0, 12),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(15),
                      ),
                      color: constants.lightGray.withOpacity(0.2),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ======================= TextForm Field =======================
                        Expanded(
                          child: SingleChildScrollView(
                            child: SizedBox(
                              child: Text(
                                message ?? " ",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: constants.mainTextBlack,
                                    ),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(width: 12),
                      ],
                    ),
                  ),

                  const SizedBox(height: 4),

                  // ========================== File Indicator ==========================
                  Row(
                    children: [
                      // attached Files
                      Row(
                        children: List.generate(viewFiles.length, (index) {
                          return viewFiles.isNotEmpty
                              ? Row(
                                  children: [
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
                                              final bytes = await File(
                                                      viewFiles[index].path)
                                                  .readAsBytes();

                                              final path =
                                                  await getDocumentsPath() ??
                                                      await getDownloadsPath();

                                              if (path != null &&
                                                  path.isNotEmpty) {
                                                final file = File(
                                                    '$path/${viewFiles[index].name}');
                                                await file.writeAsBytes(bytes);
                                              }

                                              // open file
                                              OpenFile.open(
                                                '$path/${viewFiles[index].name}',
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
                                                viewFiles[index]!
                                                    .name
                                                    .toString(),
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium
                                                    ?.copyWith(
                                                        color: constants
                                                            .adminFiles,
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
                    ],
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
                onPressed: () async {
                  int? action = await showDialog<int>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const DiscardChanges(
                          message: "Are you sure you want to discard changes?",
                          user: 'admin',
                        );
                      });

                  if (context.mounted && action == 1) {
                    Navigator.pop(context);
                  }
                },
                color: constants.adminCloseBtn,
                label: Text(
                  "Cancel",
                  style: buttonText,
                ),
                borderRadius: 20,
              ),
              const SizedBox(width: 24),

              // Save
              CustomElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: constants.adminBtn,
                label: Text(
                  "Save",
                  style: buttonText,
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

class FieldContainer extends StatelessWidget {
  final Widget child;
  const FieldContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: const BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 12),
            child: child,
          ),
        ),
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

// Future convertFileToImage(PlatformFile picture) async {
//   final File file = File(picture.path!);
//   final bytes = await file.readAsBytes();
//   List<int> image = file.readAsBytesSync();
//    imageLib.JpegDecoder

//   String imageAsString = imageLib.decodeJpg(imageBase64);
//   Uint8List uint8list = base64.decode(imageAsString);
//   Image image = Image.memory(uint8list);
//   return image;
// }

// ========================== Dropdown Menu ==========================
List<DropdownMenuItem<String>> get statusDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    //const DropdownMenuItem(value: "open", child: Text("Open")),
    const DropdownMenuItem(value: "open", child: Text("Open")),
    const DropdownMenuItem(value: "in progress", child: Text("In Progress")),
    const DropdownMenuItem(value: "processing", child: Text("Processing")),
    const DropdownMenuItem(value: "closed", child: Text("Closed")),
  ];
  return menuItems;
}

// List<String> status = ["in review", "in progress", "processing", "closed"];

List<DropdownMenuItem<String>> get asigneeDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "ryujin", child: Text("Ryujin")),
    const DropdownMenuItem(value: "yeji", child: Text("Yeji")),
    const DropdownMenuItem(value: "lia", child: Text("Lia")),
    const DropdownMenuItem(value: "yuna", child: Text("Yuna")),
    const DropdownMenuItem(value: "chaeryong", child: Text("Chaeryong")),
  ];
  return menuItems;
}
