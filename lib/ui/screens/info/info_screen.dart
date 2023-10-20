import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandawa_agri_indo_test/config/themes/text_schemes.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          'Developer Profile',
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 16.h),
              CircleAvatar(
                radius: 70,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                backgroundImage: const AssetImage('assets/profile.jpg'),
              ),
              SizedBox(height: 16.h),
              Text('Moh. Bahrul \'Ulum',
                  style: CustomTextTheme.poppins20.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 4.h),
              Text(
                'Mobile Developer',
                style: CustomTextTheme.poppins18.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16.h),
                    topLeft: Radius.circular(16.h),
                  ),
                  color: Theme.of(context).colorScheme.secondaryContainer,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Row(
                          children: [
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Text(
                              'About',
                              style: CustomTextTheme.inter16.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(width: 16.w),
                            Expanded(
                              child: Divider(
                                thickness: 1,
                                color:
                                    Theme.of(context).colorScheme.secondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.email_rounded),
                          title: Text(
                            'belajarkoding97@gmail.com',
                            style: CustomTextTheme.poppins14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.home_work_rounded),
                          title: Text(
                            'Kakanda Tech',
                            style: CustomTextTheme.poppins14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(
                            'Situbondo, Jawa Timur - Indonesia',
                            style: CustomTextTheme.poppins14.copyWith(
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          DInfo.dialogSuccess(context, 'Github');
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.link_rounded),
                            title: Text(
                              'Github Repository',
                              style: CustomTextTheme.poppins14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_outward_rounded),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: (){
                          DInfo.dialogSuccess(context, 'Linkedin');
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(Icons.link_rounded),
                            title: Text(
                              'Linkedin Profile',
                              style: CustomTextTheme.poppins14.copyWith(
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            trailing: Icon(Icons.arrow_outward_rounded),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
