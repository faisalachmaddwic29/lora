import 'package:flutter/material.dart';

import 'package:lora_app/ui/components/chart/chart_screen.dart';
import 'package:lora_app/utils/utils.dart';

class MyPortoFolioScreen extends StatefulWidget {
  @override
  _MyPortoFolioScreenState createState() => _MyPortoFolioScreenState();
}

class _MyPortoFolioScreenState extends State<MyPortoFolioScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: paddingScreen.h(context)),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: paddingScreen.w(context)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'My PortoFolio',
                  style: LoraFonts(context).boldQuicksand(
                    size: 16,
                  ),
                ).addMarginBottom(10.h(context)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'HKD 102,000.00',
                      style: LoraFonts(context).boldQuicksand(
                        size: 20,
                      ),
                    ),
                    Text(
                      '+31.22%',
                      style: LoraFonts(context)
                          .boldQuicksand(size: 14, color: LoraColors.primary),
                    ),
                  ],
                ).addMarginBottom(15.h(context)),
              ],
            ),
          ),
          Divider(color: LoraColors.grey, thickness: 2),
          LineChartGrafik(),
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: LoraColors.greyMore,
            ),
            padding: EdgeInsets.symmetric(
                horizontal: paddingScreen.w(context), vertical: 15.w(context)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Detail',
                  style: LoraFonts(context).boldQuicksand(
                    size: 14,
                    color: LoraColors.textMore,
                  ),
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: LoraColors.textMore,
                  size: 12,
                ),
                Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: LoraColors.textMore,
                  size: 12,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
