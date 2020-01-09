export 'package:recipes/widgets/main_drawer.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:recipes/blocs/user_bloc.dart';
import 'package:recipes/models/user_model.dart';
import 'package:recipes/pages/settings_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: <Widget>[
          _buildUserSelection(),
          _buildSettingsTile(),
        ],
      ),
    );
  }

  Widget _buildUserSelection() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage('https://cdn.thepennyhoarder.com/wp-content/uploads/2016/12/22153808/EATWITH1116_2.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        margin: EdgeInsets.only(top: 30),
        padding: EdgeInsets.all(12),
        height: 140,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CircleAvatar(radius: 28),
            BlocBuilder<UserEvent, User>(
              bloc: UserBloc.of(context),
              builder: (context, user) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    user?.name,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    user?.email,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.white.withAlpha(192),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsTile() {
    return ListTile(
      leading: Icon(Icons.settings),
      title: Text('Settings'),
      onTap: () {
        Navigator.pop(context);
        _navigateTo(SettingsPage());
      },
    );
  }

  void _navigateTo(Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => widget,
      ),
    );
  }
}