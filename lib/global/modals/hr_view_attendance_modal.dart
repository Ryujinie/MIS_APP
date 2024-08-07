import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';

class ViewAttendance extends StatelessWidget {
  const ViewAttendance({super.key});

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
                padding: const EdgeInsets.fromLTRB(24, 80, 24, 40),
                child: AlertDialog(
                  titleTextStyle: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(color: constants.mainTextBlack),
                  contentPadding: const EdgeInsets.fromLTRB(60, 24, 60, 48),
                  content: SizedBox(
                    width: width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Attendance Report Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(
                                width:
                                    0), // Invisible SizedBox can be used to balance the row
                            Text(
                              "Attendance Report",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                      color: constants.mainTextBlack,
                                      fontWeight: FontWeight.w700),
                            ),
                            CloseButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: constants.adminBtn,
                            ),
                          ],
                        ),
                        const SizedBox(height: 3),

                        const Padding(
                          padding: EdgeInsets.only(top: 12, bottom: 12),
                          child: Divider(
                            color: constants.darkGray,
                            thickness: 0.5,
                          ),
                        ),
                        const SizedBox(height: 30),

                        // Employee Name and Date
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
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
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 280),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Date:",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 50),
                                  Text(
                                    "3/23/2024",
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

                        // Department and Start Time
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Department:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                      color: const Color.fromARGB(
                                        255,
                                        131,
                                        131,
                                        131,
                                      ),
                                      fontWeight: FontWeight.w400,
                                    ),
                              ),
                              const SizedBox(width: 43),
                              const Padding(
                                padding: EdgeInsets.fromLTRB(20, 4, 30, 4),
                                child: Text(
                                  "Accounting",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              const SizedBox(width: 270),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Start Time:",
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 131, 131, 131),
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 13),
                                  Text(
                                    "8:30 AM",
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

                        // Status and End Time
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 14, 12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Status:",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                        color: const Color.fromARGB(
                                            255, 131, 131, 131),
                                        fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(width: 85),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(50)),
                                  color: constants.hrStatusPresent
                                      .withOpacity(0.9),
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 36, vertical: 4),
                                  child: Text(
                                    "Present",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 271),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Text("End Time:",
                                      style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 131, 131, 131),
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(width: 20),
                                  Text(
                                    "5:00 PM",
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

                        Expanded(
                          child: Container(
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
