import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/ticket_screen/hr_ticket_records.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class HRTicketScreen extends StatelessWidget {
  const HRTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: constants.adminBG,
      height: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
      child: const Column(
        children: [
          // ====================== Search, Filter, Add Ticket Buttons ===================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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

              //=================== DISABLED Create Button ===================
              // ElevatedButton(
              //   onPressed: () => createTicket(context),
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: constants.hrPrimary,
              //     minimumSize: Size.zero,
              //     padding: const EdgeInsets.fromLTRB(12, 16, 16, 16),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              //   child: Row(
              //     children: [
              //       const Icon(Icons.add,
              //           color: constants.mainTextWhite, size: 20),
              //       const SizedBox(width: 6),
              //       Text(
              //         "Create Ticket",
              //         style: Theme.of(context)
              //             .textTheme
              //             .bodyMedium
              //             ?.copyWith(color: constants.mainTextWhite),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),

          SizedBox(height: 12),

          // ====================== Table =======================
          Expanded(
            child: HRTicketRecords(),
          ),
        ],
      ),
    );
  }
}

// // ========================== DateTime Picker ==========================
// Future<void> _selectDate(BuildContext context) async {
//   DateTime selectedDate = DateTime.now();
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate,
//     firstDate: DateTime(1900),
//     lastDate: DateTime.now(),
//   );
//   if (picked != null && picked != selectedDate) {
// //       setState(() {
// //         selectedDate = picked;
// //       });
//   }
// }
