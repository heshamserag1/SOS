import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// import 'package:sixam_mart/controller/parcel_controller.dart';
// import 'package:sixam_mart/util/dimensions.dart';
// import 'package:sixam_mart/util/styles.dart';
// import 'package:sixam_mart/view/screens/location/widget/location_search_dialog.dart';

class SearchLocationWidget extends StatelessWidget {
  final GoogleMapController? mapController;
  final String? pickedAddress;
  final bool? isEnabled;
  final bool? isPickedUp;
  final bool? fromDialog;
  final String? hint;
  const SearchLocationWidget(
      {Key? key,
      required this.mapController,
      required this.pickedAddress,
      required this.isEnabled,
      this.isPickedUp,
      this.hint,
      this.fromDialog = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isEnabled != null) {}
      },
      child: Container(
        height: 50,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.blue,
            width: 2,
          ),
        ),
        child: Row(children: [
          (/*!fromDialog! &&*/ pickedAddress != null &&
                  pickedAddress!.isNotEmpty)
              ? Icon(
                  Icons.search,
                  size: 25,
                  color: (isEnabled == null || isEnabled!)
                      ? Colors.red
                      : Theme.of(context).disabledColor,
                )
              : Text('موقع البحث'),
          const SizedBox(width: 11),

          Expanded(
            child: (pickedAddress != null && pickedAddress!.isNotEmpty)
                ? Text(
                    pickedAddress!,
                    // style: robotoRegular.copyWith(fontSize: 14), maxLines: 1, overflow: TextOverflow.ellipsis,
                  )
                : Text(
                    hint ?? '',
                    style: TextStyle(
                        fontSize: 14, color: Theme.of(context).hintColor),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
          ),
          const SizedBox(width: 10),
          // Icon(Icons.search, size: 25, color: fromDialog! ? Theme.of(context).disabledColor : Theme.of(context).textTheme.bodyLarge!.color),
        ]),
      ),
    );
  }
}
