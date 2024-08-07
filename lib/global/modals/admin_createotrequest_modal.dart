import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/global/buttons/attachment_button.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/modals/discard_changes_modal.dart';
import 'admin_view_otrequest_modal.dart';

List files = [];

class AdminCreateOT extends StatefulWidget {
  const AdminCreateOT({super.key});

  @override
  State<AdminCreateOT> createState() => _AdminCreateOTState();
}

class _AdminCreateOTState extends State<AdminCreateOT> {
  String? selectedDepartment = 'Marketing';
  FilePickerResult? result;
  int fileIndex = 0;
  bool isMax = false;

  @override
  Widget build(BuildContext context) {
    Theme.of(context)
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
        title: const Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // =========================== Overtime Request Form =============================
              ],
            ),
          ],
        ),
        content: SizedBox(
          width: width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(48, 4, 48, 0),
              child: Column(
                children: [
                  // ====================== Department Selection ======================

                  Row(
                    children: [
                      Text(
                        "Overtime Request Form",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: constants.mainTextBlack,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),

                  const SizedBox(height: 3),

                  Row(
                    children: [
                      Text(
                        "Request ID:",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: constants.mainTextBlack, fontSize: 16),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "EMP 001",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: constants.mainTextBlack, fontSize: 16),
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
                    padding: const EdgeInsets.only(bottom: 3),
                    child: Row(
                      children: [
                        Text(
                          "Overtime Request Details:",
                          textAlign: TextAlign.start,
                          style:
                              Theme.of(context).textTheme.titleMedium?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // ========================== Overtime Request Details ==========================
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ================ Employee Name, From, To, Start Time Column =================
                      Expanded(
                        child: Column(
                          children: [
                            // ================= Employee Name Row ==================
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

                            // ================= From Row =================
                            Row(
                              children: [
                                //From
                                Text(
                                  "From:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 100),

                                //From Field
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.only(left: 52),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'select date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(width: 35),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: constants.lightGray
                                              .withOpacity(0.4),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 6, 8, 6),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: constants.mainTextBlack,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================== To Row ==================
                            Row(
                              children: [
                                //To
                                Text(
                                  "To:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 120),

                                //To Field
                                ElevatedButton(
                                  onPressed: () => _selectDate(context),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.only(left: 52),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'select date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(width: 35),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: constants.lightGray
                                              .withOpacity(0.4),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 6, 8, 6),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: constants.mainTextBlack,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ================== Start Time Row ==================
                            Row(
                              children: [
                                //Start Time
                                Text(
                                  "Start Time:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 65),

                                //Start Time Field
                                ElevatedButton(
                                  onPressed: () => _selectTime(context),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.only(left: 52),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'select time',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(width: 35),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: constants.lightGray
                                              .withOpacity(0.4),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 6, 8, 6),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: constants.mainTextBlack,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(width: 120),

                      // =================== Department, Status, End Time, Hours Column ===================
                      Expanded(
                        child: Column(
                          children: [
                            // ================ Department Row ================
                            Row(
                              children: [
                                //Department
                                Text(
                                  "Department:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 12),

                                //Department Dropdown
                                Container(
                                  height: 30,
                                  width:
                                      188, // Set a fixed width similar to 'select time' box
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  decoration: BoxDecoration(
                                    color: constants.lightGray.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: DropdownButtonFormField(
                                    style: bodyText,
                                    borderRadius: BorderRadius.circular(8),
                                    isDense: true,
                                    hint: const Text("select department",
                                        style: hintText),
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 6),
                                    ),
                                    value: selectedDepartment,
                                    items: departmentdropdownItems,
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedDepartment = newValue!;
                                      });
                                    },
                                  ),
                                )
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

                                const SizedBox(width: 56),

                                // Status Field
                                Container(
                                  height: 30,
                                  width:
                                      188, // Set a fixed width similar to 'select time' box
                                  decoration: BoxDecoration(
                                    color:
                                        constants.statusGray.withOpacity(0.6),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  child: Center(
                                    child: Text(
                                      "Open",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                )
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ========== End Time Row ===========
                            Row(
                              children: [
                                //End Time
                                Text(
                                  "End Time:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 35),

                                //End Time Field
                                ElevatedButton(
                                  onPressed: () => _selectTime(context),
                                  style: ElevatedButton.styleFrom(
                                    minimumSize: Size.zero,
                                    padding: const EdgeInsets.only(left: 52),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'select time',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                color: constants.lightGray,
                                                fontStyle: FontStyle.italic),
                                      ),
                                      const SizedBox(width: 35),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(8),
                                              bottomRight: Radius.circular(8)),
                                          color: constants.lightGray
                                              .withOpacity(0.4),
                                        ),
                                        child: const Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(8, 6, 8, 6),
                                          child: Icon(
                                            Icons.calendar_today_rounded,
                                            color: constants.mainTextBlack,
                                            size: 15,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            // ========== Hours Row ===========
                            Row(
                              children: [
                                //Hours
                                Text(
                                  "Hours:",
                                  style: labelText,
                                ),

                                const SizedBox(width: 58),

                                //Hours Field
                                const SizedBox(
                                  width: 185,
                                  child: TextField(
                                    keyboardType: TextInputType.multiline,
                                    style: TextStyle(
                                      fontSize:
                                          13, // Adjust the font size as needed
                                    ),
                                    decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.symmetric(vertical: 10),
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                        // Define the border with rounded corners
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.5),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(8.5),
                                        ),
                                        borderSide: BorderSide.none,
                                      ),
                                      fillColor:
                                          Color.fromARGB(255, 216, 212, 221),
                                      filled: true,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 24),

                  // ============================= Reason =============================
                  Row(
                    children: [
                      Text(
                        "Reason:",
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
                    height: 333,
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
                  viewOTFiles = files;
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

  // ========================== DateTime Picker ==========================
  Future<void> _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {}
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null && picked != selectedTime) {}
  }

  List<DropdownMenuItem<String>> get departmentdropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "All", child: Text("All")),
      const DropdownMenuItem(value: "Marketing", child: Text("Marketing")),
      const DropdownMenuItem(value: "Engineering", child: Text("Engineering")),
      const DropdownMenuItem(value: "HR", child: Text("HR")),
    ];
    return menuItems;
  }

  List<DropdownMenuItem<String>> get statusDropDownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(
          value: "for approval", child: Text("For Approval")),
      const DropdownMenuItem(
          value: "for final approval", child: Text("For Final Approval")),
      const DropdownMenuItem(value: "approved", child: Text("Approved")),
      const DropdownMenuItem(value: "declined", child: Text("Declined")),
    ];
    return menuItems;
  }

  TimeOfDay? selectedTime;
}

class InputContainer extends StatelessWidget {
  const InputContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 188,
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
