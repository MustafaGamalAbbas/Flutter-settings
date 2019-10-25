import 'package:example/icons/custom_icons_icons.dart';
import 'package:example/localization/settings_localization.dart';
import 'package:example/widgets/wireless_networks.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_settings/models/settings_list_item.dart';
import 'package:flutter_settings/util/SettingsConstants.dart';
import 'package:flutter_settings/widgets/SettingsButton.dart';
import 'package:flutter_settings/widgets/SettingsCheckBox.dart';
import 'package:flutter_settings/widgets/SettingsIcon.dart';
import 'package:flutter_settings/widgets/SettingsInputField.dart';
import 'package:flutter_settings/widgets/SettingsNavigatorButton.dart';
import 'package:flutter_settings/widgets/SettingsSection.dart';
import 'package:flutter_settings/widgets/SettingsSelectionList.dart';
import 'package:flutter_settings/widgets/SettingsSlider.dart';
import 'package:toast/toast.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      supportedLocales: [
        Locale('en', 'US'),
        Locale('ar', 'EG'),
      ],
      localizationsDelegates: [
        // A class which loads the translations from JSON files
        SettingsLocalizations.delegate,
        // Built-in localization of basic text for Material widgets
        GlobalMaterialLocalizations.delegate,
        // Built-in localization for text direction LTR/RTL
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        // Check if the current device locale is supported
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported, use the first one
        // from the list (English, in this case).
        return supportedLocales.first;
      },
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _caption = "After 15 seconds of inactivity";
  var _simCaption = "SIM1";
  var _numberCaption;
  var turnOffList;
  var _selectionIndex = 0;
  WidgetDirection direction;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    direction =
        SettingsLocalizations.of(context).locale.toLanguageTag().contains('ar')
            ? WidgetDirection.rtl
            : WidgetDirection.ltr;
    turnOffList = new List<SettingsSelectionItem<int>>();
    turnOffList.add(SettingsSelectionItem<int>(
        0, "15 " + SettingsLocalizations.of(context).translate("seconds")));
    turnOffList.add(SettingsSelectionItem<int>(
        1, "30 " + SettingsLocalizations.of(context).translate("seconds")));
    turnOffList.add(SettingsSelectionItem<int>(
        2, "1 " + SettingsLocalizations.of(context).translate("minute")));
    turnOffList.add(SettingsSelectionItem<int>(
        3, "5 " + SettingsLocalizations.of(context).translate("minutes")));
    turnOffList.add(SettingsSelectionItem<int>(
        4, "10 " + SettingsLocalizations.of(context).translate("minutes")));
    _caption = SettingsLocalizations.of(context).translate("After") +
        " 15 " +
        SettingsLocalizations.of(context).translate("seconds") +
        " " +
        SettingsLocalizations.of(context).translate("of inactivity");
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(SettingsLocalizations.of(context).translate("Settings")),
      ),
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              SettingsSection(
                title: Text(SettingsLocalizations.of(context)
                    .translate('Wireless & networks')),
                settingsChildren: [
                  SettingsButton(
                    title: "Wi-Fi",
                    caption: "wifi caffee",
                    icon: new SettingsIcon(
                      icon: Icons.wifi,
                      backgroundColor: Colors.blue,
                    ),
                    direction: direction,
                    onPressed: () {
                      Toast.show("Wi-Fi is pressed", context);
                    },
                  ),
                  SettingsButton(
                    title: SettingsLocalizations.of(context)
                        .translate('Mobile networks'),
                    icon: new SettingsIcon(
                      icon: CustomIcons.internet,
                      backgroundColor: Colors.green[500],
                    ),
                    direction: direction,
                    onPressed: () {
                      Toast.show(
                          "You've pressed on Mobile networks button ", context);
                    },
                  ),
                  SettingsNavigatorButton(
                    title: SettingsLocalizations.of(context).translate('More'),
                    icon: new SettingsIcon(
                      icon: Icons.more_horiz,
                      backgroundColor: Colors.orange,
                    ),
                    direction: direction,
                    context: context,
                    targetWidget: WireLessNetworkAllSettings(),
                  ),
                ],
              ),
              SettingsSection(
                title: Text(
                  SettingsLocalizations.of(context).translate('Screen'),
                ),
                settingsChildren: [
                  SettingsSlider(
                    value: 0.5,
                    activeColor: Colors.blue,
                    icon: new SettingsIcon(
                      icon: Icons.brightness_7,
                      color: Colors.red,
                      text: SettingsLocalizations.of(context)
                          .translate('Brightness'),
                    ),
                    direction: direction,
                    onChange: (value) {
                      Toast.show(
                          "now the brightness value becomes " +
                              value.toString(),
                          context);
                    },
                  ),
                  SettingsCheckBox(
                    title: SettingsLocalizations.of(context)
                        .translate('Auto-rotate screen'),
                    icon: new SettingsIcon(
                      icon: Icons.phone_android,
                      color: Colors.blueGrey,
                    ),
                    direction: direction,
                    onPressed: (value) {
                      Toast.show(
                          "Auto-rotate screen is " + value.toString(), context);
                    },
                    value: false,
                  ),
                  SettingsSelectionList<int>(
                    items: turnOffList,
                    chosenItemIndex: _selectionIndex,
                    title: SettingsLocalizations.of(context)
                        .translate('Turn off screen automatically'),
                    caption: _caption,
                    icon: new SettingsIcon(
                      icon: Icons.alarm_off,
                      color: Colors.blue,
                    ),
                    direction: direction,
                    onSelect: (value, index) {
                      Toast.show("You have selected " + value.text.toString(),
                          context);
                      setState(() {
                        _selectionIndex = index;
                        _caption = SettingsLocalizations.of(context)
                                .translate("After") +
                            " " +
                            value.text +
                            " " +
                            SettingsLocalizations.of(context)
                                .translate("of inactivity");
                      });
                    },
                    context: context,
                  ),
                  SettingsCheckBox(
                    title: SettingsLocalizations.of(context)
                        .translate('Display network speed'),
                    icon: new SettingsIcon(
                      icon: CustomIcons.gauge,
                      color: Colors.blueAccent,
                    ),
                    direction: direction,
                    onPressed: (bool value) {
                      Toast.show("Display network speed is " + value.toString(),
                          context);
                    },
                    value: true,
                    type: CheckBoxWidgetType.Switch,
                  ),
                ],
              ),
              SettingsSection(
                title: Text(SettingsLocalizations.of(context)
                    .translate('Sim card Info')),
                settingsChildren: [
                  SettingsInputField(
                    dialogButtonText:
                        SettingsLocalizations.of(context).translate('Done'),
                    title: SettingsLocalizations.of(context)
                        .translate('Edit SIM name'),
                    caption: _simCaption,
                    direction: direction,
                    onPressed: (value) {
                      if (value.toString().isNotEmpty) {
                        Toast.show("You have Entered " + value, context);
                        setState(() {
                          _simCaption = value;
                        });
                      }
                    },
                    context: context,
                  ),
                  SettingsInputField(
                    dialogButtonText:
                        SettingsLocalizations.of(context).translate('Done'),
                    title: SettingsLocalizations.of(context)
                        .translate('Enter phone number'),
                    caption: _numberCaption ??
                        SettingsLocalizations.of(context).translate('Not set'),
                    keyboardType: TextInputType.number,
                    direction: direction,
                    onPressed: (value) {
                      if (value.toString().isNotEmpty) {
                        Toast.show("You have Entered " + value, context);

                        setState(() {
                          _numberCaption = value;
                        });
                      }
                    },
                    context: context,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
