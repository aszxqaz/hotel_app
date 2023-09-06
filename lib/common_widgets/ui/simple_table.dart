import 'package:flutter/material.dart';
import 'package:collection/collection.dart';

typedef TableData = Map<String, String>;

class SimpleTable extends StatelessWidget {
  const SimpleTable({super.key, required this.data});
  final TableData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.4),
        1: FractionColumnWidth(0.6),
      },
      children: data.entries
          .map(
            (entry) => TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    entry.key,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.onSecondary),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Text(
                    entry.value,
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          )
          .toList(),
    );
  }
}

class SpaceBetweenTable extends StatelessWidget {
  const SpaceBetweenTable({
    super.key,
    required this.data,
    this.accentLast = false,
  });
  final TableData data;
  final bool accentLast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: data.entries
          .mapIndexed(
            (i, entry) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    entry.key,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(color: theme.colorScheme.onSecondary),
                  ),
                  Text(
                    entry.value,
                    style: accentLast && i == data.entries.length - 1
                        ? theme.textTheme.bodyMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                            color: theme.colorScheme.onTertiary,
                          )
                        : theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
          )
          .toList(),
    );
  }
}
