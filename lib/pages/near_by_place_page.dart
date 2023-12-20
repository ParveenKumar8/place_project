import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/models/user_model.dart';
import 'package:place_project/provider/user_provider.dart';
import 'package:place_project/utils/marker_clipper.dart';
import 'package:place_project/utils/marker_painter.dart';
import 'package:place_project/widgets/app_bar_widget.dart';
import 'package:place_project/widgets/user_page_item_widget.dart';
import 'package:provider/provider.dart';

class NearByPlacePage extends StatefulWidget {
  const NearByPlacePage({Key? key}) : super(key: key);

  @override
  State<NearByPlacePage> createState() => _NearByPlacePageState();
}

class _NearByPlacePageState extends State<NearByPlacePage> {
  late final Future<List<UserModel>> futureUserList;
  final pageController = PageController(
    viewportFraction: 0.85,
  );
  @override
  void initState() {
    super.initState();
    futureUserList = context.read<UserProvider>().getUserLocationList();
    //getUserListAPI();
  }

  @override
  Widget build(BuildContext context) {
    //print("User info ${userList[0].company?.address?.coordinates?.lat}");
    return Scaffold(
      appBar: const AppBarWidget(
        pageTitle: AppStrings.nearByPlaceStr,
      ),
      body: FutureBuilder(
        future: futureUserList,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final usersList = snapshot.data!;
          return Stack(
            children: [
              FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(
                    usersList[0].company?.address?.coordinates?.lat ?? 0.0,
                    usersList[0].company?.address?.coordinates?.lng ?? 0.0,
                  ),
                  initialZoom: 11.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.prime_soft.places',
                  ),
                  MarkerLayer(
                    markers: usersList.map((user) {
                      return Marker(
                        width: 120.0,
                        height: 100.0,
                        point: LatLng(
                          user.company?.address?.coordinates?.lat ?? 0.0,
                          user.company?.address?.coordinates?.lng ?? 0.0,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            var selectedIndex = 0;
                            for (int i = 0; i < usersList.length; i++) {
                              if (usersList[i].id == user.id) {
                                selectedIndex = i;
                                break;
                              }
                            }
                            print('Selected inDex: $selectedIndex');
                            pageController.animateToPage(
                              selectedIndex,
                              duration: const Duration(seconds: 2),
                              curve: Curves.easeIn,
                            );
                          },
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 4.0,
                                  horizontal: 8.0,
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.whiteColor,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Text(
                                  user.username!,
                                  style: AppTextStyles.body2.copyWith(
                                    color: AppColors.blackColor,
                                  ),
                                ),
                              ),
                              CustomPaint(
                                painter: MarkerPainter(),
                                child: Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: ClipPath(
                                    clipper: MarkerClipper(),
                                    child: SizedBox(
                                      width: 44.0,
                                      height: 52.0,
                                      child: Image.asset(
                                        AppImages.imgCoverWomen,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ),

                              // SvgPicture.asset(
                              //   AppImages.svgLocationPin,
                              //   width: 22.0,
                              //   height: 22.0,
                              //   colorFilter: const ColorFilter.mode(
                              //     AppColors.blackColor,
                              //     BlendMode.srcIn,
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: SizedBox(
                  height: 180.0,
                  child: PageView(
                    controller: pageController,
                    children: usersList
                        .map((user) => UserPageItemWidget(user: user))
                        .toList(),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
