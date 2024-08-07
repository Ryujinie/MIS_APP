import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';

class ManagerViewAttendance extends StatelessWidget {
  const ManagerViewAttendance({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? body = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: constants.mainTextBlack,
          fontWeight: FontWeight.w500,
        );

    final TextStyle? label = Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: const Color.fromARGB(255, 131, 131, 131),
          fontWeight: FontWeight.w400,
        );
    return ViewButton(
      onPressed: () => showDialog(
          context: context,
          builder: (BuildContext context) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(48, 100, 48, 40),
              child: AlertDialog(
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
                              "Attendance Report",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontWeight: FontWeight.w700),
                            ),
                            //
                            const SizedBox(height: 8),
                          ],
                        ),

                        // Close Button
                        CloseButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          color: constants.adminBtn,
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    // Divider
                    Divider(
                      color: constants.lightGray.withOpacity(0.6),
                      indent: 48,
                      endIndent: 48,
                    ),
                  ],
                ),

                // title style
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleLarge
                    ?.copyWith(color: constants.mainTextBlack),

                content: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(48, 12, 48, 48),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // ============================ Attendance Details Row ============================
                        Row(
                          children: [
                            // =========================== Labels Column ===========================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Employee Name:",
                                  style: label,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Department:",
                                  style: label,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Status:",
                                  style: label,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),

                            const SizedBox(width: 24),

                            // =========================== Fields Column ===========================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Dan Ombao",
                                  style: body,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Accounting",
                                  style: body,
                                ),
                                const SizedBox(height: 16),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 36, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(50)),
                                    color: constants.hrStatusPresent
                                        .withOpacity(0.9),
                                  ),
                                  child: const Text(
                                    "Present",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                const SizedBox(height: 2),
                              ],
                            ),

                            const SizedBox(width: 280),

                            // =========================== Labels Column ===========================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date:",
                                  style: label,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "Start Time:",
                                  style: label,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "End Time:",
                                  style: label,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),

                            const SizedBox(width: 24),

                            // =========================== Fields Column ===========================
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "3/23/2024",
                                  style: body,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "8:30 AM",
                                  style: body,
                                ),
                                const SizedBox(height: 16),
                                Text(
                                  "5:00 PM",
                                  style: body,
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),

                        // // Employee Name and Date
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.start,
                        //   children: [
                        //     Text(
                        //       "Employee Name:",
                        //       style: Theme.of(context)
                        //           .textTheme
                        //           .bodyMedium
                        //           ?.copyWith(
                        //             color:
                        //                 const Color.fromARGB(255, 131, 131, 131),
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
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.start,
                        //       children: [
                        //         const Text(
                        //           "Date:",
                        //           style: TextStyle(
                        //               color: Color.fromARGB(255, 131, 131, 131),
                        //               fontWeight: FontWeight.w400),
                        //         ),
                        //         const SizedBox(width: 50),
                        //         Text(
                        //           "3/23/2024",
                        //           style: Theme.of(context)
                        //               .textTheme
                        //               .bodyMedium
                        //               ?.copyWith(
                        //                   color: constants.mainTextBlack,
                        //                   fontWeight: FontWeight.w500),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),

                        // // Department and Start Time
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Department:",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyMedium
                        //             ?.copyWith(
                        //               color: const Color.fromARGB(
                        //                 255,
                        //                 131,
                        //                 131,
                        //                 131,
                        //               ),
                        //               fontWeight: FontWeight.w400,
                        //             ),
                        //       ),
                        //       const SizedBox(width: 43),
                        //       const Padding(
                        //         padding: EdgeInsets.fromLTRB(20, 4, 30, 4),
                        //         child: Text(
                        //           "Accounting",
                        //           style: TextStyle(fontWeight: FontWeight.w500),
                        //         ),
                        //       ),
                        //       const SizedBox(width: 270),
                        //       Row(
                        //         mainAxisAlignment: MainAxisAlignment.start,
                        //         children: [
                        //           const Text(
                        //             "Start Time:",
                        //             style: TextStyle(
                        //                 color: Color.fromARGB(255, 131, 131, 131),
                        //                 fontWeight: FontWeight.w400),
                        //           ),
                        //           const SizedBox(width: 13),
                        //           Text(
                        //             "8:30 AM",
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

                        // // Status and End Time
                        // Padding(
                        //   padding: const EdgeInsets.fromLTRB(0, 0, 14, 12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     children: [
                        //       Text(
                        //         "Status:",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodyMedium
                        //             ?.copyWith(
                        //                 color: const Color.fromARGB(
                        //                     255, 131, 131, 131),
                        //                 fontWeight: FontWeight.w400),
                        //       ),
                        //       const SizedBox(width: 85),
                        //       Container(
                        //         decoration: BoxDecoration(
                        //           borderRadius:
                        //               const BorderRadius.all(Radius.circular(50)),
                        //           color:
                        //               constants.hrStatusPresent.withOpacity(0.9),
                        //         ),
                        //         child: const Padding(
                        //           padding: EdgeInsets.symmetric(
                        //               horizontal: 36, vertical: 4),
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
                        //                   color:
                        //                       Color.fromARGB(255, 131, 131, 131),
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
                        Row(
                          children: [
                            Text(
                              "Details:",
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

                        const SizedBox(height: 12),

                        // Details Description
                        Row(
                          children: [
                            Text(
                              "Please provide details of completed tasks or any encountered issues:",
                              textAlign: TextAlign.start,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: constants.mainTextBlack,
                                  ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 12),

                        Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(15)),
                            color: constants.lightGray.withOpacity(0.2),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(12),
                            child: SingleChildScrollView(
                              child: Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
