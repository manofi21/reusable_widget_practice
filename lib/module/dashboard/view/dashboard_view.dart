// UI Target:
// https://dribbble.com/shots/19909455-Members-Contact-Page
// https://dribbble.com/shots/18147692-A-collection-of-modals-Untitled-UI

import 'package:flutter/material.dart';
import 'package:form_tutorial/core.dart';
import 'package:form_tutorial/module/dashboard/widget/row_space_evenly_widget.dart';
import 'package:form_tutorial/module/dashboard/widget/two_button_inside_a_widget.dart';
import 'package:form_tutorial/reusable_ui_kit/base_reusable_ui_kit/reu_ui_kit_dialog.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_checkbox_model.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_dropdown_model.dart';
import 'package:form_tutorial/reusable_ui_kit/entities/reu_radiobutton_model.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_danger.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_disable.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_success.dart';
import 'package:form_tutorial/reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_warning.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_checkbox.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_dropdown.dart';
import 'package:form_tutorial/reusable_ui_kit/main_reusable_ui_kit/reu_ui_kit_field_radiobutton.dart';

import '../../../enum/outlined_button_enum.dart';
import '../../../reusable_ui_kit/main_resuable_ui_kit_button/reu_ui_kit_button_info.dart';
import '../widget/image_picker_field_widget.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  Widget build(context, DashboardController controller) {
    controller.view = this;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Role Regestration Form"),
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
                      sidesLabelWidget: ReuUiKitButtonInfo(
                        textLabel: "Show Info",
                        onPressed: controller.onShowInfoFirstCharacterDialog,
                      ),
                    ),
                    const SizedBox(width: 10),
                    ReuUiKitTextFieldName(
                      controller: controller.lastNameController,
                      fieldNameType: FieldNameType.lastName,
                      sidesLabelWidget: ReuUiKitButtonInfo(
                        textLabel: "Show Info",
                        onPressed: controller.onShowInfoLastCharacterDialog,
                      ),
                    )
                  ],
                ),
                ReuUiKitTextFieldPhoneNumber(
                  controller: controller.phoneNumberController,
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowInfoNoTelpDialog,
                  ),
                ),
                ReuUiKitTextFieldAddress(
                  controller: controller.addressController,
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowInfoEmailDialog,
                  ),
                ),
                ReuUiKitTextFieldPassword(
                  controller: controller.passwordController,
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowInfoPassEmailDialog,
                  ),
                ),
                ReuUiKitFieldDropdown<String>(
                  label: "Choose Preferance",
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowinfoDropdownDialog,
                  ),
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
                  useShadowBox: true,
                ),
                ReuUiKitFieldCheckbox<String>(
                  label: "Choose Type",
                  items: [
                    ReuCheckboxModel<String>(value: 'Long Hair'),
                    ReuCheckboxModel<String>(value: 'Short Hair'),
                    ReuCheckboxModel<String>(value: 'Twin-tail Hair'),
                  ],
                  initialOther: ReuCheckboxModel<String>(value: 'Other'),
                  onChanged: (onListChange) {},
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowInfoChecboxButtonDialog,
                  ),
                  useShadowBox: true,
                ),
                ReuUiKitFieldRadiobutton<String>(
                  label: "Choose Roles",
                  items: [
                    ReuRadioButtonModel<String>(value: 'Mage'),
                    ReuRadioButtonModel<String>(value: 'Range'),
                    ReuRadioButtonModel<String>(value: 'Swordman'),
                    ReuRadioButtonModel<String>(value: 'Tanker'),
                  ],
                  initialOther: ReuRadioButtonModel<String>(value: 'Other'),
                  onChanged: (selectedValue) {},
                  useShadowBox: true,
                  sidesLabelWidget: ReuUiKitButtonInfo(
                    textLabel: "Show Info",
                    onPressed: controller.onShowInfoRadioButtonDialog,
                  ),
                ),
                ImagePickerFieldWidget(
                  imagePickerTextController:
                      controller.imagePickerTextController,
                  isLoading: controller.isLoading,
                  listMultipleImage: controller.listImg,
                  labelText: "Add Your Referance/Image Here",
                  onPressed: controller.onPressedImagePicker,
                  onPressedInfo: controller.onShowInfoImagePickerDialog,
                  footWidget: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TwoButtonInsideAWidget(
                        isSaved: controller.listImg.isNotEmpty,
                        firstWidget: ReuUiKitButtonDisable(
                          sizeButton: const Size(60, 30),
                          textLabel: "Image Empty",
                          fontSize: 13,
                          onPressed: controller.onDisabledClearButtonDialog,
                        ),
                        secondWidget: ReuUiKitButtonWarning(
                          sizeButton: const Size(60, 30),
                          fontSize: 13,
                          onPressed: controller.onClearImageDialog,
                          textLabel: "Clear Images",
                        ),
                      ),
                    )
                  ],
                ),
                TwoButtonInsideAWidget(
                  isSaved: controller.isAlreadySave,
                  firstWidget: ReuUiKitButtonSuccess(
                    textLabel: "Save",
                    onPressed: () async {
                      await controller.onSuccessSaveDialog();
                    },
                  ),
                  secondWidget: ReuUiKitButtonDanger(
                    textLabel: "Remove Data",
                    onPressed: controller.onRemoveDataFunction,
                  ),
                ),
                const SizedBox(height: 10),
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
