import "package:flutter/material.dart";
import "package:icons_plus/icons_plus.dart";
import "package:keyboard_dismisser/keyboard_dismisser.dart";
import "package:roomrentalapp/components/customtextfield.dart";
import "package:roomrentalapp/pages/contact.dart";
import "package:roomrentalapp/themes/colors.dart";
import "package:roomrentalapp/themes/texts.dart";

class AddRoomPage extends StatefulWidget {
  const AddRoomPage({super.key});

  @override
  State<AddRoomPage> createState() => _AddRoomPageState();
}

class _AddRoomPageState extends State<AddRoomPage> {
  final floorController = TextEditingController();
  final locationController = TextEditingController();
  final rentController = TextEditingController();
  final roomNoController = TextEditingController();
  final contactController = TextEditingController();
  final descriptionController = TextEditingController();
  final termsController = TextEditingController();
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return KeyboardDismisser(
      gestures: const [GestureType.onTap, GestureType.onPanUpdateAnyDirection],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.primaryColor,
          title: const Text(
            "Add Room",
            style: AppText.appbarText,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.keyboard_arrow_left,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.35,
                    decoration: BoxDecoration(
                      color: AppColor.fillColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        size: 80,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(
                    color: AppColor.accentColor,
                    thickness: 2,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Room Details:",
                      style: AppText.blacknormalText,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: Stepper(
                      type: StepperType.horizontal,
                      steps: getSteps(),
                      currentStep: currentStep,
                      connectorColor: const MaterialStatePropertyAll(
                        AppColor.primaryColor,
                      ),
                      onStepContinue: () {
                        final isLastStep = currentStep == getSteps().length - 1;
                        if (isLastStep) {
                          debugPrint("Complete");
                        } else {
                          if (currentStep == 0) {
                            setState(() {
                              currentStep += 1;
                            });
                          } else if (currentStep == 1) {
                            setState(() {
                              currentStep += 1;
                            });
                          }
                        }
                      },
                      onStepTapped: (value) => setState(
                        () {
                          currentStep = value;
                        },
                      ),
                      onStepCancel: currentStep == 0
                          ? null
                          : () => setState(() => currentStep -= 1),
                      controlsBuilder: (context, details) {
                        return Container(
                          margin: const EdgeInsets.only(top: 20, right: 5),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              if (currentStep != 0)
                                Expanded(
                                  child: SizedBox(
                                    height: 50,
                                    child: ElevatedButton(
                                      onPressed: details.onStepCancel,
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColor.primaryColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        side: const BorderSide(
                                          width: 3,
                                          color: Color.fromARGB(88, 0, 0, 0),
                                        ),
                                      ),
                                      child: const Text(
                                        'Back',
                                        style: AppText.whitenormalbuttonText,
                                      ),
                                    ),
                                  ),
                                ),
                              const SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: SizedBox(
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: details.onStepContinue,
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColor.primaryColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      side: const BorderSide(
                                        width: 3,
                                        color: Color.fromARGB(88, 0, 0, 0),
                                      ),
                                    ),
                                    child: const Text(
                                      'Next',
                                      style: AppText.whitenormalbuttonText,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() {
    return [
      Step(
        state: currentStep > 0 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 0,
        title: const Text(
          "Room",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            CustomTextField(
              controller: floorController,
              leading: Icons.abc_outlined,
              title: "Floor",
              type: TextInputType.text,
              action: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: locationController,
              leading: Icons.location_city_outlined,
              title: "Location",
              type: TextInputType.text,
              action: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: rentController,
              leading: Icons.money_outlined,
              title: "Rent",
              type: TextInputType.number,
              action: TextInputAction.next,
            ),
          ],
        ),
      ),
      Step(
        state: currentStep > 1 ? StepState.complete : StepState.indexed,
        isActive: currentStep >= 1,
        title: const Text(
          "Number",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            CustomTextField(
              controller: roomNoController,
              leading: Icons.numbers_outlined,
              title: "Room Number",
              type: TextInputType.number,
              action: TextInputAction.next,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: contactController,
              leading: Icons.phone_outlined,
              title: "Contact Number",
              type: TextInputType.number,
              action: TextInputAction.next,
            ),
          ],
        ),
      ),
      Step(
        isActive: currentStep >= 2,
        title: const Text(
          "Info",
          style: AppText.blacksmallText,
        ),
        content: Column(
          children: [
            SizedBox(
              height: 70,
              child: CustomTextForm(
                controller: descriptionController,
                label: "Description",
                leading: Icons.description_outlined,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 70,
              child: CustomTextForm(
                controller: termsController,
                label: "Terms and Condition",
                leading: Icons.gavel_outlined,
              ),
            ),
          ],
        ),
      )
    ];
  }
}
