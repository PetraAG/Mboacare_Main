import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:mboacare/app_modules/med_user/screen/dashboard/blog/my_blog.dart';
import 'package:mboacare/global/styles/appStyles.dart';
import 'package:mboacare/global/styles/assets_string.dart';
import 'package:mboacare/global/styles/colors.dart';
import 'package:mboacare/services/auth_provider/loginProvider.dart';
import 'package:mboacare/services/auth_provider/registerProvider.dart';
import 'package:mboacare/widgets/settings_widget.dart';
import 'package:provider/provider.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          //physics: null,
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(provider.profileImage),
                      radius: 45,
                      //child: Container( child: Image.network(provider.profileImage)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 18.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            provider.userName ?? 'Mboa User',
                            style: GoogleFonts.quicksand(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textColor2),
                          ),
                          Padding(padding: EdgeInsets.only(bottom: 5)),
                          Text(
                            provider.userEmail ?? 'mboauser@gmail.com',
                            style: GoogleFonts.quicksand(
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                //height: 5,
                color: AppColors.dividerColor,
                endIndent: 2,
                indent: 2,
              ),
              const SizedBox(
                height: 5,
              ),
              SettingsPageListTiles(
                  icon: const Icon(
                    Iconsax.profile_add,
                    color: AppColors.textColor2,
                    size: iconSize,
                  ),
                  title: 'Account',
                  subtitle: 'Profile',
                  trailingIcon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/profilePage');
                  }),
              SettingsPageListTiles(
                  icon: const Icon(
                    Iconsax.global_edit,
                    color: AppColors.textColor2,
                    size: iconSize,
                  ),
                  title: 'Language',
                  subtitle: 'English',
                  trailingIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const LanguageDialog();
                        });
                  }),
              SettingsPageListTiles(
                  icon: const Icon(
                    Iconsax.moon,
                    color: AppColors.textColor2,
                    size: iconSize,
                  ),
                  title: 'Theme',
                  subtitle: 'System',
                  trailingIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, '/themeScreen');
                  }),
              SettingsPageListTiles(
                  icon: SvgPicture.asset(
                    ImageAssets.hospital,
                    color: AppColors.textColor2,
                    // size: iconSize,
                  ),
                  title: 'Facilities',
                  subtitle: 'Manage Facilities',
                  trailingIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, '/manageFacilities');
                  }),
              SettingsPageListTiles(
                  icon: SvgPicture.asset(
                    ImageAssets.blog,
                    color: AppColors.textColor2,
                    // size: iconSize,
                  ),
                  title: 'Blog',
                  subtitle: 'Manage Blogs',
                  trailingIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Get.to(
                      () => const MyBlog(),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeInCirc,
                      transition: Transition.leftToRight,
                    );
                  }),
              SettingsPageListTiles(
                  icon: const Icon(
                    Iconsax.info_circle,
                    color: AppColors.textColor2,
                    size: iconSize,
                  ),
                  title: 'About Us',
                  subtitle: 'Contact us',
                  trailingIcon: const Icon(Icons.arrow_forward_ios_outlined),
                  onTap: () {
                    Navigator.pushNamed(context, '/aboutUs');
                  }),
              Signout(
                  icon: const Icon(Iconsax.logout,
                      color: AppColors.textColor2, size: iconSize),
                  title: 'Signout',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const SignoutDialog();
                        });
                  }),
              DeleteAccount(
                  //iconColor: Colors.redAccent,
                  icon: const Icon(
                    Iconsax.trash,
                    size: iconSize,
                    color: Colors.redAccent,
                  ),
                  //color: AppColors.textColor2, size: 25),
                  title: 'Delete Account',
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return const DeleteAccountDialog();
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageDialog extends StatefulWidget {
  const LanguageDialog({super.key});

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  int? clickedOption;

  bool firstValue = false;
  bool secondValue = false;
  bool thirdValue = false;
  bool fourthValue = false;
  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.45,
            //constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
            decoration: BoxDecoration(
              color: AppColors.googleButtonColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text('Select language',
                        style: AppTextStyles.bodyOne.copyWith(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ),
                ),
                const Divider(
                  color: AppColors.dividerColor,
                ),
                // ListTile(
                //   leading:
                // Checkbox(
                //       value: firstValue,
                //       onChanged: (value) {
                //         setState(() {
                //           firstValue = value!;
                //           print('hi');
                //         });
                //       }),
                //   title: const Text('English',
                //       style:
                //           TextStyle(fontWeight: FontWeight.w400, fontSize: 17)),
                // )

                RadioTile(
                    groupValue: clickedOption,
                    value: 0,
                    onchanged: (value) {
                      setState(() {
                        clickedOption = value!;
                      });
                    },
                    text: 'English'),

                RadioTile(
                    value: 1,
                    groupValue: clickedOption,
                    onchanged: (value) {
                      setState(() {
                        clickedOption = value!;
                      });
                      //secondValue != value;
                    },
                    text: 'Hindi'),
                RadioTile(
                    value: 2,
                    groupValue: clickedOption,
                    onchanged: (value) {
                      setState(() {
                        clickedOption = value!;
                      });
                    },
                    text: 'Espanol'),
                RadioTile(
                    value: 3,
                    groupValue: clickedOption,
                    onchanged: (value) {
                      setState(() {
                        clickedOption = value!;
                      });
                    },
                    text: 'Francais'),

                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 21.0),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop;
                        },
                        child: Text(
                          'CANCEL',
                          style: AppTextStyles.bodyTwo.copyWith(
                              // fontWeight: FontWeight.w3,
                              color: AppColors.deleteColor,
                              fontSize: 16),
                        )),
                  ),
                )
              ],
            )));
  }
}

class SignoutDialog extends StatefulWidget {
  const SignoutDialog({super.key});

  @override
  State<SignoutDialog> createState() => _SignoutDialogState();
}

class _SignoutDialogState extends State<SignoutDialog> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
        decoration: BoxDecoration(
          color: AppColors.googleButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        ImageAssets.close,
                        height: 18,
                      )),
                )),
            const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 15)),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(13),
                color: AppColors.navbar,
              ),
              child: const Icon(
                Iconsax.logout,
                color: AppColors.textColor2,
                size: iconSize,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Sign Out',
              style: AppTextStyles.headerThree
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'You are about to log out from the Mboacare app',
                style: AppTextStyles.bodyTwo
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Consumer<LoginProvider>(builder: (
              context,
              log,
              child,
            ) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (log.reqMessage != '') {
                  log.clear();
                }
              });
              return log.loading
                  ? const SpinKitThreeBounce(color: AppColors.redColor)
                  : InkWell(
                      onTap: () {
                        log.signOut(context: context);
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.height * 0.34,
                        height:
                            //50,
                            MediaQuery.of(context).size.height * 0.07,
                        decoration: BoxDecoration(
                            color: AppColors.deleteColor,
                            borderRadius: BorderRadius.circular(35)),
                        child: Center(
                          child: Text(
                            'Sign out',
                            style: AppTextStyles.bodyOne.copyWith(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                            //textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    );
            })
          ],
        ),
      ),
    );
  }
}

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.4,
        constraints: const BoxConstraints(maxHeight: 500, maxWidth: 500),
        decoration: BoxDecoration(
          color: AppColors.googleButtonColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: Navigator.of(context).pop,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Align(
                      alignment: Alignment.topRight,
                      child: SvgPicture.asset(
                        ImageAssets.close,
                        height: 18,
                      )),
                )),
            const Padding(padding: EdgeInsets.fromLTRB(10, 0, 10, 15)),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                // borderRadius: BorderRadius.circular(13),
                color: Color.fromARGB(255, 228, 207, 207),
              ),
              child: const Icon(
                Iconsax.trash,
                color: Colors.red,
                size: iconSize,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Delete account',
              style: AppTextStyles.bodyTwo
                  .copyWith(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                'If your account is deleted, all your data willl be lost.',
                style: AppTextStyles.bodyTwo
                    .copyWith(fontWeight: FontWeight.w400, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InkWell(
              onTap: null,
              child: Container(
                width: MediaQuery.of(context).size.height * 0.34,
                height:
                    //50,
                    MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                    color: AppColors.deleteColor,
                    borderRadius: BorderRadius.circular(35)),
                child: Center(
                  child: Text(
                    'Delete my account',
                    style: AppTextStyles.bodyOne.copyWith(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                    //textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
