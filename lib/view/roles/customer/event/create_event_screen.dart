// import 'package:dotted_border/dotted_border.dart';
// import 'package:eventori/constants/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
// import '../../../../AppTheme/widgets/app_theme.dart';
// import '../../../../constants/aap_assets.dart';
// import '../../../../constants/custom_textfield.dart';
// import '../../../../constants/custom_button.dart';
//
// class CreateEventScreen extends StatefulWidget {
//   const CreateEventScreen({super.key});
//
//   @override
//   State<CreateEventScreen> createState() => _CreateEventScreenState();
// }
//
// class _CreateEventScreenState extends State<CreateEventScreen> {
//   final TextEditingController eventNameController = TextEditingController();
//   final TextEditingController eventCategoryController = TextEditingController();
//   final TextEditingController countryController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();
//
//   String? selectedCountry;
//   String? selectedCity;
//   String? selectedCategory;
//
//   // Event categories list
//   final List<String> eventCategories = [
//     'Conference',
//     'Workshop',
//     'Seminar',
//     'Meeting',
//     'Concert',
//     'Exhibition',
//     'Party',
//     'Sports',
//     'Festival',
//     'Networking',
//     'Other',
//   ];
//
//   // Countries and their cities
//   final Map<String, List<String>> countryCities = {
//     'Pakistan': ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Faisalabad', 'Multan', 'Peshawar', 'Quetta'],
//     'United States': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia'],
//     'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Leeds', 'Glasgow', 'Liverpool'],
//     'Canada': ['Toronto', 'Montreal', 'Vancouver', 'Calgary', 'Edmonton', 'Ottawa'],
//     'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide', 'Canberra'],
//     'India': ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata'],
//     'Germany': ['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne', 'Stuttgart'],
//     'France': ['Paris', 'Marseille', 'Lyon', 'Toulouse', 'Nice', 'Nantes'],
//     'Italy': ['Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genoa'],
//     'Spain': ['Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga'],
//   };
//
//   List<String> get countries => countryCities.keys.toList();
//   List<String> get cities => selectedCountry != null ? (countryCities[selectedCountry!] ?? []) : [];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.whiteColor,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const SizedBox(height: 16),
//             Padding(
//               padding: const EdgeInsets.only(top: 20.0),
//               child: Image.asset(
//                 AppAssets.appLogo,
//                 width: 38,
//                 height: 32,
//               ),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Create a New Event',
//               style: AppTextStyle.createEventTitle,
//             ),
//             const SizedBox(height: 12),
//             Text(
//               'My event details',
//               style: AppTextStyle.createEventSubtitleStyle,
//             ),
//             const SizedBox(height: 16),
//
//             // Scrollable section starts here
//             Expanded(
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 100.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(
//                           color: AppTheme.lightGrayishColor,
//                           width: 1,
//                         ),
//                       ),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               'What’s the name of your event?',
//                               style: AppTextStyle.createEventQuestions,
//                             ),
//                             const SizedBox(height: 8),
//                             CustomTextField(
//                               hintText: "Event name ",
//                               controller: eventNameController,
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               'What type of event are you planning?',
//                               style: AppTextStyle.createEventQuestions,
//                             ),
//                             const SizedBox(height: 8),
//                             Container(
//                               height: 48,
//                               decoration: BoxDecoration(
//                                 color: AppTheme.greyColor,
//                                 borderRadius: BorderRadius.circular(8),
//                                 border: Border.all(
//                                   color: AppTheme.textfieldBorderColor.withOpacity(.3),
//                                   width: 1.3,
//                                 ),
//                               ),
//                               child: DropdownButtonHideUnderline(
//                                 child: DropdownButton2<String>(
//                                   isExpanded: true,
//                                   hint: Text(
//                                     'Event Category',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       color: AppTheme.silverColor,
//                                     ),
//                                   ),
//                                   value: selectedCategory,
//                                   items: eventCategories.map((String category) {
//                                     return DropdownMenuItem<String>(
//                                       value: category,
//                                       child: Text(
//                                         category,
//                                         style: TextStyle(
//                                           fontSize: 14,
//                                           color: AppTheme.darkpurpleColor,
//                                         ),
//                                       ),
//                                     );
//                                   }).toList(),
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectedCategory = newValue;
//                                       eventCategoryController.text = newValue ?? '';
//                                     });
//                                   },
//                                   buttonStyleData: ButtonStyleData(
//                                     padding: const EdgeInsets.symmetric(horizontal: 16),
//                                     height: 48,
//                                   ),
//                                   iconStyleData: IconStyleData(
//                                     icon: Icon(
//                                       Icons.keyboard_arrow_down,
//                                       color: AppTheme.slateGreyColor,
//                                     ),
//                                   ),
//                                   dropdownStyleData: DropdownStyleData(
//                                     maxHeight: 300,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(8),
//                                       color: AppTheme.whiteColor,
//                                     ),
//                                   ),
//                                   menuItemStyleData: const MenuItemStyleData(
//                                     height: 40,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Where will your event be held?',
//                                   style: AppTextStyle.createEventQuestions,
//                                 ),
//                                 Container(
//                                     width: 67,
//                                     height: 17,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           width: 14,
//                                           height: 14,
//                                           decoration: BoxDecoration(
//                                             color: AppTheme.ashGreyColor,
//                                             borderRadius: BorderRadius.circular(2),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           'Not sure',
//                                           style: AppTextStyle.NotSureStyle,
//                                         )
//                                       ],
//                                     )
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Row(
//                               children: [
//                                 Expanded(
//                                   child: Container(
//                                     height: 48,
//                                     decoration: BoxDecoration(
//                                       color: AppTheme.greyColor,
//                                       borderRadius: BorderRadius.circular(8),
//                                       border: Border.all(
//                                         color: AppTheme.textfieldBorderColor.withOpacity(.3),
//                                         width: 1.3,
//                                       ),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton2<String>(
//                                         isExpanded: true,
//                                         hint: Text(
//                                           'Country',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: AppTheme.silverColor,
//                                           ),
//                                         ),
//                                         value: selectedCountry,
//                                         items: countries.map((String country) {
//                                           return DropdownMenuItem<String>(
//                                             value: country,
//                                             child: Text(
//                                               country,
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 color: AppTheme.darkpurpleColor,
//                                               ),
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           );
//                                         }).toList(),
//                                         onChanged: (String? newValue) {
//                                           setState(() {
//                                             selectedCountry = newValue;
//                                             countryController.text = newValue ?? '';
//                                             selectedCity = null;
//                                             cityController.clear();
//                                           });
//                                         },
//                                         buttonStyleData: ButtonStyleData(
//                                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                                           height: 48,
//                                         ),
//                                         iconStyleData: IconStyleData(
//                                           icon: Icon(
//                                             Icons.keyboard_arrow_down,
//                                             color: AppTheme.slateGreyColor,
//                                           ),
//                                         ),
//                                         dropdownStyleData: DropdownStyleData(
//                                           maxHeight: 300,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(8),
//                                             color: AppTheme.whiteColor,
//                                           ),
//                                         ),
//                                         menuItemStyleData: const MenuItemStyleData(
//                                           height: 40,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const SizedBox(width: 12),
//                                 Expanded(
//                                   child: Container(
//                                     height: 48,
//                                     decoration: BoxDecoration(
//                                       color: AppTheme.greyColor,
//                                       borderRadius: BorderRadius.circular(8),
//                                       border: Border.all(
//                                         color: AppTheme.textfieldBorderColor.withOpacity(.3),
//                                         width: 1.3,
//                                       ),
//                                     ),
//                                     child: DropdownButtonHideUnderline(
//                                       child: DropdownButton2<String>(
//                                         isExpanded: true,
//                                         hint: Text(
//                                           'City',
//                                           style: TextStyle(
//                                             fontSize: 14,
//                                             color: AppTheme.silverColor,
//                                           ),
//                                         ),
//                                         value: selectedCity,
//                                         items: cities.isEmpty
//                                             ? []
//                                             : cities.map((String city) {
//                                                 return DropdownMenuItem<String>(
//                                                   value: city,
//                                                   child: Text(
//                                                     city,
//                                                     style: TextStyle(
//                                                       fontSize: 14,
//                                                       color: AppTheme.darkpurpleColor,
//                                                     ),
//                                                     overflow: TextOverflow.ellipsis,
//                                                   ),
//                                                 );
//                                               }).toList(),
//                                         onChanged: selectedCountry == null
//                                             ? null
//                                             : (String? newValue) {
//                                                 setState(() {
//                                                   selectedCity = newValue;
//                                                   cityController.text = newValue ?? '';
//                                                 });
//                                               },
//                                         buttonStyleData: ButtonStyleData(
//                                           padding: const EdgeInsets.symmetric(horizontal: 16),
//                                           height: 48,
//                                         ),
//                                         iconStyleData: IconStyleData(
//                                           icon: Icon(
//                                             Icons.keyboard_arrow_down,
//                                             color: AppTheme.slateGreyColor,
//                                           ),
//                                         ),
//                                         dropdownStyleData: DropdownStyleData(
//                                           maxHeight: 300,
//                                           decoration: BoxDecoration(
//                                             borderRadius: BorderRadius.circular(8),
//                                             color: AppTheme.whiteColor,
//                                           ),
//                                         ),
//                                         menuItemStyleData: const MenuItemStyleData(
//                                           height: 40,
//                                         ),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 20),
//
//                             // Date Section
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'When is your event taking place?',
//                                   style: AppTextStyle.createEventQuestions,
//                                 ),
//                                 Container(
//                                     width: 67,
//                                     height: 17,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(4),
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Container(
//                                           width: 14,
//                                           height: 14,
//                                           decoration: BoxDecoration(
//                                             color: AppTheme.ashGreyColor,
//                                             borderRadius: BorderRadius.circular(2),
//                                           ),
//                                         ),
//                                         const SizedBox(width: 5),
//                                         Text(
//                                           'Not sure',
//                                           style: AppTextStyle.NotSureStyle,
//                                         )
//                                       ],
//                                     )
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 8),
//                             CustomTextField(
//                               hintText: "Date",
//                               controller: dateController,
//                               suffixIcon: Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: AppTheme.slateGreyColor,
//                                 size: 20,
//                               ),
//                             ),
//                             const SizedBox(height: 12),
//
//                             Row(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Expanded(
//                                   child: Text(
//                                     'Send me an automated reminder email 1 day before event',
//                                     style: AppTextStyle.createEventQuestions,
//                                   ),
//                                 ),
//                                 Container(
//                                   width: 36,
//                                   height: 20,
//                                   decoration: BoxDecoration(
//                                     color: AppTheme.blueColor,
//                                     borderRadius: BorderRadius.circular(12),
//                                   ),
//                                 )
//                               ],
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               'Upload image',
//                               style: AppTextStyle.createEventQuestions,
//                             ),
//                             const SizedBox(height: 12),
//
//                             DottedBorder(
//                               color: AppTheme.textfieldBorderColor,
//                               strokeWidth: 1,
//                               dashPattern: [5, 3],
//                               borderType: BorderType.RRect,
//                               radius: const Radius.circular(8),
//                               child: Container(
//                                 height: 72,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(8),
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Image.asset(
//                                       AppAssets.uploadCloudIcon,
//                                       height: 24,
//                                       width: 24,
//                                     ),
//                                     const SizedBox(height: 8),
//                                     Text(
//                                       'Upload',
//                                       style: AppTextStyle.createEventUpload,
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     const SizedBox(height: 24),
//
//                     CustomButton(
//                       Text: 'Create Event',
//                       width: double.infinity,
//                       height: 48,
//                       buttonColor: AppTheme.lightCyanColor,
//                       textColor: AppTheme.whiteColor,
//                       onTap: () {
//
//                       },
//                     ),
//                     const SizedBox(height: 98),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../AppTheme/widgets/app_theme.dart';
import '../../../../constants/aap_assets.dart';
import '../../../../constants/custom_dropdown.dart';
import '../../../../constants/custom_textfield.dart';
import '../../../../constants/custom_button.dart';// Add this import

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedCategory;
  String? selectedCountry;
  String? selectedCity;
  List<String> countries = [];
  List<String> cities = [];

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
    _loadCountries();
  }

  // Load all countries
  void _loadCountries() {
    countries = [
      'Pakistan',
      'United States',
      'United Kingdom',
      'Canada',
      'Australia',
      'India',
      'Germany',
      'France',
      'Italy',
      'Spain',
      'China',
      'Japan',
      'Brazil',
      'Mexico',
      'South Africa',
    ];
  }

  // Load cities based on selected country
  void _loadCities(String country) {
    Map<String, List<String>> countryCities = {
      'Pakistan': ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Faisalabad', 'Multan', 'Peshawar', 'Quetta'],
      'United States': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia'],
      'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Leeds', 'Glasgow', 'Liverpool'],
      'Canada': ['Toronto', 'Montreal', 'Vancouver', 'Calgary', 'Edmonton', 'Ottawa'],
      'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide', 'Canberra'],
      'India': ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata'],
      'Germany': ['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne', 'Stuttgart'],
      'France': ['Paris', 'Marseille', 'Lyon', 'Toulouse', 'Nice', 'Nantes'],
      'Italy': ['Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genoa'],
      'Spain': ['Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga'],
      'China': ['Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou'],
      'Japan': ['Tokyo', 'Osaka', 'Yokohama', 'Nagoya', 'Sapporo', 'Fukuoka'],
      'Brazil': ['São Paulo', 'Rio de Janeiro', 'Brasília', 'Salvador', 'Fortaleza'],
      'Mexico': ['Mexico City', 'Guadalajara', 'Monterrey', 'Puebla', 'Tijuana'],
      'South Africa': ['Johannesburg', 'Cape Town', 'Durban', 'Pretoria', 'Port Elizabeth'],
    };

    cities = countryCities[country] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      body: SingleChildScrollView(
        child: Padding(
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
                      style: AppTextStyle.createEventQuestions,
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        activeFillColor: AppTheme.whiteColor,      // When focused
                        inactiveFillColor: AppTheme.whiteColor,    // When not focused and empty
                        selectedFillColor: AppTheme.whiteColor,    // When has text
                        fieldBorderColor: AppTheme.textfieldBorderColor,
                        hintText: "Event name",
                        controller: eventNameController,
                      ),
                      const SizedBox(height: 12),

                      Text(
                        'What type of event are you planning?',
                        style: AppTextStyle.createEventQuestions,
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
                            style: AppTextStyle.createEventQuestions,
                          ),
                          Container(
                            width: 67,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: AppTheme.ashGreyColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Not sure',
                                  style: AppTextStyle.NotSureStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      Row(
                        children: [
                          Expanded(
                            child: CustomDropdownField(
                              hintText: "Country",
                              value: selectedCountry,
                              items: countries.map((country) {
                                return DropdownMenuItem<String>(
                                  value: country,
                                  child: Text(country),
                                );
                              }).toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                  selectedCity = null;
                                  if (value != null) {
                                    _loadCities(value);
                                  } else {
                                    cities = [];
                                  }
                                });
                              },
                              hintTextColor: AppTheme.silverColor,
                              inputTextColor: AppTheme.darkpurpleColor,
                              dropdownIconColor: AppTheme.slateGreyColor,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomDropdownField(
                              hintText: "City",
                              value: selectedCity,
                              items: cities.map((city) {
                                return DropdownMenuItem<String>(
                                  value: city,
                                  child: Text(city),
                                );
                              }).toList(),
                              onChanged: selectedCountry == null
                                  ? null
                                  : (value) {
                                setState(() {
                                  selectedCity = value;
                                });
                              },
                              hintTextColor: AppTheme.silverColor,
                              inputTextColor: AppTheme.darkpurpleColor,
                              dropdownIconColor: AppTheme.slateGreyColor,
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
                            style: AppTextStyle.createEventQuestions,
                          ),
                          Container(
                            width: 67,
                            height: 17,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Row(
                              children: [
                                Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    color: AppTheme.ashGreyColor,
                                    borderRadius: BorderRadius.circular(2),
                                  ),
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Not sure',
                                  style: AppTextStyle.NotSureStyle,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        activeFillColor: AppTheme.whiteColor,
                        inactiveFillColor: AppTheme.whiteColor,
                        selectedFillColor: AppTheme.whiteColor,
                        fieldBorderColor: AppTheme.textfieldBorderColor,
                        hintText: "Date",
                        controller: dateController,
                        enabled: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2100),
                            builder: (context, child) {
                              return Theme(
                                data: Theme.of(context).copyWith(
                                  colorScheme: ColorScheme.light(
                                    primary: AppTheme.cyanColor,
                                    onPrimary: AppTheme.whiteColor,
                                    onSurface: AppTheme.darkpurpleColor,
                                  ),
                                ),
                                child: child!,
                              );
                            },
                          );
                          if (pickedDate != null) {
                            setState(() {
                              dateController.text =
                              "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                            });
                          }
                        },
                        suffixIcon: Icon(
                          Icons.keyboard_arrow_down,
                          color: AppTheme.slateGreyColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(height: 12),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              'Send me an automated reminder email 1 day before event',
                              style: AppTextStyle.createEventQuestions,
                            ),
                          ),
                          Container(
                            width: 36,
                            height: 20,
                            decoration: BoxDecoration(
                              color: AppTheme.blueColor,
                              borderRadius: BorderRadius.circular(12),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Upload image',
                        style: AppTextStyle.createEventQuestions,
                      ),
                      const SizedBox(height: 12),

                      DottedBorder(
                        color: AppTheme.textfieldBorderColor,
                        strokeWidth: 1,
                        dashPattern: [5, 3],
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
                  // Use all values here
                  print('Event Name: ${eventNameController.text}');
                  print('Category: $selectedCategory');
                  print('Country: $selectedCountry');
                  print('City: $selectedCity');
                  print('Date: ${dateController.text}');
                },
              ),
              const SizedBox(height: 98),
            ],
          ),
        ),
      ),
    );
  }
}