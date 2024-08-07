// ignore_for_file: library_prefixes, prefer_const_declarations, avoid_print
import 'dart:io';
import 'dart:ui' as ui;
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:pdf/widgets.dart' as pdfWidgets;
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider_windows/path_provider_windows.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/elevated_button.dart';
import 'package:open_file/open_file.dart';

//Capture GlobalKey
final GlobalKey _repaintBoundaryKey = GlobalKey();
//Sample profile photo
const String profileImagePath = 'assets/images/profile_sample.png';

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
          final pdfFile = File('$documentsPath/manager_profile.pdf');
          await compute(
              convertImageToPdf
                  as ComputeCallback<Map<String, Object>, dynamic>,
              {'imageBytes': imageBytes, 'pdfFilePath': pdfFile.path});

          print('PDF saved to $documentsPath/manager_profile.pdf');
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
class PrintManagerProfile extends StatefulWidget {
  const PrintManagerProfile({super.key});

  @override
  State<PrintManagerProfile> createState() => _PrintManagerProfileState();
}

class _PrintManagerProfileState extends State<PrintManagerProfile> {
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
    OpenFile.open('$documentsPath/manager_profile.pdf');
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
                  color: Colors.white,
                  border: Border.all(
                    color: constants.mainTextGrey,
                    width: 0.5,
                  ),
                ),
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
                            'Profile Information',
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
                        'Employee Profile Information',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: constants.mainTextBlack,
                              fontSize: 35,
                              fontWeight: FontWeight.w400,
                            ),
                      ),
                    ),
                    const Center(
                      child: Divider(
                        thickness: 1.0,
                        indent: 200,
                        endIndent: 210,
                        color: constants.mainTextBlack,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 250,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: constants.backgroundBtnlightGrey,
                            ),
                            child: Column(
                              children: [
                                const SizedBox(height: 10),
                                // ================= PERSONAL DETAILS HEADING ROW =================
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(width: 30),
                                    Text(
                                      'Personal Details',
                                      textAlign: TextAlign.start,
                                      style: headingStyle,
                                    ),
                                  ],
                                ),
                                const Divider(
                                  thickness: 0.5,
                                  color: constants.mainTextBlack,
                                ),
                                // =========================== PERSONAL DETAILS  ROW ===========================
                                Row(
                                  children: [
                                    // ================== Image, Name, Position Column =================
                                    SizedBox(
                                      width: 200,
                                      child: Column(
                                        children: [
                                          const SizedBox(height: 20),
                                          //Image
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.08,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.15,
                                            child: Image.asset(
                                              profileImagePath,
                                            ),
                                          ),
                                          const SizedBox(height: 24),
                                          //Name
                                          SizedBox(
                                            child: Text(
                                              'Gracie A. Gates',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleLarge
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                            ),
                                          ),
                                          //Position
                                          SizedBox(
                                            child: Text(
                                              'Quality Assurance',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyLarge
                                                  ?.copyWith(
                                                    color:
                                                        constants.mainTextGrey,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 24),
                                    //================== First, Middle, Last Name, Gender Row =================
                                    Row(
                                      children: [
                                        // ==================== Labels Column ====================
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //First Name
                                            Text(
                                              'First Name',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Middle Name
                                            Text(
                                              'Middle Name',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Last Name
                                            Text(
                                              'Last Name',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Gender
                                            Text(
                                              'Gender',
                                              style: labelStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 10),
                                        // ==================== Fields Column ====================
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //First Name
                                            Text(
                                              'Gracie',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Middle Name
                                            Text(
                                              'Appleseed',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Last Name
                                            Text(
                                              'Gates',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Gender
                                            Text(
                                              'Female',
                                              style: textStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(width: 30),
                                    //================== Birth, Email, Phone, Address Row =================
                                    Row(
                                      children: [
                                        // ==================== Labels Column ====================
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //First Name
                                            Text(
                                              'Date of Birth',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Middle Name
                                            Text(
                                              'Email',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Last Name
                                            Text(
                                              'Mobile & Telephone',
                                              style: labelStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Gender
                                            Text(
                                              'Home Address',
                                              style: labelStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        // ==================== Fields Column ====================
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            //First Name
                                            Text(
                                              '04/29/99',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Middle Name
                                            Text(
                                              'gracie.gates@gmail.com',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Last Name
                                            Text(
                                              '+63 912 345 6789 | 02 8832 4567',
                                              style: textStyle,
                                            ),
                                            const SizedBox(height: 20),
                                            //Gender
                                            Text(
                                              '73 Bulacan Street, Brgy. Sto. Nino, Manila',
                                              style: textStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        const SizedBox(width: 30),
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 550,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: constants.backgroundBtnlightGrey,
                            ),
                            child: Stack(
                              children: [
                                Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    // ================= PERSONAL DETAILS HEADING ROW =================
                                    Row(
                                      children: [
                                        const SizedBox(width: 170),
                                        Column(
                                          children: [
                                            Text(
                                              'Job Details',
                                              style: headingStyle,
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Column(
                                          children: [
                                            Text(
                                              'Government Contributions',
                                              style: headingStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 120),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 0.5,
                                      color: constants.mainTextBlack,
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        const SizedBox(width: 60),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Job Position',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Employent Type',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Role',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Department',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Schedule',
                                              style: headingStyle2,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Quality Assurance',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Regular',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Employee',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'IT',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'M,T,W,F,S 08:00AM-5:00PM',
                                              style: headingStyle,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 120),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tin No.',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'SSS No.',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Philhealth No.',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Pag-IBIG No.',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '',
                                              style: headingStyle2,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              '000-123-456-001',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '0-123456-7',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '0-123456-7',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '0-123456-7',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '',
                                              style: headingStyle,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 80),
                                    const Divider(
                                      thickness: 0.5,
                                      color: constants.mainTextBlack,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Emergency Contact',
                                          style: headingStyle,
                                        ),
                                      ],
                                    ),
                                    const Divider(
                                      thickness: 0.5,
                                      color: constants.mainTextBlack,
                                    ),
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        const SizedBox(width: 60),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Name',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Relationship',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Contact No.',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Address',
                                              style: headingStyle2,
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                        const SizedBox(width: 30),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Mika Ombao',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              'Mother',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '09081234567',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                            Text(
                                              '73 Bulacan Street, Brgy. Sto. Nino,Manila',
                                              style: headingStyle,
                                            ),
                                            const SizedBox(height: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const Positioned(
                                  top: 0,
                                  bottom: 0,
                                  left: 0,
                                  right: 0,
                                  child: VerticalDivider(
                                    thickness: 0.5,
                                    color: constants.mainTextBlack,
                                    width: 20,
                                    indent: 0,
                                    endIndent: 247,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 30),
                      ],
                    ),
                  ],
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
