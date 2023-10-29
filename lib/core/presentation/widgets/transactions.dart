import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../utility/app_assets.dart';
import '../styles/text_styles.dart';
import '../styles/theme.dart';

Widget singleTransactionItem({isTransferInward = false, name, amount, date}) {
  return InkWell(
    child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            border: Border.all(color: GREY1),
            borderRadius: const BorderRadius.all(Radius.circular(12))),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color:
                      isTransferInward ? VERY_TRANSPARENT_ACCENT_COLOR : RED3,
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: isTransferInward ? ACCENT_COLOR : RED1, width: 2)),
              padding: const EdgeInsets.all(8.0),
              child: SvgPicture.asset(
                isTransferInward ? AppAssets.iconTransferInward : AppAssets.iconTransferOutward,
                width: 20,
                height: 20,
                color: isTransferInward ? ACCENT_COLOR : RED1,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name ?? 'No Name',
                    overflow: TextOverflow.ellipsis,
                    style: mediumBodyStyle(color: GREY2),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        amount ?? '0.00',
                        style: mediumBodyStyle(weight: FontWeight.w700,),
                      ),
                      Text(
                        date ?? '16 Jan 2023',
                        style: mediumBodyStyle(
                            color: GREY2),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        )),
  );
}
