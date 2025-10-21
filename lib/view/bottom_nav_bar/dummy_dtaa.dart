// import 'package:curved_nav_bar/fab_bar/fab_bottom_app_bar_item.dart';
// import 'package:curved_nav_bar/flutter_curved_bottom_nav_bar.dart';
// import 'package:flutter/material.dart';
// import 'package:curved_nav_bar/curved_bar/curved_action_bar.dart';
//
//
// // class NavBarScreen extends StatefulWidget {
// //   const NavBarScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<NavBarScreen> createState() => _NavBarScreenState();
// // }
//
// class _NavBarScreenState extends State<NavBarScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return CurvedNavBar(
//       actionButton: CurvedActionBar(
//           onTab: (value) {
//             /// perform action here
//             print(value);
//           },
//           activeIcon: Container(
//             padding: EdgeInsets.all(8),
//             decoration:
//             BoxDecoration(color: Colors.white, shape: BoxShape.circle),
//             child: Icon(
//               Icons.camera_alt,
//               size: 50,
//               color: Colors.orange,
//             ),
//           ),
//           inActiveIcon: Container(
//             padding: EdgeInsets.all(8),
//             decoration:
//             BoxDecoration(color: Colors.white70, shape: BoxShape.circle),
//             child: Icon(
//               Icons.camera_alt_outlined,
//               size: 50,
//               color: Colors.orange,
//             ),
//           ),
//           text: "Camera"),
//       activeColor: Colors.blue,
//       navBarBackgroundColor: Colors.limeAccent,
//       inActiveColor: Colors.black45,
//       appBarItems: [
//         FABBottomAppBarItem(
//             activeIcon: Icon(
//               Icons.home,
//               color: Colors.blue,
//             ),
//             inActiveIcon: Icon(
//               Icons.home,
//               color: Colors.black26,
//             ),
//             text: 'Home'),
//         FABBottomAppBarItem(
//             activeIcon: Icon(
//               Icons.wallet_giftcard,
//               color: Colors.blue,
//             ),
//             inActiveIcon: Icon(
//               Icons.wallet_giftcard,
//               color: Colors.black26,
//             ),
//             text: 'Wallet'),
//       ],
//       bodyItems: [
//         Container(
//           height: MediaQuery.of(context).size.height,
//           color: Colors.blue,
//         ),
//         Container(
//           height: MediaQuery.of(context).size.height,
//           color: Colors.pinkAccent,
//         )
//       ],
//       actionBarView: Container(
//         height: MediaQuery.of(context).size.height,
//         color: Colors.orange,
//       ),
//     );
//   }
// }
//
//
//
//
//
//
//
//
//
// //
// //
// //
// // // import 'dart:developer';
// // // import 'package:floating_bottom_bar/animated_bottom_navigation_bar.dart';
// // // import 'package:flutter/material.dart';
// // //
// // // import '../../AppTheme/widgets/app_theme.dart';
// // //
// // //
// // // class BottomNavigatorExample extends StatefulWidget {
// // //   const BottomNavigatorExample({Key? key, required this.title})
// // //       : super(key: key);
// // //
// // //   final String title;
// // //
// // //   @override
// // //   State<BottomNavigatorExample> createState() => _BottomNavigatorExampleState();
// // // }
// // //
// // // class _BottomNavigatorExampleState extends State<BottomNavigatorExample> {
// // //   bool circleButtonToggle = false;
// // //   // List<Color> listOfColor = [
// // //   //   const Color(0xFFF2B5BA),
// // //   //   Colors.orange,
// // //   //   Colors.amber,
// // //   //   Colors.deepOrangeAccent
// // //   // ];
// // //   int index = 2;
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return SafeArea(
// // //       child: Stack(
// // //         children: [
// // //           Scaffold(
// // //             extendBody: true,
// // //             backgroundColor: Colors.grey.shade100,
// // //             body: _screens[_selectedIndex],
// // //             floatingActionButtonLocation:
// // //             FloatingActionButtonLocation.centerDocked,
// // //             bottomNavigationBar: AnimatedBottomNavigationBar(
// // //               barColor: AppTheme.whiteColor,
// // //               controller: _controller,
// // //
// // //               bottomBar: [
// // //                 BottomBarItem(
// // //                   icon: Image.asset(AppAssets.homeSmileIcon,
// // //                       width: 20,
// // //                       height: 20,
// // //                       color: _selectedIndex == 0
// // //                           ? AppTheme.purplishColor
// // //                           : AppTheme.blackColor),
// // //                   title: 'Home',
// // //                   dotColor: AppTheme.purplishColor,
// // //                   onTap: (value) => _onItemTapped(0), iconSelected: Container(),
// // //                 ),
// // //                 BottomBarItem(
// // //                   icon: Image.asset(AppAssets.searchIcon,
// // //                       width: 20,
// // //                       height: 20,
// // //                       color: _selectedIndex == 1
// // //                           ? AppTheme.purplishColor
// // //                           : AppTheme.blackColor),
// // //                   title: 'Search',
// // //                   dotColor: AppTheme.purplishColor,
// // //                   onTap: (value) => _onItemTapped(1), iconSelected: Container(),
// // //                 ),
// // //                 BottomBarItem(
// // //                   icon: Image.asset(AppAssets.messageChatIcon,
// // //                       width: 20,
// // //                       height: 20,
// // //                       color: _selectedIndex == 3
// // //                           ? AppTheme.purplishColor
// // //                           : AppTheme.blackColor),
// // //                   title: 'Chat',
// // //                   dotColor: AppTheme.purplishColor,
// // //                   onTap: (value) => _onItemTapped(3), iconSelected: Container(),
// // //                 ),
// // //                 BottomBarItem(
// // //                   icon: Image.asset(AppAssets.gridIcon,
// // //                       width: 20,
// // //                       height: 20,
// // //                       color: _selectedIndex == 4
// // //                           ? AppTheme.purplishColor
// // //                           : AppTheme.blackColor),
// // //                   title: 'Dashboard',
// // //                   dotColor: AppTheme.purplishColor,
// // //                   onTap: (value) => _onItemTapped(4), iconSelected: Container(),
// // //                 ),
// // //               ],
// // //
// // //               // 🎯 Center Floating Button Section
// // //               bottomBarCenterModel: BottomBarCenterModel(
// // //                 centerBackgroundColor: AppTheme.purplishColor,
// // //                 centerIcon: const FloatingCenterButton(
// // //                   child: Icon(
// // //                     Icons.add,
// // //                     color: Colors.white,
// // //                     size: 30,
// // //                   ),
// // //                 ),
// // //                 centerIconChild: [
// // //                   FloatingCenterButtonChild(
// // //                     child: const Icon(Icons.photo, color: Colors.white),
// // //                     onTap: () => log('Photo tapped'),
// // //                   ),
// // //                   FloatingCenterButtonChild(
// // //                     child: const Icon(Icons.video_call, color: Colors.white),
// // //                     onTap: () => log('Video tapped'),
// // //                   ),
// // //                   FloatingCenterButtonChild(
// // //                     child: const Icon(Icons.note_add, color: Colors.white),
// // //                     onTap: () => log('Note tapped'),
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // //
// // // // return SafeArea(
// // // //   child: Stack(
// // // //     children: [
// // // //       Scaffold(
// // // //         extendBody: true,
// // // //         backgroundColor: Colors.grey.shade100,
// // // //         body: _screens[_selectedIndex],
// // // //         floatingActionButtonLocation:
// // // //         FloatingActionButtonLocation.centerDocked,
// // // //         bottomNavigationBar: AnimatedBottomNavigationBar(
// // // //           barColor: AppTheme.whiteColor,
// // // //           controller: _controller,
// // // //
// // // //           bottomBar: [
// // // //             BottomBarItem(
// // // //               icon: Image.asset(AppAssets.homeSmileIcon,
// // // //                   width: 20,
// // // //                   height: 20,
// // // //                   color: _selectedIndex == 0
// // // //                       ? AppTheme.purplishColor
// // // //                       : AppTheme.blackColor),
// // // //               title: 'Home',
// // // //               dotColor: AppTheme.purplishColor,
// // // //               onTap: (value) => _onItemTapped(0), iconSelected: Container(),
// // // //             ),
// // // //             BottomBarItem(
// // // //               icon: Image.asset(AppAssets.searchIcon,
// // // //                   width: 20,
// // // //                   height: 20,
// // // //                   color: _selectedIndex == 1
// // // //                       ? AppTheme.purplishColor
// // // //                       : AppTheme.blackColor),
// // // //               title: 'Search',
// // // //               dotColor: AppTheme.purplishColor,
// // // //               onTap: (value) => _onItemTapped(1), iconSelected: Container(),
// // // //             ),
// // // //             BottomBarItem(
// // // //               icon: Image.asset(AppAssets.messageChatIcon,
// // // //                   width: 20,
// // // //                   height: 20,
// // // //                   color: _selectedIndex == 3
// // // //                       ? AppTheme.purplishColor
// // // //                       : AppTheme.blackColor),
// // // //               title: 'Chat',
// // // //               dotColor: AppTheme.purplishColor,
// // // //               onTap: (value) => _onItemTapped(3), iconSelected: Container(),
// // // //             ),
// // // //             BottomBarItem(
// // // //               icon: Image.asset(AppAssets.gridIcon,
// // // //                   width: 20,
// // // //                   height: 20,
// // // //                   color: _selectedIndex == 4
// // // //                       ? AppTheme.purplishColor
// // // //                       : AppTheme.blackColor),
// // // //               title: 'Dashboard',
// // // //               dotColor: AppTheme.purplishColor,
// // // //               onTap: (value) => _onItemTapped(4), iconSelected: Container(),
// // // //             ),
// // // //           ],
// // // //
// // // //           // 🎯 Center Floating Button Section
// // // //           bottomBarCenterModel: BottomBarCenterModel(
// // // //             centerBackgroundColor: AppTheme.purplishColor,
// // // //             centerIcon: const FloatingCenterButton(
// // // //               child: Icon(
// // // //                 Icons.add,
// // // //                 color: Colors.white,
// // // //                 size: 30,
// // // //               ),
// // // //             ),
// // // //             centerIconChild: [
// // // //               FloatingCenterButtonChild(
// // // //                 child: const Icon(Icons.photo, color: Colors.white),
// // // //                 onTap: () => log('Photo tapped'),
// // // //               ),
// // // //               FloatingCenterButtonChild(
// // // //                 child: const Icon(Icons.video_call, color: Colors.white),
// // // //                 onTap: () => log('Video tapped'),
// // // //               ),
// // // //               FloatingCenterButtonChild(
// // // //                 child: const Icon(Icons.note_add, color: Colors.white),
// // // //                 onTap: () => log('Note tapped'),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //       ),
// // // //     ],
// // // //   ),
// // // // );
// // // // import 'dart:developer';
// // // // import 'package:eventori/constants/aap_assets.dart';
// // // // import 'package:flutter/material.dart';
// // // // import 'package:curved_navigation_bar/curved_navigation_bar.dart';
// // // // import '../../AppTheme/widgets/app_theme.dart';
// // // //
// // // // class NavBarScreen extends StatefulWidget {
// // // //   const NavBarScreen({Key? key}) : super(key: key);
// // // //
// // // //   @override
// // // //   State<NavBarScreen> createState() => _NavBarScreenState();
// // // // }
// // // //
// // // // class _NavBarScreenState extends State<NavBarScreen> {
// // // //   int _selectedIndex = 0;
// // // //
// // // //   final List<Widget> _screens = [
// // // //     const Center(child: Text('Home Screen')),
// // // //     const Center(child: Text('Search Screen')),
// // // //     const Center(child: Text('Create Screen')),
// // // //     const Center(child: Text('Chat Screen')),
// // // //     const Center(child: Text('Dashboard Screen')),
// // // //   ];
// // // //
// // // //   void _onItemTapped(int index) {
// // // //     setState(() => _selectedIndex = index);
// // // //     log('Selected index: $index');
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return SafeArea(
// // // //       child: Scaffold(
// // // //         backgroundColor: AppTheme.pagebackground,
// // // //         extendBody: true,
// // // //         body: _screens[_selectedIndex],
// // // //         bottomNavigationBar: Stack(
// // // //           alignment: Alignment.bottomCenter,
// // // //           children: [
// // // //             Container(
// // // //               height: 80,
// // // //               color: AppTheme.whiteColor,
// // // //               child: Row(
// // // //                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// // // //                 children: [
// // // //                   // Home
// // // //                   _buildNavItem(
// // // //                     index: 0,
// // // //                     icon: AppAssets.homeSmileIcon,
// // // //                     label: 'Home',
// // // //                   ),
// // // //                   // Search
// // // //                   _buildNavItem(
// // // //                     index: 1,
// // // //                     icon: AppAssets.searchIcon,
// // // //                     label: 'Search',
// // // //                   ),
// // // //                   // Center Space
// // // //                   SizedBox(width: 60),
// // // //                   // Chat
// // // //                   _buildNavItem(
// // // //                     index: 3,
// // // //                     icon: AppAssets.messageChatIcon,
// // // //                     label: 'Chat',
// // // //                   ),
// // // //                   // Dashboard
// // // //                   _buildNavItem(
// // // //                     index: 4,
// // // //                     icon: AppAssets.gridIcon,
// // // //                     label: 'Dashboard',
// // // //                   ),
// // // //                 ],
// // // //               ),
// // // //             ),
// // // //             // Center Floating Button
// // // //             Positioned(
// // // //               bottom: 30,
// // // //               child: GestureDetector(
// // // //                 onTap: () {
// // // //                   setState(() => _selectedIndex = 2);
// // // //                   log('Create Button Tapped');
// // // //                 },
// // // //                 child: Container(
// // // //                   width: 60,
// // // //                   height: 60,
// // // //                   decoration: BoxDecoration(
// // // //                     color: AppTheme.purplishColor,
// // // //                     shape: BoxShape.circle,
// // // //                     boxShadow: [
// // // //                       BoxShadow(
// // // //                         color: AppTheme.purplishColor.withOpacity(0.3),
// // // //                         blurRadius: 8,
// // // //                         offset: const Offset(0, 4),
// // // //                       ),
// // // //                     ],
// // // //                   ),
// // // //                   child: Icon(
// // // //                     Icons.add,
// // // //                     color: AppTheme.whiteColor,
// // // //                     size: 28,
// // // //                   ),
// // // //                 ),
// // // //               ),
// // // //             ),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildNavItem({
// // // //     required int index,
// // // //     required String icon,
// // // //     required String label,
// // // //   }) {
// // // //     final isSelected = _selectedIndex == index;
// // // //
// // // //     return GestureDetector(
// // // //       onTap: () => _onItemTapped(index),
// // // //       child: Column(
// // // //         mainAxisAlignment: MainAxisAlignment.center,
// // // //         children: [
// // // //           Image.asset(
// // // //             icon,
// // // //             width: 24,
// // // //             height: 24,
// // // //             color: isSelected
// // // //                 ? AppTheme.purplishColor
// // // //                 : AppTheme.blackColor,
// // // //           ),
// // // //           const SizedBox(height: 4),
// // // //           Text(
// // // //             label,
// // // //             style: TextStyle(
// // // //               color: isSelected
// // // //                   ? AppTheme.purplishColor
// // // //                   : AppTheme.blackColor,
// // // //               fontWeight: FontWeight.w600,
// // // //               fontSize: 12,
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }




import 'package:flutter/material.dart';
import 'package:eventori/constants/custom_button.dart';
import 'package:eventori/constants/custom_textfield.dart';
import '../../AppTheme/widgets/app_theme.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final TextEditingController eventNameController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  String? selectedCategory;
  String? selectedCountry;
  bool notSureLocation = false;
  bool notSureDate = false;
  bool sendReminder = true;

  final List<String> eventCategories = [
    "Conference",
    "Workshop",
    "Meetup",
    "Concert",
    "Party"
  ];

  final List<String> countries = [
    "Pakistan",
    "USA",
    "UK",
    "Canada",
    "France"
  ];

  Future<void> _selectDate(BuildContext context) async {
    if (notSureDate) return;
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.whiteColor,
      appBar: AppBar(
        backgroundColor: AppTheme.whiteColor,
        elevation: 0,
        title: const Text(
          "Create a New Event",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Section Title
            Text(
              "My event details",
              style: TextStyle(
                color: AppTheme.darkpurpleColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 18),

            // Event name field
            CustomTextField(
              fieldName: "What's the name of your event?",
              hintText: "Event name *",
              controller: eventNameController,
            ),
            const SizedBox(height: 16),

            // Event category
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: AppTheme.greyColor,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppTheme.textfieldBorderColor.withOpacity(0.3),
                ),
              ),
              child: DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  labelText: "What type of event are you planning?",
                ),
                hint: const Text("Event Category *"),
                items: eventCategories
                    .map((item) =>
                    DropdownMenuItem(value: item, child: Text(item)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedCategory = value);
                },
              ),
            ),
            const SizedBox(height: 16),

            // Country + City
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: AppTheme.greyColor,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppTheme.textfieldBorderColor.withOpacity(0.3),
                      ),
                    ),
                    child: DropdownButtonFormField<String>(
                      value: selectedCountry,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        labelText: "Where will your event be held?",
                      ),
                      hint: const Text("Country *"),
                      items: countries
                          .map((item) => DropdownMenuItem(
                          value: item, child: Text(item)))
                          .toList(),
                      onChanged: (value) {
                        setState(() => selectedCountry = value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  flex: 1,
                  child: CustomTextField(
                    hintText: "City *",
                    controller: cityController,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: notSureLocation,
                  onChanged: (val) =>
                      setState(() => notSureLocation = val ?? false),
                ),
                const Text("Not sure"),
              ],
            ),
            const SizedBox(height: 8),

            // Date picker
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: CustomTextField(
                  hintText: "Date",
                  controller: dateController,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Checkbox(
                  value: notSureDate,
                  onChanged: (val) =>
                      setState(() => notSureDate = val ?? false),
                ),
                const Text("Not sure"),
              ],
            ),
            const SizedBox(height: 16),

            // Reminder email
            Row(
              children: [
                Expanded(
                  child: Text(
                    "Send me an automated reminder email 1 day before event",
                    style: TextStyle(
                      fontSize: 13,
                      color: AppTheme.silverColor,
                    ),
                  ),
                ),
                Switch(
                  value: sendReminder,
                  onChanged: (value) => setState(() => sendReminder = value),
                  activeColor: AppTheme.cyanColor,
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Upload image
            Container(
              height: 120,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: AppTheme.textfieldBorderColor.withOpacity(0.3),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined,
                        color: AppTheme.silverColor, size: 36),
                    const SizedBox(height: 8),
                    Text(
                      "Upload image",
                      style: TextStyle(
                        color: AppTheme.silverColor,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Create Event Button
            CustomButton(
              Text: "Create Event",
              width: double.infinity,
              height: 52,
              textColor: AppTheme.whiteColor,
              buttonColor: AppTheme.cyanColor,
              onTap: () {
                // Handle create event logic
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
