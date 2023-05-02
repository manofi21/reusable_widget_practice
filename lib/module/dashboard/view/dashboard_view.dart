// UI Target:
// https://dribbble.com/shots/19909455-Members-Contact-Page
// https://dribbble.com/shots/18147692-A-collection-of-modals-Untitled-UI

import 'package:flutter/material.dart';
import 'package:form_tutorial/core.dart';
import 'package:form_tutorial/module/dashboard/widget/row_space_evenly_widget.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_checkbox_model.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_dropdown_model.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_radiobutton_model.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_checkbox.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_dropdown.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_radiobutton.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: controller.formKey,
          child: Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RowSpaceEvenlyWidget(
                  children: [
                    ReuUiKitTextFieldName(
                      controller: controller.fistNameController,
                      fieldNameType: FieldNameType.firstName,
                    ),
                    const SizedBox(width: 10),
                    ReuUiKitTextFieldName(
                      controller: controller.lastNameController,
                      fieldNameType: FieldNameType.lastName,
                    )
                  ],
                ),
                ReuUiKitTextFieldPhoneNumber(
                  controller: controller.phoneNumberController,
                ),
                ReuUiKitTextFieldPassword(
                  controller: controller.passwordController,
                ),
                ReuUiKitTextFieldAddress(
                  controller: controller.addressController,
                ),
                ReuUiKitFieldDropdown<String>(
                  label: "Choose Preferance",
                  emptyValue: ReuDropdownModel<String>(value: '-'),
                  items: <ReuDropdownModel<String>>[
                    ReuDropdownModel<String>(value: "Gamer"),
                    ReuDropdownModel<String>(value: "Weeb"),
                    ReuDropdownModel<String>(value: "Tokusatsu"),
                    ReuDropdownModel<String>(value: "Western Comics"),
                    ReuDropdownModel<String>(value: "Western Superhero Only"),
                  ],
                  onChanged: (value) {
                    debugPrint(value.value);
                  },
                  indexOfInitialValue: 0,
                ),
                ReuUiKitFieldCheckbox<String>(
                  label: "Choose Prefereance",
                  items: [
                    ReuChecboxModel<String>(value: 'Long Hair'),
                    ReuChecboxModel<String>(value: 'Short Hair'),
                    ReuChecboxModel<String>(value: 'Twin-tail Hair'),
                  ],
                  onChanged: (onListChange) {},
                ),
                ReuUiKitFieldRadiobutton<String>(
                  label: "Choose Referance",
                  items: [
                    ReuRadioButtonModel<String>(value: 'Long Hair'),
                    ReuRadioButtonModel<String>(value: 'Short Hair'),
                    ReuRadioButtonModel<String>(value: 'Twin-tail Hair'),
                  ],
                  onChanged: (selectedValue) {},
                ),
                ImagePickerFieldView(
                  labelText: "Add Image",
                  onChanged: (value) {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  State<DashboardView> createState() => DashboardController();
}
