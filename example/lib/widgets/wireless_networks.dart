import 'package:example/localization/settings_localization.dart';
import 'package:flutter/material.dart';

class WireLessNetworkAllSettings extends StatelessWidget {
  const WireLessNetworkAllSettings({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _title = SettingsLocalizations.of(context).translate('Settings') +
        " " +
        SettingsLocalizations.of(context).translate('Wireless & networks');
    return Scaffold(
      appBar: AppBar(
          title: Text(
        _title,
      )),
      body: Container(
        child: Center(
          child: Text(_title),
        ),
      ),
    );
  }
}
