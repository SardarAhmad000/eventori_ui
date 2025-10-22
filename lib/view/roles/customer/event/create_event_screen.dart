import 'package:dotted_border/dotted_border.dart';
import 'package:eventori/constants/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../AppTheme/widgets/app_theme.dart';
import '../../../../constants/aap_assets.dart';
import '../../../../constants/custom_textfield.dart';
import '../../../../constants/custom_button.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController eventCategoryController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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

            // Scrollable section starts here
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
                            style: AppTextStyle.createEventQuestions,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              hintText: "Event name ",
                              controller: eventNameController,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              'What type of event are you planning?',
                              style: AppTextStyle.createEventQuestions,
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              hintText: "Event Category",
                              hintTextPadding: EdgeInsets.only(left: 90),
                              controller: eventCategoryController,
                              suffixIcon: Icon(
                                Icons.keyboard_arrow_down,
                                color: AppTheme.slateGreyColor,
                              ),
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomTextField(
                                    hintText: "Country",
                                    controller: countryController,
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppTheme.slateGreyColor,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: CustomTextField(
                                    hintText: "City",
                                    controller: cityController,
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: AppTheme.slateGreyColor,
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
                                    )
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            CustomTextField(
                              hintText: "Date",
                              controller: dateController,
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

// import 'package:dotted_border/dotted_border.dart';
// import 'package:eventori/constants/app_text_style.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
// import 'package:csc_picker/csc_picker.dart';
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
//   List<String> countries = [];
//   List<String> cities = [];
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
//     'Other',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     _loadCountries();
//   }
//
//   // Load all countries
//   void _loadCountries() {
//     countries = [
//       'Pakistan',
//       'United States',
//       'United Kingdom',
//       'Canada',
//       'Australia',
//       'India',
//       'Germany',
//       'France',
//       'Italy',
//       'Spain',
//       'China',
//       'Japan',
//       'Brazil',
//       'Mexico',
//       'South Africa',
//       // Add more countries as needed
//     ];
//   }
//
//   // Load cities based on selected country
//   void _loadCities(String country) {
//     // This is a sample implementation. In a real app, use a proper country-city database
//     Map<String, List<String>> countryCities = {
//       'Pakistan': ['Karachi', 'Lahore', 'Islamabad', 'Rawalpindi', 'Faisalabad', 'Multan', 'Peshawar', 'Quetta'],
//       'United States': ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia'],
//       'United Kingdom': ['London', 'Manchester', 'Birmingham', 'Leeds', 'Glasgow', 'Liverpool'],
//       'Canada': ['Toronto', 'Montreal', 'Vancouver', 'Calgary', 'Edmonton', 'Ottawa'],
//       'Australia': ['Sydney', 'Melbourne', 'Brisbane', 'Perth', 'Adelaide', 'Canberra'],
//       'India': ['Mumbai', 'Delhi', 'Bangalore', 'Hyderabad', 'Chennai', 'Kolkata'],
//       'Germany': ['Berlin', 'Munich', 'Hamburg', 'Frankfurt', 'Cologne', 'Stuttgart'],
//       'France': ['Paris', 'Marseille', 'Lyon', 'Toulouse', 'Nice', 'Nantes'],
//       'Italy': ['Rome', 'Milan', 'Naples', 'Turin', 'Palermo', 'Genoa'],
//       'Spain': ['Madrid', 'Barcelona', 'Valencia', 'Seville', 'Zaragoza', 'Malaga'],
//       'China': ['Beijing', 'Shanghai', 'Guangzhou', 'Shenzhen', 'Chengdu', 'Hangzhou'],
//       'Japan': ['Tokyo', 'Osaka', 'Yokohama', 'Nagoya', 'Sapporo', 'Fukuoka'],
//       'Brazil': ['São Paulo', 'Rio de Janeiro', 'Brasília', 'Salvador', 'Fortaleza'],
//       'Mexico': ['Mexico City', 'Guadalajara', 'Monterrey', 'Puebla', 'Tijuana'],
//       'South Africa': ['Johannesburg', 'Cape Town', 'Durban', 'Pretoria', 'Port Elizabeth'],
//     };
//
//     cities = countryCities[country] ?? [];
//   }
//
//   void _showCategoryPicker() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Select Event Category',
//                 style: AppTextStyle.createEventQuestions,
//               ),
//               const SizedBox(height: 16),
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: eventCategories.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(
//                         eventCategories[index],
//                         style: TextStyle(
//                           color: AppTheme.darkpurpleColor,
//                           fontSize: 14,
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           eventCategoryController.text = eventCategories[index];
//                         });
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCountryPicker() {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Select Country',
//                 style: AppTextStyle.createEventQuestions,
//               ),
//               const SizedBox(height: 16),
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: countries.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(
//                         countries[index],
//                         style: TextStyle(
//                           color: AppTheme.darkpurpleColor,
//                           fontSize: 14,
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           selectedCountry = countries[index];
//                           countryController.text = countries[index];
//                           cityController.clear();
//                           selectedCity = null;
//                           _loadCities(countries[index]);
//                         });
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   void _showCityPicker() {
//     if (selectedCountry == null || cities.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Please select a country first'),
//           backgroundColor: AppTheme.redColor,
//         ),
//       );
//       return;
//     }
//
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
//       ),
//       builder: (context) {
//         return Container(
//           padding: const EdgeInsets.symmetric(vertical: 16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Text(
//                 'Select City',
//                 style: AppTextStyle.createEventQuestions,
//               ),
//               const SizedBox(height: 16),
//               Flexible(
//                 child: ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: cities.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(
//                         cities[index],
//                         style: TextStyle(
//                           color: AppTheme.darkpurpleColor,
//                           fontSize: 14,
//                         ),
//                       ),
//                       onTap: () {
//                         setState(() {
//                           selectedCity = cities[index];
//                           cityController.text = cities[index];
//                         });
//                         Navigator.pop(context);
//                       },
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppTheme.whiteColor,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.only(top: 20.0),
//                 child: Image.asset(
//                   AppAssets.appLogo,
//                   width: 38,
//                   height: 32,
//                 ),
//               ),
//               const SizedBox(height: 16),
//               Text(
//                 'Create a New Event',
//                 style: AppTextStyle.createEventTitle,
//               ),
//               const SizedBox(height: 12),
//               Text(
//                 'My event details',
//                 style: AppTextStyle.createEventSubtitleStyle,
//               ),
//               const SizedBox(height: 16),
//               Container(
//                 width: 100.w,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(
//                     color: AppTheme.lightGrayishColor,
//                     width: 1,
//                   ),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         'What’s the name of your event?',
//                       style: AppTextStyle.createEventQuestions,
//                       ),
//                       const SizedBox(height: 8),
//                       CustomTextField(
//                         hintText: "Event name",
//                         controller: eventNameController,
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'What type of event are you planning?',
//                         style: AppTextStyle.createEventQuestions,
//                       ),
//                       const SizedBox(height: 8),
//                       CustomTextField(
//                         hintText: "Event Category",
//                         controller: eventCategoryController,
//                         enabled: true,
//                         onTap: _showCategoryPicker,
//                         suffixIcon: Icon(
//                           Icons.keyboard_arrow_down,
//                           color: AppTheme.slateGreyColor,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'Where will your event be held?',
//                             style: AppTextStyle.createEventQuestions,
//                           ),
//                           Container(
//                               width: 67,
//                               height: 17,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 14,
//                                     height: 14,
//                                     decoration: BoxDecoration(
//                                       color: AppTheme.ashGreyColor,
//                                       borderRadius: BorderRadius.circular(2),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     'Not sure',
//                                     style: AppTextStyle.NotSureStyle,
//                                   )
//                                 ],
//                               )
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Row(
//                         children: [
//                           Expanded(
//                             child: CustomTextField(
//                               hintText: "Country",
//                               controller: countryController,
//                               enabled: true,
//                               onTap: _showCountryPicker,
//                               suffixIcon: Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: AppTheme.slateGreyColor,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 12),
//                           Expanded(
//                             child: CustomTextField(
//                               hintText: "City",
//                               controller: cityController,
//                               enabled: true,
//                               onTap: _showCityPicker,
//                               suffixIcon: Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: AppTheme.slateGreyColor,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//
//                       // Date Section
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(
//                             'When is your event taking place?',
//                             style: AppTextStyle.createEventQuestions,
//                           ),
//                           Container(
//                               width: 67,
//                               height: 17,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(4),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Container(
//                                     width: 14,
//                                     height: 14,
//                                     decoration: BoxDecoration(
//                                       color: AppTheme.ashGreyColor,
//                                       borderRadius: BorderRadius.circular(2),
//                                     ),
//                                   ),
//                                   const SizedBox(width: 5),
//                                   Text(
//                                     'Not sure',
//                                     style: AppTextStyle.NotSureStyle,
//                                   )
//                                 ],
//                               )
//                           ),
//                         ],
//                       ),
//                       const SizedBox(height: 8),
//                       CustomTextField(
//                         hintText: "Date",
//                         controller: dateController,
//                         enabled: true,
//                         onTap: () async {
//                           DateTime? pickedDate = await showDatePicker(
//                             context: context,
//                             initialDate: DateTime.now(),
//                             firstDate: DateTime.now(),
//                             lastDate: DateTime(2100),
//                             builder: (context, child) {
//                               return Theme(
//                                 data: Theme.of(context).copyWith(
//                                   colorScheme: ColorScheme.light(
//                                     primary: AppTheme.cyanColor,
//                                     onPrimary: AppTheme.whiteColor,
//                                     onSurface: AppTheme.darkpurpleColor,
//                                   ),
//                                 ),
//                                 child: child!,
//                               );
//                             },
//                           );
//                           if (pickedDate != null) {
//                             setState(() {
//                               dateController.text =
//                               "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
//                             });
//                           }
//                         },
//                         suffixIcon: Icon(
//                           Icons.keyboard_arrow_down,
//                           color: AppTheme.slateGreyColor,
//                           size: 20,
//                         ),
//                       ),
//                       const SizedBox(height: 12),
//
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Expanded(
//                             child: Text(
//                               'Send me an automated reminder email 1 day before event',
//                               style: AppTextStyle.createEventQuestions,
//                             ),
//                           ),
//                           Container(
//                             width: 36,
//                             height: 20,
//                             decoration: BoxDecoration(
//                               color: AppTheme.blueColor,
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           )
//                         ],
//                       ),
//                       const SizedBox(height: 12),
//                       Text(
//                         'Upload image',
//                         style: AppTextStyle.createEventQuestions,
//                       ),
//                       const SizedBox(height: 12),
//
//                       DottedBorder(
//                         color: AppTheme.textfieldBorderColor,
//                         strokeWidth: 1,
//                         dashPattern: [5, 3],
//                         borderType: BorderType.RRect,
//                         radius: const Radius.circular(8),
//                         child: Container(
//                           height: 72,
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Image.asset(
//                                 AppAssets.uploadCloudIcon,
//                                 height: 24,
//                                 width: 24,
//                               ),
//                               const SizedBox(height: 8),
//                               Text(
//                                 'Upload',
//                                 style: AppTextStyle.createEventUpload,
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 24),
//
//               CustomButton(
//                 Text: 'Create Event',
//                 width: double.infinity,
//                 height: 48,
//                 buttonColor: AppTheme.lightCyanColor,
//                 textColor: AppTheme.whiteColor,
//                 onTap: () {
//                   // Use all values here
//                   print('Event Name: ${eventNameController.text}');
//                   print('Category: ${eventCategoryController.text}');
//                   print('Country: ${countryController.text}');
//                   print('City: ${cityController.text}');
//                   print('Date: ${dateController.text}');
//                 },
//               ),
//               const SizedBox(height: 98),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }