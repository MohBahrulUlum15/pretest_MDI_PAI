import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pandawa_agri_indo_test/config/themes/text_schemes.dart';
import 'package:pandawa_agri_indo_test/data/model/dummy_user.dart';

class DetailPage extends StatefulWidget {
  final DummyUser user;
  const DetailPage({super.key, required this.user});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text(
          widget.user.firstName,
          style: GoogleFonts.inter(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            letterSpacing: 1,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.primary,
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
                backgroundImage: NetworkImage(widget.user.image),
              ),
              SizedBox(height: 16.h),
              Text(
                  '${widget.user.firstName} ${widget.user.maidenName} ${widget.user.lastName}',
                  style: CustomTextTheme.poppins20.copyWith(
                    fontWeight: FontWeight.w600,
                  )),
              SizedBox(height: 4.h),
              Text(
                '@${widget.user.username}',
                style: CustomTextTheme.poppins18.copyWith(
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8.h),
              Column(
                children: [
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
                                  'Personality',
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'first name',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.firstName}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'last name',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.lastName}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'age',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.age}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'gender',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.gender}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'height',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.height}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'weight',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.weight}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'eye color',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.eyeColor}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'hair style',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.hair.type}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'hair color',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.hair.color}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
                                  'Address',
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'address name',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.address.address}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'city',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.address.city}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'state',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.address.state}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'postal code',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.address.postalCode}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
                                  'Education',
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'university',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.university}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 16.h,
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
                                  'Company',
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
                              title: Column(
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'name',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.company.name}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'name',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.company.name}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'address',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.company.address.address}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 100.w,
                                        child: Text(
                                          'city',
                                          style: CustomTextTheme.inter14.copyWith(
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.w,
                                      ),
                                      Expanded(
                                        child: Text(
                                          ': ${widget.user.company.address.city}',
                                          style:
                                              CustomTextTheme.poppins14.copyWith(
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
