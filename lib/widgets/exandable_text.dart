import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoolin/utils/colors.dart';
import 'package:shoolin/utils/dimesions.dart';
import 'package:shoolin/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
late String firstHalf;
late String secondHalf;

bool hiddenText = true;
double textHeight = Dimensions.screenHeight/5.63;
@override
void initState(){
  super.initState();
  if(widget.text.length>textHeight){
    firstHalf = widget.text.substring(0,textHeight.toInt());
    secondHalf =widget.text.substring(textHeight.toInt()+1,widget.text.length);
  }
  else{
    firstHalf= widget.text;
    secondHalf="";
  }
}
  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(color:AppColors.paraColor,size: Dimensions.font16 ,text: firstHalf):Column(
        children: [
          SmallText(height:1.8,color:AppColors.paraColor,size:Dimensions.font16 ,text: hiddenText?(firstHalf+"..."):(firstHalf+secondHalf)),
          InkWell(
            onTap: (){
              setState(() {
                hiddenText=!hiddenText;
              });
            },
            child: Row(
              children: [
                hiddenText?SmallText(text: "Show more",color: AppColors.mainColor,):SmallText(text: "Show less",color: AppColors.mainColor,),
                Icon(hiddenText?CommunityMaterialIcons.chevron_down:CommunityMaterialIcons.chevron_up,color: AppColors.mainColor),
                //Icon(CommunityMaterialIcons.chevron_down,color: AppColors.mainColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
