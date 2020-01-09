export 'package:recipes/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/blocs/settings_bloc.dart';
import 'package:recipes/models/settings_model.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<SettingsEvent, Settings>(
      bloc: SettingsBloc.of(context),
      builder: (context, settings) => Form(
        child: Column(
          children: <Widget>[
            DropdownButtonFormField<HomeLayout>(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.list),
                prefixText: 'Home Layout',
              ),
              value: settings.homeLayout,
              items: <DropdownMenuItem<HomeLayout>>[
                DropdownMenuItem<HomeLayout>(
                  value: HomeLayout.tiles,
                  child: Text('Tiles'),
                ),
                DropdownMenuItem<HomeLayout>(
                  value: HomeLayout.cards,
                  child: Text('Cards'),
                ),
              ],
              onChanged: (HomeLayout value) {
                SettingsBloc.of(context).dispatch(HomeLayoutEvent(value));
              },
            ),
          ],
        ),
      ),
    );
  }
}