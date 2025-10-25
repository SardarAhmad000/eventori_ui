import 'package:country_picker_bkb/country_picker_bkb.dart';
import 'package:country_picker_bkb/model/country_model.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../AppTheme/widgets/app_theme.dart';
import '../../../../constants/aap_assets.dart';
import '../../../../constants/custom_button.dart';
import '../../../../constants/custom_checkbox.dart';
import '../../../../constants/custom_date_picker.dart';
import '../../../../constants/custom_dropdown.dart';
import '../../../../constants/custom_textfield.dart';
import '../../../../constants/custom_toggle.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventdateController = TextEditingController();

  String? selectedCategory;
  String? selectedCountry;
  String? selectedCity;
  final ValueNotifier<CountryModel> _countryVN = ValueNotifier(CountryModel());
  final ValueNotifier<CityModel> _cityVN = ValueNotifier(CityModel());
  final GlobalKey _countryKey = GlobalKey();
  final GlobalKey _cityKey = GlobalKey();
  bool isNotSureChecked = false;
  bool isNotSureDate = false;
  bool isReminderEnabled = false;

  // Event categories list
  final List<String> eventCategories = [
    'Conference',
    'Workshop',
    'Seminar',
    'Meeting',
    'Concert',
    'Exhibition',
    'Party',
    'Sports',
    'Other',
  ];

  @override
  void initState() {
    super.initState();
    // Load country data once for the countrySelect dialog
    loadCountryData();

    // Attach listeners once
    _countryVN.addListener(() {
      setState(() {
        selectedCountry = _countryVN.value.name;
        // Reset city when country changes
        selectedCity = null;
        _cityVN.value = CityModel();
      });
    });

    _cityVN.addListener(() {
      setState(() {
        selectedCity = _cityVN.value.name;
      });
    });
  }

  // Show success dialog
  void _showSuccessDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppTheme.whiteColor,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 4.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Success Icon
                Container(
                    width: 40,
                    height: 40,
                    decoration:  BoxDecoration(
                      color: AppTheme.greenColor,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                          AppAssets.vectorIcon,
                          fit: BoxFit.contain
                      ),
                    )
                ),

                SizedBox(height: 3.h),

                // Title
                Text(
                    'Event created\nsuccessfully',
                    textAlign: TextAlign.center,
                    style: AppTextStyle.dailogeTitle
                ),

                SizedBox(height: 1.5.h),
                // Subtitle
                Text(
                  'Event created — let the planning begin.',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.dailogeSubTitle,
                ),

                SizedBox(height: 3.h),

                // Next Button
                CustomButton(
                  Text: 'Next',
                  width: double.infinity,
                  borderColor: AppTheme.greenColor,
                  height: 48,
                  buttonColor: AppTheme.greenColor,
                  textColor: AppTheme.whiteColor,
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Image.asset(
                AppAssets.appLogo,
                width: 38,
                height: 32,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Create a New Event',
              style: AppTextStyle.createEventTitle,
            ),

            const SizedBox(height: 12),

            Text(
              'My event details',
              style: AppTextStyle.createEventSubtitleStyle,
            ),

            const SizedBox(height: 16),

            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.lightGrayishColor,
                          width: 1,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'What’s the name of your event?',
                              style: AppTextStyle.blackTextStyle,
                            ),

                            const SizedBox(height: 8),

                            CustomTextField(
                              fieldBorderColor: AppTheme.textfieldBorderColor,
                              hintText: "Event name",
                              controller: eventNameController,
                            ),

                            const SizedBox(height: 12),

                            Text(
                              'What type of event are you planning?',
                              style: AppTextStyle.blackTextStyle,
                            ),

                            const SizedBox(height: 8),

                            CustomDropdownField(
                              hintText: "Event Category",
                              value: selectedCategory,
                              items: eventCategories.map((category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCategory = value;
                                });
                              },
                              hintTextColor: AppTheme.silverColor,
                              inputTextColor: AppTheme.darkpurpleColor,
                              dropdownIconColor: AppTheme.slateGreyColor,
                            ),

                            const SizedBox(height: 12),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Where will your event be held?',
                                  style: AppTextStyle.blackTextStyle,
                                ),
                                Container(
                                  width: 67,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckbox(
                                        initialValue: isNotSureChecked,
                                        label: 'Not sure',
                                        labelStyle: AppTextStyle.NotSureStyle,
                                        onChanged: (value) {
                                          setState(() {
                                            isNotSureChecked = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    key: _countryKey,
                                    onTap: () async {
                                      final renderBox = _countryKey.currentContext!.findRenderObject() as RenderBox;
                                      final position = renderBox.localToGlobal(Offset.zero);
                                      final size = renderBox.size;
                                      await loadCountryData();
                                      countrySelect(
                                        context,
                                        position,
                                        size,
                                        _countryVN,
                                      );
                                    },
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppTheme.textfieldBorderColor.withOpacity(.3),
                                          width: 1.3,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            selectedCountry ?? 'Country',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: selectedCountry == null ? AppTheme.silverColor : AppTheme.darkpurpleColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Icon(Icons.keyboard_arrow_down, color: AppTheme.slateGreyColor, size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: GestureDetector(
                                    key: _cityKey,
                                    onTap: selectedCountry == null
                                        ? null
                                        : () async {
                                      final renderBox = _cityKey.currentContext!.findRenderObject() as RenderBox;
                                      final position = renderBox.localToGlobal(Offset.zero);
                                      final size = renderBox.size;
                                      await loadCityData(country: _countryVN);
                                      citySelect(
                                        context,
                                        position,
                                        size,
                                        _cityVN,
                                        country: _countryVN,
                                      );
                                    },
                                    child: Container(
                                      height: 48,
                                      decoration: BoxDecoration(
                                        color: AppTheme.whiteColor,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: AppTheme.textfieldBorderColor.withOpacity(.3),
                                          width: 1.3,
                                        ),
                                      ),
                                      padding: const EdgeInsets.symmetric(horizontal: 12),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            selectedCity ?? 'City',
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: selectedCity == null ? AppTheme.silverColor : AppTheme.darkpurpleColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          Icon(Icons.keyboard_arrow_down, color: AppTheme.slateGreyColor, size: 20),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 20),

                            // Date Section
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'When is your event taking place?',
                                  style: AppTextStyle.blackTextStyle,
                                ),
                                Container(
                                  width: 67,
                                  height: 17,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Row(
                                    children: [
                                      CustomCheckbox(
                                        initialValue: isNotSureDate,
                                        label: 'Not sure',
                                        labelStyle: AppTextStyle.NotSureStyle,
                                        onChanged: (value) {
                                          setState(() {
                                            isNotSureDate = value;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            CustomDateTextField(
                              controller: eventdateController,
                              hintText: "Date",
                              fieldBorderColor: AppTheme.textfieldBorderColor,
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppTheme.slateGreyColor,
                                size: 20 ,
                              ),
                            ),
                            // CustomTextField(
                            //   fieldBorderColor: AppTheme.textfieldBorderColor,
                            //   hintText: "Date",
                            //   controller: eventdateController,
                            //   enabled: true,
                            //   onTap: () async {
                            //     DateTime? pickedDate = await showDatePicker(
                            //       context: context,
                            //       initialDate: DateTime.now(),
                            //       firstDate: DateTime.now(),
                            //       lastDate: DateTime(2100),
                            //       builder: (context, child) {
                            //         return Theme(
                            //           data: Theme.of(context).copyWith(
                            //             colorScheme: ColorScheme.light(
                            //               primary: AppTheme.cyanColor,
                            //               onPrimary: AppTheme.whiteColor,
                            //               onSurface: AppTheme.darkpurpleColor,
                            //             ),
                            //           ),
                            //           child: child!,
                            //         );
                            //       },
                            //     );
                            //     if (pickedDate != null) {
                            //       setState(() {
                            //         eventdateController.text =
                            //         "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            //       });
                            //     }
                            //   },
                            //   suffixIcon: Icon(
                            //     Icons.keyboard_arrow_down,
                            //     color: AppTheme.slateGreyColor,
                            //     size: 20,
                            //   ),
                            // ),
                            // //

                            const SizedBox(height: 12),

                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Send me an automated reminder email 1 day before event',
                                    style: AppTextStyle.blackTextStyle,
                                  ),
                                ),
                                CustomToggleSwitch(
                                  initialValue: isReminderEnabled,
                                  onChanged: (value) {
                                    setState(() {
                                      isReminderEnabled = value;
                                    });
                                    print('Toggle changed: $value');
                                  },
                                  activeColor: AppTheme.blueColor,
                                  inactiveColor:AppTheme.textfieldBorderColor,
                                  width: 36,
                                  height: 20,
                                ),
                              ],
                            ),

                            const SizedBox(height: 12),

                            Text(
                              'Upload image',
                              style: AppTextStyle.blackTextStyle,
                            ),

                            const SizedBox(height: 12),

                            DottedBorder(
                              color: AppTheme.textfieldBorderColor,
                              strokeWidth: 1,
                              dashPattern: const [5, 3],
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(8),
                              child: Container(
                                height: 72,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppAssets.uploadCloudIcon,
                                      height: 24,
                                      width: 24,
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                      'Upload',
                                      style: AppTextStyle.createEventUpload,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      Text: 'Create Event',
                      width: double.infinity,
                      height: 48,
                      buttonColor: AppTheme.lightCyanColor,
                      textColor: AppTheme.whiteColor,
                      onTap: () {
                        print('Event Name: ${eventNameController.text}');
                        print('Category: $selectedCategory');
                        print('Country: $selectedCountry');
                        print('City: $selectedCity');
                        print('Date: ${eventdateController.text}');
                        _showSuccessDialog();
                      },
                    ),
                    const SizedBox(height: 98),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}