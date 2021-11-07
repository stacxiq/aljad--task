import 'package:flutter/material.dart';
import 'package:test1/data_layer/notifier/user_notifier.dart';
import 'package:provider/provider.dart';

class PaginationPage extends StatefulWidget {
  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  late UserProvider _userProvider;
  @override
  void initState() {
    // TODO: implement initState
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _userProvider.getList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ticket'),
      ),
      body: Center(
        child: Text('Pagination'),
      ),
    );
  }
}
