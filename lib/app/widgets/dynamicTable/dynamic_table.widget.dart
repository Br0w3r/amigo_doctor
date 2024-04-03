import 'package:flutter/material.dart';
import 'package:amigo_doctor/app/widgets/text/subtitle.widget.dart';

class DynamicTableWidget extends StatelessWidget {
  final List<String> columnNames;
  final Map<String, Color> columnColors;
  final List<Map<String, dynamic>> data;

  const DynamicTableWidget({
    super.key,
    required this.columnNames,
    required this.columnColors,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 12.0,
        horizontalMargin: 10.0,
        columns: _buildColumns(),
        rows: _buildRows(),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
        ),
      ),
    );
  }

  List<DataColumn> _buildColumns() {
    return columnNames.map((name) {
      return DataColumn(
        label: CustomSubtitle(
          title: name,
          color: columnColors[name] ?? Colors.black,
          fontWeight: 2,
          size: 1,
        ),
      );
    }).toList();
  }

  List<DataRow> _buildRows() {
    return data
        .asMap()
        .map((index, row) {
          return MapEntry(
            index,
            DataRow(
              color: MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                if (index % 2 == 0) {
                  return Colors.grey.withOpacity(0.3);
                }
                return null;
              }),
              cells: columnNames.map((columnName) {
                return DataCell(
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: const BoxDecoration(
                      border: Border(bottom: BorderSide(color: Colors.grey)),
                    ),
                    child: CustomSubtitle(
                      title: row[columnName]?.toString() ?? '',
                      textAlign: TextAlign.center,
                      size: -1,
                    ),
                  ),
                );
              }).toList(),
            ),
          );
        })
        .values
        .toList();
  }
}
