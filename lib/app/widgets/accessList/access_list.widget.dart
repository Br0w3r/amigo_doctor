import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';
import 'package:amigo_doctor/app/widgets/text/title.widget.dart';

class AccessList extends StatelessWidget {
  final RxList<String> names;
  final RxList<String>? descriptions;
  final String emptyMessage;
  final bool? haveGetPage;
  final Function(int)? getPage;
  final bool? haveDelete;
  final Function(int)? delete;
  final bool? haveEdit;
  final Function(int)? edit;
  final bool? haveView;
  final Function(int)? view;
  final String userRole; 

  const AccessList({
    super.key,
    required this.names,
    this.descriptions,
    required this.emptyMessage,
    this.haveGetPage = false,
    this.getPage,
    this.haveDelete = false,
    this.delete,
    this.edit,
    this.haveView = false,
    this.view,
    required this.userRole, 
    this.haveEdit = false, 
  });

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (names.isEmpty) {
        return Center(
          child: CustomSubtitle(
            title: emptyMessage,
            color: Colors.black87,
            fontWeight: 4,
            size: 4,
          ),
        );
      }

      return Expanded(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: names.length,
          itemBuilder: (context, index) {
            final name = names[index];
            final description = descriptions?[index] ?? '';
            bool shouldShowGetPageIcon = haveGetPage!;

            if (userRole == '1' || userRole == '4') {
              if (description == 'Solicitud abierta' || description == 'Embalando') {
                shouldShowGetPageIcon = false;
              }
            }

            return Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: const BorderSide(color: Colors.black, width: 1),
              ),
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTitle(
                          title: name,
                          color: Colors.black,
                          size: -4,
                        ),
                        const SizedBox(height: 8),
                        if (description.isNotEmpty)
                          CustomSubtitle(
                            title: description.length > 44
                                ? '${description.substring(0, 45)}...'
                                : description,
                          ),
                      ],
                    ),
                    const Spacer(),
                    if (haveDelete!)
                      InkWell(
                        onTap: () => delete!(index),
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        ),
                      ).paddingOnly(right: 4),
                    if (haveEdit!)
                      InkWell(
                        onTap: () => edit!(index),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.black,
                          size: 30,
                        ),
                      ).paddingOnly(right: 4),
                    if (haveView!)
                      InkWell(
                        onTap: () => view!(index),
                        child: const Icon(
                          Icons.remove_red_eye,
                          color: Colors.black,
                          size: 30,
                        ),
                      ).paddingOnly(right: 8),
                    if (shouldShowGetPageIcon)
                      InkWell(
                        onTap: () => getPage!(index),
                        child: const Icon(
                          Icons.plagiarism,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                  ],
                ),
              ),
            ).paddingOnly(left: 5, right: 5, top: 2);
          },
        ),
      );
    });
  }
}
