import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoolin/widgets/small_text.dart';
import '../utils/colors.dart';
import '../utils/dimesions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int index;
  const AppColumn({Key? key, required this.text,required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Column(
      crossAxisAlignment: CrossAxisAlignment.start,
       mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BigText(text: text, size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),

        Row(
          children: [
            Wrap(
              children: List.generate(5, (index)
              {
                return
                  Icon(CommunityMaterialIcons.star,color: AppColors.mainColor,size:15 ,);}),
            ),
            SizedBox(width: 10,),
            SmallText(text: "4.5"),
            SizedBox(width: 10,),
            SmallText(text: "1287"),
            SizedBox(width: 10,),
            SmallText(text: "comments"),
          ],
        ),

        SizedBox(height: Dimensions.height20,),
     Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconAndTextWidget(icon: CommunityMaterialIcons.circle,
              text: PopularDataBase.review[index],
              iconColor: AppColors.iconColor1),

          IconAndTextWidget(icon: CommunityMaterialIcons.map_marker,
              text: PopularDataBase.distance[index],
              iconColor: AppColors.mainColor),

          IconAndTextWidget(
              icon: CommunityMaterialIcons.clock_time_four_outline,
              text: PopularDataBase.time[index],
              iconColor: AppColors.iconColor2)

        ],
     ),
      ],
    );

  }
}
