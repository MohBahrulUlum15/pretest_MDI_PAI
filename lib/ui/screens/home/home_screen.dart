import 'package:d_view/d_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandawa_agri_indo_test/config/themes/text_schemes.dart';
import 'package:pandawa_agri_indo_test/data/local/user_prefs.dart';
import 'package:pandawa_agri_indo_test/data/model/dummy_user.dart';
import 'package:pandawa_agri_indo_test/data/remote/controller/controller_dummy_user.dart';
import 'package:pandawa_agri_indo_test/data/remote/controller/controller_user.dart';
import 'package:pandawa_agri_indo_test/ui/screens/auth/login_screen.dart';
import 'package:pandawa_agri_indo_test/ui/screens/detail/detail_screen.dart';
import 'package:pandawa_agri_indo_test/ui/screens/info/info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenPage extends StatefulWidget {
  const HomeScreenPage({super.key});

  @override
  State<HomeScreenPage> createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  final controllerDummyUser = Get.put(ControllerDummyUser());

  final userC = Get.put(ControllerUser());

  final TextEditingController _searchController = TextEditingController();

  Future<String> getFirstNameFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String firstName = prefs.getString('firstName') ?? '';
    return firstName;
  }

  Future<String> getGenderFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gender = prefs.getString('gender') ?? '';
    return gender;
  }

  //tambahan
  List<DummyUser> searchResults = [];
  bool isSearching = false;

  //ON BACK PRESSED
  Future<bool> _onWillPop(BuildContext context) async {
    bool? exitResult = await showDialog(
        context: context, builder: (context) => _buildExitDialog(context));
    return exitResult ?? false;
  }

  Future<bool?> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      builder: (context) => _buildExitDialog(context),
    );
  }

  AlertDialog _buildExitDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Please confirm'),
      content: const Text('Do you want to exit the app?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text('Yes'),
        ),
      ],
    );
  }

  void search() {
    final query = _searchController.text;
    if (query.isEmpty) {
      setState(() {
        isSearching = false;
        searchResults.clear();
      });
      return;
    }

    final filteredList = controllerDummyUser.listDummyUser
        .where((user) =>
            user.firstName.toLowerCase().contains(query.toLowerCase()))
        .toList();

    setState(() {
      isSearching = true;
      searchResults = filteredList;
    });
  }

  refreshData() {
    controllerDummyUser.getListDummyUser();
    if (_searchController.text.isNotEmpty) {
      search();
    }
  }

  @override
  void initState() {
    refreshData();
    controllerDummyUser.getListDummyUser();
    userC.data;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: ()=> _onWillPop(context),
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.primary,
          automaticallyImplyLeading: false,
          title: FutureBuilder<String>(
            future: getFirstNameFromSharedPreferences(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator(); // Tampilkan indikator loading jika masih memuat data
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              } else {
                String firstName = snapshot.data ??
                    ""; // Menggunakan nilai default jika data tidak ada
                return Text(
                  'Welcome, ${firstName}',
                  style: GoogleFonts.inter(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                );
              }
            },
          ),
          centerTitle: false,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  //LOGOUT
                  logout();
                },
                child: Icon(
                  Icons.logout_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                onTap: () {
                  //INFO
                  Get.to(() => const InfoPage());
                },
                child: Icon(
                  Icons.info_rounded,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration:
                  BoxDecoration(color: Theme.of(context).colorScheme.primary),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Column(
                  children: [
                    SizedBox(
                      height: 12.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: Theme.of(context)
                                .colorScheme
                                .onPrimary), // Warna border
                        borderRadius:
                            BorderRadius.circular(16.0), // Border radius
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 12.w),
                            child: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: _searchController,
                              onChanged: (value) {
                                search();
                              },
                              onSubmitted: (value) {
                                //IMPLEMENTASI SEARCH
                                search();
                              },
                              decoration: InputDecoration(
                                hintText: 'Search',
                                hintStyle: CustomTextTheme.poppins16.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSecondary
                                        .withOpacity(0.8)),
                                contentPadding: EdgeInsets.all(12.0),
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                labelStyle: const TextStyle(
                                    decoration: TextDecoration.none),
                              ),
                              style: CustomTextTheme.poppins16.copyWith(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      Theme.of(context).colorScheme.onSecondary,
                                  decoration: TextDecoration.none),
                              cursorColor:
                                  Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GetBuilder<ControllerDummyUser>(
                  builder: (_) {
                    if (_.loading) {
                      return DView.loadingCircle();
                    }
                    if (_.listDummyUser.isEmpty) {
                      return DView.empty('No Data Available');
                    }
                    return RefreshIndicator(
                      onRefresh: () async => refreshData(),
                      child: ListView.builder(
                        itemCount: isSearching
                            ? searchResults.length
                            : controllerDummyUser.listDummyUser.length,
                        itemBuilder: (context, index) {
                          final DummyUser dummyUser = isSearching
                              ? searchResults[index]
                              : controllerDummyUser.listDummyUser[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4),
                            child: _buildItemList(context, dummyUser),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void logout() {
    UserPreferrences().removeUser();
    Get.off(() => const LoginPage());
  }
}

Widget _buildItemList(BuildContext context, DummyUser dummyUser) {
  return InkWell(
    onTap: () {
      Get.to(() => DetailPage(
            user: dummyUser,
          ));
    },
    child: Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 2),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16.0)),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).colorScheme.secondary,
              offset: Offset(0.5, 1),
              blurRadius: 2,
            ),
          ]),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            Container(
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    color: Theme.of(context).colorScheme.tertiary),
                child: Hero(
                  tag: dummyUser.image,
                  child: Image.network(
                    dummyUser.image,
                    width: 56.w,
                    height: 56.w,
                  ),
                )),
            SizedBox(
              width: 8.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          '${dummyUser.firstName} ${dummyUser.lastName}',
                          style: CustomTextTheme.poppins16.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            'Age: ',
                            style: CustomTextTheme.poppins14.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                          Text(
                            '${dummyUser.age}',
                            style: CustomTextTheme.poppins14.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 4.w,
                  ),
                  Text(
                    '@${dummyUser.username}',
                    style: CustomTextTheme.poppins14.copyWith(
                        fontWeight: FontWeight.w300,
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 20,
                          color:
                              Theme.of(context).colorScheme.onPrimaryContainer,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Expanded(
                          child: Text(
                            '${dummyUser.address.address}, ${dummyUser.address.city}',
                            style: CustomTextTheme.poppins14.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
