import 'package:e_cart_shopping/app/data/model/adress/address.dart';
import 'package:e_cart_shopping/app/infastructure/utils/index.dart';
import 'package:flutter/material.dart';

class AddModelwidget extends StatelessWidget {
  const AddModelwidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Address model;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20),
          child: Row(
            children: [
              Text(
                model.fullName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              horizontalSpace(10),
              Container(
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.grey1,
                ),
                height: 20,
                child: Center(child: Text(model.type)),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 240,
                child: Text(
                  "${model.strAddress1}"
                  " , "
                  "${model.strAddress2}",
                ),
              ),
              Row(
                children: [
                  Text(model.city),
                  Text(" - " "${model.pinCode}"),
                ],
              ),
              verticalSpace(10),
              Text(model.phone),
            ],
          ),
        )
      ],
    );
  }
}
