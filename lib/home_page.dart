import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'DropdownMenu Widget',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Theme.of(context).colorScheme.onPrimary,
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: 50,
          horizontal: 20,
        ),
        child: Row(
          mainAxisAlignment: .center,
          children: [
            DropdownMenu(
              dropdownMenuEntries: [
                const DropdownMenuEntry(
                  value: 'Android',
                  label: 'Android',
                  leadingIcon: FaIcon(FontAwesomeIcons.android),
                ),
                const DropdownMenuEntry(
                  value: 'iOS',
                  label: 'iOS',
                  leadingIcon: FaIcon(
                    FontAwesomeIcons.apple,
                  ),
                ),
                const DropdownMenuEntry(
                  value: 'Windows',
                  label: 'Windows',
                  leadingIcon: FaIcon(FontAwesomeIcons.windows),
                ),
                const DropdownMenuEntry(
                  value: 'macOS',
                  label: 'macOS',
                  leadingIcon: FaIcon(FontAwesomeIcons.apple),
                ),
                const DropdownMenuEntry(
                  value: 'Linux',
                  label: 'Linux',
                  leadingIcon: FaIcon(FontAwesomeIcons.linux),
                ),
              ],
              label: const Text('Select Platform'),
              width: 300,
              initialSelection: 'Android',
              onSelected: (value) {
                print('Selected value: $value');
              },
              enableSearch: true,
              enableFilter: true,
              requestFocusOnTap: true,
            ),
          ],
        ),
      ),
    );
  }
}
