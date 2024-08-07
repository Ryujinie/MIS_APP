import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/dropdown_items.dart';
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/admin_viewticket_modal.dart';
import 'package:ssi_mis_flutter/global/modals/discard_changes_modal.dart';

List files = [];

class AdminCreateTicketModal extends StatefulWidget {
  const AdminCreateTicketModal({super.key});

  @override
  State<AdminCreateTicketModal> createState() => _AdminCreateTicketModalState();
}

class _AdminCreateTicketModalState extends State<AdminCreateTicketModal> {
  String? selectedStatus;
  String? selectedAsignee;
  String? selectedDept;
  FilePickerResult? result;
  PlatformFile? file;

  int fileIndex = 0;
  bool isMax = false;

  @override
  Widget build(BuildContext context) {
    final TextStyle? heading = Theme.of(context)
        .textTheme
        .titleLarge
        ?.copyWith(color: constants.mainTextBlack, fontWeight: FontWeight.w500);
    final TextStyle? labelText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.lightGray,
              fontWeight: FontWeight.w400,
            );
    final TextStyle? bodyText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextBlack,
            );
    const TextStyle hintText = TextStyle(
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.w400,
        color: constants.lightGray);

    final TextStyle? buttonText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextWhite,
            );

    var width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 100, 24, 40),
      child: AlertDialog(
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================== Ticket ID =============================
                Column(
                  children: [
                    const SizedBox(height: 32),
                    Row(
                      children: [
                        const SizedBox(width: 48),
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
                  ],
                ),

                // // Close Button
                // CloseButton(
                //   onPressed: () async {
                //     int? action = await showDialog<int>(
                //         barrierDismissible: false,
                //         context: context,
                //         builder: (BuildContext context) {
                //           return const DiscardChanges(
                //               message: 'Are you sure you want to cancel?');
                //         });

                //     if (context.mounted && action == 1) {
                //       setState(() {
                //         files = [];
                //       });

                //       Navigator.pop(context);
                //     }
                //   },
                //   color: constants.adminBtn,
                // ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(
              color: constants.lightGray.withOpacity(0.3),
              indent: 48,
              endIndent: 48,
            )
          ],
        ),
        content: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 4, 48, 0),
              child: Column(
                children: [
                  // ========================== Ticket Details Row ==========================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================ Emp Name, Subject, Dept Column =================
                      Expanded(
                        child: Column(
                          children: [
                            // ================= Emp Name Row ==================
                            Row(
                              children: [
                                //Employee Name
                                Text(
                                  "Employee Name:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 20),

                                //Emp Name Field
                                const InputContainer(),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================= Subject Row =================
                            Row(
                              children: [
                                //Subject
                                Text(
                                  "Subject:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 77),

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

                                const SizedBox(width: 48),

                                //Department Field
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: constants.lightGray
                                            .withOpacity(0.2),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(12),
                                        )),
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
                                          "select department",
                                          style: hintText,
                                        ),
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          isDense: true,
                                          contentPadding: EdgeInsets.symmetric(
                                            vertical: 6,
                                          ),
                                        ),
                                        value: selectedDept,
                                        items: departments,
                                        onChanged: (String? newValue) {
                                          selectedDept = newValue!;
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

                      const SizedBox(width: 120),

                      // =================== Asignee, Status Column ===================
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

                                //Asignee Dropdown
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    padding:
                                        const EdgeInsets.fromLTRB(12, 2, 2, 2),
                                    decoration: BoxDecoration(
                                      color:
                                          constants.lightGray.withOpacity(0.2),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    child: DropdownButtonFormField(
                                      style: bodyText,
                                      borderRadius: BorderRadius.circular(8),
                                      isDense: true,
                                      focusColor: Colors.transparent,
                                      autofocus: false,
                                      alignment:
                                          AlignmentDirectional.centerStart,
                                      hint: const Text(
                                        "select asignee",
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
                                        selectedAsignee = newValue ?? "";
                                      },
                                    ),
                                  ),
                                ),

                                // spacer
                                const SizedBox(width: 70),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ========== Status Row ===========
                            Row(
                              children: [
                                //Status
                                Text(
                                  "Status:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 24),

                                // Status Field
                                Expanded(
                                  child: Container(
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color:
                                          constants.statusGray.withOpacity(0.6),
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(12),
                                      ),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16, vertical: 4),
                                    child: Text(
                                      "Open",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                              color: constants.mainTextBlack,
                                              fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                ),

                                // spacer
                                const SizedBox(width: 70),
                              ],
                            ),
                          ],
                        ),
                      ),
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
                                minLines: 5,
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

        // ============================ Action Buttons ============================
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Cancel
              CustomElevatedButton(
                onPressed: () async {
                  int? action = await showDialog<int>(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const DiscardChanges(
                          message: 'Are you sure you want to cancel?',
                          user: 'admin',
                        );
                      });

                  if (context.mounted && action == 1) {
                    setState(() {
                      files = [];
                      // viewFiles = files;
                    });

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
                  viewFiles = files;
                  files = [];

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

class InputContainer extends StatelessWidget {
  const InputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 30,
        decoration: BoxDecoration(
          color: constants.lightGray.withOpacity(0.2),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            enabledBorder: InputBorder.none,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10, right: 10, bottom: 18),
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: constants.mainTextBlack,
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

List<DropdownMenuItem<String>> get statusDropDownItems {
  List<DropdownMenuItem<String>> menuItems = [
    const DropdownMenuItem(value: "in review", child: Text("In Review")),
    const DropdownMenuItem(value: "in progress", child: Text("In Progress")),
    const DropdownMenuItem(value: "processing", child: Text("Processing")),
    const DropdownMenuItem(value: "closed", child: Text("Closed")),
  ];
  return menuItems;
}

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
