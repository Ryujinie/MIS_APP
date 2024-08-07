// ignore_for_file: library_prefixes, prefer_const_declarations, avoid_print, unused_local_variable
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/emp_management_screen/database/employee_data.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:open_file/open_file.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';

//Capture GlobalKey
final GlobalKey _repaintBoundaryKey = GlobalKey();
//Sample profile photo
const String profileImagePath = 'assets/images/profile_sample.png';
//Attendance variable - Andrea
String selectedValue = "id";

//Capture & Generate PDF Function
Future<void> captureAndGeneratePdf() async {
  try {
    await Future.delayed(const Duration(milliseconds: 1000));
    final boundary = _repaintBoundaryKey.currentContext?.findRenderObject()
        as RenderRepaintBoundary?;
    if (boundary != null) {
      final pixelRatio = 4.0;
      final image = await boundary.toImage(pixelRatio: pixelRatio);
      final byteData = await image.toByteData(format: ImageByteFormat.png);
      if (byteData != null) {
        final buffer = byteData.buffer;
        final imageBytes = buffer.asUint8List();
        final documentsPath = await getDocumentsPath();
        if (documentsPath != null && documentsPath.isNotEmpty) {
          final pdfFile = File('$documentsPath/manager_emp.pdf');
          await compute(
              convertImageToPdf
                  as ComputeCallback<Map<String, Object>, dynamic>,
              {'imageBytes': imageBytes, 'pdfFilePath': pdfFile.path});

          print('PDF saved to $documentsPath/manager_emp.pdf');
        } else {
          print('Failed to get documents path');
        }
      } else {
        print('Failed to convert image to byte data');
      }
    } else {
      print('Failed to get boundary');
    }
  } catch (e) {
    print('Error capturing image and generating PDF: $e');
  }
}

//Convert PNG to PDF Function
Future<void> convertImageToPdf(Map<String, Object> arguments) async {
  final imageBytes = arguments['imageBytes'] as Uint8List;
  final pdfFilePath = arguments['pdfFilePath'] as String;
  final pdfFile = File(pdfFilePath);
  try {
    final pdf = pdfWidgets.Document();
    pdf.addPage(
      pdfWidgets.Page(
        margin: pdfWidgets.EdgeInsets.zero,
        build: (pdfWidgets.Context context) {
          return pdfWidgets.Image(pdfWidgets.MemoryImage(imageBytes));
        },
      ),
    );
    await pdfFile.writeAsBytes(await pdf.save());
  } catch (e) {
    print('Error converting image to PDF: $e');
  }
}

//Get Windows Documents Folder path Function
Future<String?> getDocumentsPath() async {
  try {
    final PathProviderWindows provider = PathProviderWindows();
    final String? documentsPath = await provider.getApplicationDocumentsPath();
    return documentsPath;
  } catch (e) {
    print('Error getting documents path: $e');
    return null;
  }
}

//Print Details output - Admin Profile Tab
class PrintManagerEmpMngmt extends StatefulWidget {
  const PrintManagerEmpMngmt({super.key});

  @override
  State<PrintManagerEmpMngmt> createState() => _PrintManagerEmpMngmtState();
}

class _PrintManagerEmpMngmtState extends State<PrintManagerEmpMngmt> {
  bool _isPdfCreated = false;
  bool _isLoading = false;

  // Save as PDF button handler
  void _onSaveButtonPressed() async {
    setState(() {
      _isLoading = true;
    });

    await captureAndGeneratePdf();

    setState(() {
      _isLoading = false;
      _isPdfCreated = true;
    });
  }

  //Open PDF button code
  void _onOpenButtonPressed() async {
    final documentsPath = await getDocumentsPath();
    OpenFile.open('$documentsPath/manager_emp.pdf');
  }

  @override
  Widget build(BuildContext context) {
    const double widthInches = 8.27;
    const double heightInches = 11.69;
    // ignore: deprecated_member_use
    final double dpi = ui.window.devicePixelRatio * 160.0;
    const double zoom = 0.7;
    final double widthPixels = widthInches * dpi * zoom;
    final double heightPixels = heightInches * dpi * zoom;

    final TextStyle? headingStyle =
        Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
    final TextStyle? headingStyle2 =
        Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );
    final TextStyle? headingStyleWhite =
        Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: constants.mainTextWhite,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            );
    final TextStyle? labelStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            );
    final TextStyle? textStyle =
        Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: constants.mainTextGrey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            );
    final TextStyle? bodyText = Theme.of(context)
        .textTheme
        .bodyMedium
        ?.copyWith(color: constants.mainTextBlack);

    final TextStyle? heading = Theme.of(context)
        .textTheme
        .titleMedium
        ?.copyWith(color: constants.mainTextBlack);

    return AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: constants.adminBtn,
                  iconSize: 25,
                ),
              ],
            ),
            const SizedBox(height: 10),
            RepaintBoundary(
              key: _repaintBoundaryKey,
              child: Container(
                height: heightPixels,
                width: widthPixels,
                decoration: BoxDecoration(
                  color: constants.adminFilter.withOpacity(0.8),
                  border: Border.all(
                    color: constants.mainTextGrey,
                    width: 0.5,
                  ),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        height: 120,
                        width: double.infinity,
                        decoration:
                            const BoxDecoration(color: constants.mngrPrimary),
                        child: Row(
                          children: [
                            const SizedBox(width: 30),
                            SizedBox(
                              height: 68.47,
                              width: 120,
                              child: Image.asset(
                                  'assets/images/mis_logo_manager.png'),
                            ),
                            const Spacer(),
                            Text(
                              'Employee Management Report',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextBlack,
                                    fontSize: 35,
                                    fontWeight: FontWeight.w400,
                                  ),
                            ),
                            const SizedBox(width: 30),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          'Employee Management Report',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: constants.mainTextBlack,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                      const Center(
                        child: Divider(
                          thickness: 1.0,
                          indent: 150,
                          endIndent: 160,
                          color: constants.mainTextBlack,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'This is the Employee report for:',
                            style: bodyText,
                          ),
                          const SizedBox(width: 10),
                          const AdminPrintDatePicker(),
                          const SizedBox(width: 10),
                          const AdminPrintDatePicker(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Center(
                        child: Text(
                          'Gracie A. Gates',
                          style:
                              Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: constants.mainTextBlack,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w400,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // ============================ Data Table ==============================
                            DataTable(
                              // ================ Data Columns ================ //
                              columns: [
                                // ID
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'ID No.',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Emp Name
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Employee Name',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Position
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Position',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Department
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Department',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelLarge
                                            ?.copyWith(
                                              color: constants.mainTextBlack,
                                              fontSize: 14,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),

                                // Action
                                // DataColumn(
                                //   label: Flexible(
                                //     child: Center(
                                //       child: Text(
                                //         'Action',
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .labelLarge
                                //             ?.copyWith(
                                //               color: constants.mainTextBlack,
                                //               fontSize: 14,
                                //             ),
                                //       ),
                                //     ),
                                //   ),
                                // ),
                              ],

                              // ================ Data Rows ================ //
                              rows: employeeData.map(
                                (employeeData) {
                                  return DataRow(
                                    cells: [
                                      // ID
                                      DataCell(
                                        Center(
                                          child: Text(
                                            employeeData.id,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                      ),

                                      // Name
                                      DataCell(
                                        Center(
                                          child: Text(
                                            employeeData.name,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                      ),

                                      // Position
                                      DataCell(
                                        Center(
                                          child: Text(
                                            employeeData.position,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                      ),

                                      // Department
                                      DataCell(
                                        Center(
                                          child: Text(
                                            employeeData.department,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall
                                                ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                      ),

                                      // Action Buttons
                                      // DataCell(
                                      //   Row(
                                      //     mainAxisAlignment:
                                      //         MainAxisAlignment.center,
                                      //     children: [
                                      //       AdminEmpMngmtProfileButton(
                                      //         onPressed: () {
                                      //           final indexProvider =
                                      //               Provider.of<IndexProvider>(
                                      //                   context,
                                      //                   listen: false);
                                      //           indexProvider
                                      //               .setProfileAdminEmpMngmtIndex(
                                      //                   1);
                                      //         },
                                      //         icon: const Icon(Icons.visibility),
                                      //         color: constants.lightGray,
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                    ],
                                  );
                                },
                              ).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            // Save as PDF button
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isLoading
                    ? Container(
                        width: 165,
                        height: 32,
                        decoration: BoxDecoration(
                          color: constants.mainTextGrey,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 20.0),
                            const SizedBox(
                              width: 16,
                              height: 16,
                              child: CircularProgressIndicator(
                                color: constants.mainTextWhite,
                                strokeWidth: 3,
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Text(
                              ' Loading',
                              style: headingStyleWhite,
                            ),
                          ],
                        ),
                      )
                    : !_isPdfCreated
                        ? CustomElevatedButton(
                            onPressed: _onSaveButtonPressed,
                            color: constants.mainTextGrey,
                            label: Column(
                              children: [
                                const SizedBox(height: 2.5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.picture_as_pdf_rounded,
                                      color: constants.mainTextWhite,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      ' Save as PDF',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: constants.mainTextWhite,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2.5),
                              ],
                            ),
                            borderRadius: 20,
                          )
                        : CustomElevatedButton(
                            onPressed: _onOpenButtonPressed,
                            color: constants.mngrPrimary,
                            label: Column(
                              children: [
                                const SizedBox(height: 2.5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.open_in_new,
                                      color: constants.mainTextBlack,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      'Open PDF file',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(
                                            color: constants.mainTextBlack,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 2.5),
                              ],
                            ),
                            borderRadius: 20,
                          ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
