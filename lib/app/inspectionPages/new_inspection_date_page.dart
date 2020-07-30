import 'package:flutter/material.dart';

import 'package:quickspecpro/app/inspectionPages/inspection_form_next_button_green.dart';
import 'package:quickspecpro/app/inspectionPages/new_inspection_address_page.dart';
import 'package:quickspecpro/app/models/contact/contact.dart';
import 'package:quickspecpro/app/models/inspection/inspection.dart';

import 'package:quickspecpro/routing/router.gr.dart';

import 'package:quickspecpro/shared/navigation/basic_scaffold.dart';
import 'package:quickspecpro/shared/text/orange_header_text.dart';
import 'package:table_calendar/table_calendar.dart';

class NewInspectionDatePage extends StatefulWidget {
  const NewInspectionDatePage({
    Key key,
    this.contact,
    this.inspection,
  }) : super(key: key);
  final Contact contact;
  final Inspection inspection;

  static Future<void> show(BuildContext context,
      {Inspection inspection, Contact contact}) async {
    await Navigator.of(context, rootNavigator: true).pushNamed(
      Router.newInspectionDatePage,
      arguments: NewInspectionDatePageArguments(
          inspection: inspection, contact: contact),
    );
  }

  @override
  _NewInspectionDatePageState createState() => _NewInspectionDatePageState();
}

class _NewInspectionDatePageState extends State<NewInspectionDatePage> {
  // Form State Objects
  final _calendarController = CalendarController();
  DateTime _date;

  @override
  void initState() {
    super.initState();

    if (widget.inspection != null) {
      _date = widget.inspection.date;
    }
  }

  void _submit() {
    final inspection = Inspection(
      date: _date,
    );
    NewInspectionAddressPage.show(
      context,
      inspection: inspection,
      contact: widget.contact,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BasicScaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              OrangeHeaderText(
                text: 'When is the inspection?',
              ),
              SizedBox(height: 10.0),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _buildTableCalendar(),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FlatButton(
                    child: Text(
                      'Skip',
                      style: TextStyle(color: Colors.grey),
                    ),
                    onPressed: _submit,
                  ),
                  InspectionFormNextButtonGreen(onPressed: _submit),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTableCalendar() {
    //final database = Provider.of<FirestoreDatabase>(context, listen: false);

    return TableCalendar(
      calendarController: _calendarController,
      onDaySelected: (_, __) {
        setState(() {
          _calendarController.setSelectedDay(_);
          final DateTime _selectedDate = _calendarController.selectedDay;
          _date = _selectedDate;
          print(_date.toIso8601String());
        });
      },
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor: Colors.blue,
        todayColor: Colors.grey,
      ),
      weekendDays: [DateTime.saturday, DateTime.sunday],
    );
  }
}
