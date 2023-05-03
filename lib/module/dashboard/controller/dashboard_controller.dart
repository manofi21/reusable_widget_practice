import 'package:flutter/material.dart';
import 'package:form_tutorial/state_util.dart';
import '../view/dashboard_view.dart';

class DashboardController extends State<DashboardView> implements MvcController {
  static late DashboardController instance;
  late DashboardView view;

  final formKey = GlobalKey<FormState>();

  final fistNameController = TextEditingController();
  final lastNameController = TextEditingController();

  final phoneNumberController = TextEditingController();

  final passwordController = TextEditingController();

  final addressController = TextEditingController();

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() => super.dispose();

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}