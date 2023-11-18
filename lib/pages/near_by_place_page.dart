import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:place_project/common/app_colors.dart';
import 'package:place_project/common/app_images.dart';
import 'package:place_project/common/app_strings.dart';
import 'package:place_project/common/app_text_styles.dart';
import 'package:place_project/widgets/app_bar_widget.dart';

class NearByPlacePage extends StatelessWidget {
  const NearByPlacePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        pageTitle: AppStrings.nearByPlaceStr,
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(
            51.509364,
            -0.128928,
          ),
          initialZoom: 11.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.prime_soft.places',
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 80.0,
                height: 50.0,
                point: const LatLng(
                  51.509364,
                  -0.128928,
                ),
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
                        "Person 1",
                        style: AppTextStyles.body2.copyWith(
                          color: AppColors.blackColor,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppImages.svgLocationPin,
                      width: 22.0,
                      height: 22.0,
                      colorFilter: const ColorFilter.mode(
                        AppColors.blackColor,
                        BlendMode.srcIn,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
