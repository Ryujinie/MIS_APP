import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/global/buttons/pill_container.dart';
import 'package:ssi_mis_flutter/global/buttons/view_button.dart';
import 'package:ssi_mis_flutter/global/modals/manager_createticket_modal.dart';
import 'package:ssi_mis_flutter/global/modals/manager_viewticket_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class ManagerTicketScreen extends StatelessWidget {
  const ManagerTicketScreen({super.key});

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
                onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const ManagerCreateTicketModal();
                    }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: constants.mngrPrimary,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Create Ticket",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium
                      ?.copyWith(color: constants.mainTextBlack),
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

                          //Employee
                          DataColumn(
                            label: Flexible(
                              child: Center(
                                child: Text(
                                  'Employee',
                                  style: heading,
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
                                  style: heading,
                                ),
                              ),
                            ),
                          ),

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
                                DataCell(
                                  Center(
                                    child: SizedBox(
                                      width: 100,
                                      child: Text(
                                        ticket.empName,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ),

                                //empDept
                                DataCell(
                                  Center(
                                    child: SizedBox(
                                      width: 100,
                                      child: Text(
                                        ticket.empDept,
                                        overflow: TextOverflow.ellipsis,
                                        style: bodyText,
                                      ),
                                    ),
                                  ),
                                ),

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
                                    child: ticket.status == "open"
                                        ? PillContainer(
                                            color: constants.statusGray
                                                .withOpacity(0.8),
                                            label: "Open",
                                            labelColor: constants.mainTextWhite,
                                            width: 100,
                                          )
                                        : ticket.status == "in progress"
                                            ? PillContainer(
                                                color: constants.statusOrange
                                                    .withOpacity(0.9),
                                                label: "In Progress",
                                                labelColor:
                                                    constants.mainTextWhite,
                                                width: 100,
                                              )
                                            : ticket.status == "processing"
                                                ? PillContainer(
                                                    color: constants.statusBlue
                                                        .withOpacity(0.8),
                                                    label: "Processing",
                                                    labelColor:
                                                        constants.mainTextWhite,
                                                    width: 100,
                                                  )
                                                : ticket.status == "closed"
                                                    ? PillContainer(
                                                        color: constants
                                                            .statusGreen
                                                            .withOpacity(0.9),
                                                        label: "Closed",
                                                        labelColor: constants
                                                            .mainTextWhite,
                                                        width: 100,
                                                      )
                                                    : Container(),
                                  ),
                                ),

                                //Action
                                DataCell(
                                  Center(
                                    child: ViewButton(
                                      onPressed: () => showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return const ManagerViewTicket();
                                        },
                                      ),
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

class Ticket {
  final int ticketID;
  final String subject;
  final String empName;
  final String empDept;
  final String message;
  final DateTime requestDate;
  final String status;

  Ticket({
    required this.ticketID,
    required this.subject,
    required this.empName,
    required this.empDept,
    required this.message,
    required this.requestDate,
    required this.status,
  });
}

// ========================== Sample Table Data ==========================

final List<Ticket> tickets = [
  Ticket(
    ticketID: 123456,
    subject: "Request for Software Update",
    empName: "John Doe",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: "open",
  ),
  Ticket(
    ticketID: 127364,
    subject: "Internet Connectivity Issue",
    empName: "Jane Smith",
    empDept: "Network Operations",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: 'in progress',
  ),
  Ticket(
    ticketID: 123837,
    subject: "Hardware Malfunction",
    empName: "Michael Johnson",
    empDept: "Hardware Support",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: 'processing',
  ),
  Ticket(
    ticketID: 384456,
    subject: "Password Reset Request",
    empName: "Emily Williams",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: "closed",
  ),
  Ticket(
    ticketID: 137456,
    subject: "New Employee Onboarding",
    empName: "David Brown",
    empDept: "HR",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: "open",
  ),
  Ticket(
    ticketID: 193756,
    subject: "Meeting Room Reservation",
    empName: "Sarah Wilson",
    empDept: "Admin",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: "open",
  ),
  Ticket(
    ticketID: 128366,
    subject: "Printer Jam Issue",
    empName: "Robert Lee",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 08),
    status: "closed",
  ),
  Ticket(
    ticketID: 129876,
    subject: "VPN Access Request",
    empName: "Amanda Clark",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 03),
    status: "closed",
  ),
  Ticket(
    ticketID: 121236,
    subject: "Email Configuration Assistance",
    empName: "Daniel Miller",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 03),
    status: "processing",
  ),
  Ticket(
    ticketID: 128906,
    subject: "Software License Renewal",
    empName: "Jessica Taylor",
    empDept: "Procurement",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 03),
    status: "closed",
  ),
  Ticket(
    ticketID: 127686,
    subject: "Request for Software Update",
    empName: "John Doe",
    empDept: "IT",
    message: "Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem ",
    requestDate: DateTime(2024, 04, 03),
    status: "open",
  ),
  Ticket(
    ticketID: 125466,
    subject: "Internet Connectivity Issue",
    empName: "Jane Smith",
    empDept: "Network Operations",
    message: "Lorem Ipsum",
    requestDate: DateTime(2024, 04, 05),
    status: "closed",
  ),
  Ticket(
    ticketID: 123456,
    subject: "Hardware Malfunction",
    empName: "Michael Johnson",
    empDept: "Hardware Support",
    message: "Lorem Ipsum",
    requestDate: DateTime(2024, 04, 07),
    status: "processing",
  ),
  Ticket(
    ticketID: 122566,
    subject: "Password Reset Request",
    empName: "Emily Williams",
    empDept: "IT",
    message: "Lorem Ipsum",
    requestDate: DateTime(2024, 04, 09),
    status: "processing",
  ),
];
