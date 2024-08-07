import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/ticket_screen/ticket_records.dart';
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
// import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/employee_viewticket_modal.dart';
import 'package:ssi_mis_flutter/global/modals/employee_createticket_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class EmployeeTicketScreen extends StatelessWidget {
  const EmployeeTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle? heading =
        Theme.of(context).textTheme.titleMedium?.copyWith(
              color: constants.mainTextBlack,
            );
    final TextStyle? bodyText =
        Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: constants.mainTextBlack,
            );
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: Column(
        children: [
          // ====================== Search, Filter, Add Ticket Buttons ===================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  // ================ Search Tickets ================
                  CustomSearchBar(
                    hintText: "Search tickets...",
                  ),

                  SizedBox(width: 4),

                  // =============== Date Filter ================
                  DateFilter(),
                ],
              ),

              //=================== Create Button ===================
              ElevatedButton(
                onPressed: () => createTicket(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 71, 171, 1),
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.fromLTRB(12, 16, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 6),
                    Text(
                      "Create Ticket",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: constants.mainTextWhite),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // ====================== Table =======================
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: constants.adminTable,
              ),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(48, 12, 48, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ======================== Data Table ============================
                      DataTable(
                        columnSpacing: 20,

                        // ==================== Column Data ====================
                        columns: [
                          //Ticket ID
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Ticket ID',
                                  style: heading,
                                ),
                              ),
                            ),
                          ),

                          //Subject
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Subject',
                                  style: heading,
                                ),
                              ),
                            ),
                          ),

                          // //Employee
                          // DataColumn(
                          //   label: Flexible(
                          //     child: Center(
                          //       child: Text(
                          //         'Employee',
                          //         style: heading,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          // //Department
                          // DataColumn(
                          //   label: Flexible(
                          //     child: Center(
                          //       child: Text(
                          //         'Department',
                          //         style: heading,
                          //       ),
                          //     ),
                          //   ),
                          // ),

                          //Message
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Message',
                                  style: heading,
                                ),
                              ),
                            ),
                          ),

                          //Request Date
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Request Date',
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

                          //Action
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Action',
                                  style: heading,
                                ),
                              ),
                            ),
                          ),
                        ],

                        // ==================== Row Data ====================
                        rows: tickets.map(
                          (ticket) {
                            return DataRow(
                              cells: [
                                //Ticket ID
                                DataCell(
                                  Center(
                                    child: Text(
                                      ticket.ticketID.toString(),
                                      style: bodyText,
                                    ),
                                  ),
                                ),

                                //Subject
                                DataCell(
                                  Center(
                                    child: SizedBox(
                                      width: 200,
                                      child: Text(
                                        ticket.subject,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ),

                                //empName
                                // DataCell(
                                //   Center(
                                //     child: SizedBox(
                                //       width: 100,
                                //       child: Text(
                                //         ticket.empName,
                                //         overflow: TextOverflow.ellipsis,
                                //         style: bodyText,
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                // //empDept
                                // DataCell(
                                //   Center(
                                //     child: SizedBox(
                                //       width: 100,
                                //       child: Text(
                                //         ticket.empDept,
                                //         overflow: TextOverflow.ellipsis,
                                //         style: bodyText,
                                //       ),
                                //     ),
                                //   ),
                                // ),

                                //Message
                                DataCell(
                                  Center(
                                    child: SizedBox(
                                      width: 150,
                                      child: Text(
                                        ticket.message,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ),

                                //Request Date
                                DataCell(
                                  Center(
                                    child: Text(
                                      DateFormat('MM/dd/yyyy')
                                          .format(ticket.requestDate)
                                          .toString(),
                                      style: bodyText,
                                    ),
                                  ),
                                ),

                                //Status
                                DataCell(
                                  Center(
                                    child: ticket.status == "in review"
                                        ? const PillContainer(
                                            color: constants.statusGreen,
                                            label: "In Review",
                                            labelColor: constants.mainTextWhite,
                                            width: 100,
                                          )
                                        : ticket.status == "in progress"
                                            ? const PillContainer(
                                                color: constants.statusOrange,
                                                label: "In Progress",
                                                labelColor:
                                                    constants.mainTextWhite,
                                                width: 100,
                                              )
                                            : ticket.status == "processing"
                                                ? const PillContainer(
                                                    color: constants.statusBlue,
                                                    label: "Processing",
                                                    labelColor:
                                                        constants.mainTextWhite,
                                                    width: 100,
                                                  )
                                                : ticket.status == "closed"
                                                    ? const PillContainer(
                                                        color: constants
                                                            .statusGray,
                                                        label: "Closed",
                                                        labelColor: constants
                                                            .mainTextWhite,
                                                        width: 100,
                                                      )
                                                    : Container(),
                                  ),
                                ),

                                //Action
                                const DataCell(
                                  Center(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ViewTicket(),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ).toList(),
                        headingTextStyle:
                            Theme.of(context).textTheme.titleMedium,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
