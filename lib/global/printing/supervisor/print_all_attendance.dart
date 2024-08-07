// ignore_for_file: library_prefixes, prefer_const_declarations, avoid_print, unused_local_variable
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/attendance_screen/admin_attendance_screen.dart';
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:open_file/open_file.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
//import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';

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
          final pdfFile = File('$documentsPath/supervisor_attendance.pdf');
          await compute(
              convertImageToPdf
                  as ComputeCallback<Map<String, Object>, dynamic>,
              {'imageBytes': imageBytes, 'pdfFilePath': pdfFile.path});

          print('PDF saved to $documentsPath/supervisor_attendance.pdf');
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
class SupervisorPrintAllAttendance extends StatefulWidget {
  const SupervisorPrintAllAttendance(
      {super.key, this.startDate, this.endDate, this.dept});

  final DateTime? startDate;
  final DateTime? endDate;
  final String? dept;

  @override
  State<SupervisorPrintAllAttendance> createState() =>
      _SupervisorPrintAllAttendanceState();
}

class _SupervisorPrintAllAttendanceState
    extends State<SupervisorPrintAllAttendance> {
  bool _isPdfCreated = false;
  bool _isLoading = false;
  List<Attendance> filteredList = [];
  DateTime? oldestDate;

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
    OpenFile.open('$documentsPath/supervisor_attendance.pdf');
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

    // ============= Department Filtering =============
    if (widget.startDate != null && widget.endDate != null) {
      if (widget.dept != 'All' && widget.dept != null) {
        setState(() {
          filteredList = attendanceRecord
              .where((record) => record.department.contains(widget.dept!))
              .toList();
          filteredList.sort((a, b) => b.date.compareTo(a.date));
        });
      } else if (widget.dept == 'All' && widget.dept != null) {
        setState(() {
          filteredList = attendanceRecord;
          filteredList.sort((a, b) => b.date.compareTo(a.date));
        });
      } else {
        setState(() {
          filteredList = [];
          // filteredList = attendanceRecord;
          // filteredList.sort((a, b) => b.date.compareTo(a.date));
        });
      }
    }
    // ============= Date Filtering =============

    // Start Date & End Date
    if (widget.startDate != null && widget.endDate != null) {
      List<Attendance> dateFilteredList = [];

      for (var record in filteredList) {
        if (record.date.isAtSameMomentAs(widget.startDate!) ||
            record.date.isAfter(widget.startDate!) &&
                record.date.isBefore(widget.endDate!) ||
            record.date.isAtSameMomentAs(widget.endDate!)) {
          dateFilteredList.add(record);
        }
      }

      setState(() {
        filteredList = dateFilteredList;
      });
    }

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
                  color: constants.hrBtn,
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
                  color: constants.hrFilter.withOpacity(0.8),
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
                            const BoxDecoration(color: constants.supervisorBtn),
                        child: Row(
                          children: [
                            const SizedBox(width: 30),
                            SizedBox(
                              height: 68.47,
                              width: 120,
                              child: Image.asset(
                                  'assets/images/admin_mis_logo.png'),
                            ),
                            const Spacer(),
                            Text(
                              'Attendance Report',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: constants.mainTextWhite,
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
                          'Employee Attendance Report',
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

                      // Filter
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //
                          Text(
                            'This is the Attendance report for:',
                            style: bodyText,
                          ),
                          const SizedBox(width: 10),

                          // Department Name
                          Text(
                            widget.dept == 'All'
                                ? 'All'
                                : widget.dept != null
                                    ? widget.dept.toString()
                                    : '',
                            style: bodyText,
                          ),
                          const SizedBox(width: 4),

                          // Department Text
                          Text(
                            widget.dept == 'All'
                                ? 'Departments'
                                : widget.dept != null
                                    ? 'Department'
                                    : '',
                            style: bodyText,
                          ),

                          const SizedBox(width: 10),

                          // Start Date
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: constants.adminFilter,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: constants.lightGray.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  size: 16,
                                  color: constants.darkGray,
                                ),

                                const SizedBox(width: 8),

                                //date
                                Text(
                                  widget.startDate != null
                                      ? DateFormat('MM/dd/yyyy')
                                          .format(widget.startDate!)
                                          .toString()
                                      : '     -       ',
                                  style: bodyText,
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(width: 10),

                          // End Date
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
                            decoration: BoxDecoration(
                              color: constants.adminFilter,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(14),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: constants.lightGray.withOpacity(0.5),
                                  spreadRadius: 0,
                                  blurRadius: 3,
                                  offset: const Offset(0, 5),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.calendar_month_rounded,
                                  size: 16,
                                  color: constants.darkGray,
                                ),

                                const SizedBox(width: 8),

                                //date
                                Text(
                                  widget.endDate != null
                                      ? DateFormat('MM/dd/yyyy')
                                          .format(widget.endDate!)
                                          .toString()
                                      : '     -       ',
                                  style: bodyText,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            // ============================ Data Table ==============================
                            DataTable(
                              columnSpacing: 30,
                              // ================= Column Data =================
                              columns: [
                                //Employee
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Employee',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
                                      ),
                                    ),
                                  ),
                                ),

                                //Department
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Department',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium
                                            ?.copyWith(
                                                color: constants.mainTextBlack),
                                      ),
                                    ),
                                  ),
                                ),

                                //Date
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Date',
                                        style: heading,
                                      ),
                                    ),
                                  ),
                                ),

                                //Time in
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Time in',
                                        style: heading,
                                      ),
                                    ),
                                  ),
                                ),

                                //Time out
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Time out',
                                        style: heading,
                                      ),
                                    ),
                                  ),
                                ),

                                //Status
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Status',
                                        style: heading,
                                      ),
                                    ),
                                  ),
                                ),

                                //Hours Rendered
                                DataColumn(
                                  label: Flexible(
                                    child: Center(
                                      child: Text(
                                        'Hours Rendered',
                                        style: heading,
                                      ),
                                    ),
                                  ),
                                ),
                              ],

                              // ===================== Row Data =====================
                              rows: filteredList.map((attendance) {
                                return DataRow(cells: [
                                  //EmpName
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 100,
                                        child: Text(
                                          attendance.empName,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Department
                                  DataCell(
                                    Center(
                                      child: SizedBox(
                                        width: 100,
                                        child: Text(
                                          attendance.department,
                                          textAlign: TextAlign.center,
                                          overflow: TextOverflow.ellipsis,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color:
                                                      constants.mainTextBlack),
                                        ),
                                      ),
                                    ),
                                  ),

                                  //Date
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat('MM/dd/yyyy')
                                            .format(attendance.date)
                                            .toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),

                                  //Time in
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat.jm()
                                            .format(attendance.timeIn)
                                            .toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),

                                  //Time out
                                  DataCell(
                                    Center(
                                      child: Text(
                                        DateFormat.jm()
                                            .format(attendance.timeOut)
                                            .toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),

                                  //Status
                                  DataCell(
                                    Center(
                                      child: attendance.status == "present"
                                          ? const PillContainer(
                                              color: constants.hrstatusGreen,
                                              label: "Present",
                                              labelColor:
                                                  constants.mainTextWhite,
                                              width: 100,
                                            )
                                          : attendance.status == "late"
                                              ? const PillContainer(
                                                  color:
                                                      constants.hrstatusOrange,
                                                  label: "Late",
                                                  labelColor:
                                                      constants.mainTextWhite,
                                                  width: 100,
                                                )
                                              : attendance.status == "absent"
                                                  ? const PillContainer(
                                                      color:
                                                          constants.hrstatusRed,
                                                      label: "Absent",
                                                      labelColor: constants
                                                          .mainTextWhite,
                                                      width: 100,
                                                    )
                                                  : Container(),
                                    ),
                                  ),

                                  //Hours Rendered
                                  DataCell(
                                    Center(
                                      child: Text(
                                        attendance.hrsRendered.toString(),
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ]);
                              }).toList(),

                              headingTextStyle:
                                  Theme.of(context).textTheme.titleMedium,
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
                            color: constants.supervisorBtn,
                            label: Column(
                              children: [
                                const SizedBox(height: 2.5),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.open_in_new,
                                      color: constants.mainTextWhite,
                                    ),
                                    const SizedBox(width: 10.0),
                                    Text(
                                      'Open PDF file',
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
