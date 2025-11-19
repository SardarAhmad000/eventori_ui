// import 'package:get/get.dart';
//
// class SearchController extends GetxController {
//   // Observable variables
//   final RxString searchQuery = ''.obs;
//   final RxBool isSearching = false.obs;
//   final RxList<Map<String, dynamic>> searchResults = <Map<String, dynamic>>[].obs;
//   final RxList<Map<String, dynamic>> filteredVendors = <Map<String, dynamic>>[].obs;
//
//   // Sample vendor data - replace with actual API call
//   final List<Map<String, dynamic>> allVendors = [
//     {
//       'imagePaths': [
//         'assets/vendorDummyImage.png',
//         'assets/eventImage1.png',
//         'assets/featuredImage1.png',
//         'assets/vendor2Image.png',
//       ],
//       'vendorName': 'Royal Events & Catering',
//       'location': 'Lahore, Pakistan',
//       'isTopRated': true,
//       'rating': 4.8,
//       'isVerified': true,
//       'isSponsored': true,
//       'categories': ['WEDDING', 'EVENT', 'CATERING'],
//     },
//     {
//       'imagePaths': [
//         'assets/vendorDummyImage.png',
//         'assets/eventImage1.png',
//         'assets/featuredImage1.png',
//       ],
//       'vendorName': 'Elegant Moments Photography',
//       'location': 'Lahore, Pakistan',
//       'isTopRated': true,
//       'rating': 4.8,
//       'isVerified': true,
//       'isSponsored': false,
//       'categories': ['WEDDING', 'EVENT', 'CATERING'],
//     },
//   ];
//
//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize with all vendors
//     filteredVendors.value = allVendors;
//
//     // Listen to search query changes
//     debounce(
//       searchQuery,
//           (_) => performSearch(),
//       time: const Duration(milliseconds: 500),
//     );
//   }
//
//   // Update search query
//   void updateSearchQuery(String query) {
//     searchQuery.value = query;
//   }
//
//   // Perform search
//   void performSearch() {
//     if (searchQuery.value.isEmpty) {
//       filteredVendors.value = allVendors;
//       isSearching.value = false;
//       return;
//     }
//
//     isSearching.value = true;
//
//     // Filter vendors based on search query
//     filteredVendors.value = allVendors.where((vendor) {
//       final vendorName = vendor['vendorName'].toString().toLowerCase();
//       final location = vendor['location'].toString().toLowerCase();
//       final categories = (vendor['categories'] as List<String>)
//           .join(' ')
//           .toLowerCase();
//       final query = searchQuery.value.toLowerCase();
//
//       return vendorName.contains(query) ||
//           location.contains(query) ||
//           categories.contains(query);
//     }).toList();
//
//     isSearching.value = false;
//   }
//
//   // Clear search
//   void clearSearch() {
//     searchQuery.value = '';
//     filteredVendors.value = allVendors;
//     isSearching.value = false;
//   }
//
//   // Filter by category (called from HomeController)
//   void filterByCategory(String category) {
//     if (category.toLowerCase() == 'all') {
//       filteredVendors.value = allVendors;
//       return;
//     }
//
//     filteredVendors.value = allVendors.where((vendor) {
//       final categories = (vendor['categories'] as List<String>)
//           .map((c) => c.toLowerCase())
//           .toList();
//       return categories.contains(category.toLowerCase());
//     }).toList();
//   }
//
//   // Load vendors (replace with actual API call)
//   Future<void> loadVendors() async {
//     try {
//       isSearching.value = true;
//       // TODO: Replace with actual API call
//       // final response = await apiService.getVendors();
//       // allVendors = response.data;
//       filteredVendors.value = allVendors;
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to load vendors: $e',
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isSearching.value = false;
//     }
//   }
//
//   @override
//   void onClose() {
//     // Clean up resources if needed
//     super.onClose();
//   }
// }