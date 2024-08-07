import 'package:flutter/material.dart';
import 'package:ssi_mis_flutter/config/constants.dart' as constants;
import 'package:ssi_mis_flutter/features/screens/ticket_screen/ticket_records.dart';
import 'package:ssi_mis_flutter/global/modals/admin_createticket_modal.dart';
import 'package:ssi_mis_flutter/global/widgets/date_filter.dart';
import 'package:ssi_mis_flutter/global/widgets/searchbar.dart';

class SupervisorTicketScreen extends StatelessWidget {
  const SupervisorTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      return const AdminCreateTicketModal();
                    }),
                style: ElevatedButton.styleFrom(
                  backgroundColor: constants.hrPrimary,
                  minimumSize: Size.zero,
                  padding: const EdgeInsets.fromLTRB(12, 16, 16, 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.add,
                        color: constants.mainTextWhite, size: 20),
                    const SizedBox(width: 6),
                    Text(
                      "Add",
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
          const Expanded(
            child: AdminTicketRecords(),
          ),
        ],
      ),
    );
  }
}
