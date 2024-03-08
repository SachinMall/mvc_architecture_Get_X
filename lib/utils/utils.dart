import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  static void feildFocusChange(
      BuildContext context, FocusNode current, FocusNode nextFocus) {
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static String getMessage(String text) {
    String str = text;
    str = str.substring(0, str.indexOf(" at"));
    return str.capitalizeFirst.toString();
  }

  // static String getTimeOfLog(String text) {
  //   String str = text;
  //   DateTime utcDateTime = DateTime.parse(str);
  //   DateTime istDateTime = utcDateTime.toLocal();
  //   var formatter = DateFormat('dd MMM yyyy, hh:mm a');
  //   final String formatted = formatter.format(istDateTime);
  //   return formatted;
  // }

  static List<DropdownMenuItem<String>> addDividersAfterItems(
      List<String> items) {
    List<DropdownMenuItem<String>> menuItems = [];
    for (var item in items) {
      menuItems.addAll(
        [
          DropdownMenuItem<String>(
            value: item,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                item,
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          //If it's last item, we will not add Divider after it.
          if (item != items.last)
            const DropdownMenuItem<String>(
              enabled: false,
              child: Divider(),
            ),
        ],
      );
    }
    return menuItems;
  }

  static List<double> getCustomItemsHeights(List<String> list) {
    List<double> itemsHeights = [];
    for (var i = 0; i < (list.length * 2) - 1; i++) {
      if (i.isEven) {
        itemsHeights.add(40);
      }
      //Dividers indexes will be the odd indexes
      if (i.isOdd) {
        itemsHeights.add(4);
      }
    }
    return itemsHeights;
  }

  // void showToast(BuildContext context, String message) {
  //   final scaffold = ScaffoldMessenger.of(context);
  //   scaffold.showSnackBar(
  //     SnackBar(
  //       content: Align(
  //         alignment: Alignment.center,
  //         child: Container(
  //           padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
  //           decoration: BoxDecoration(
  //             color: Colors.black87,
  //             borderRadius: BorderRadius.circular(8),
  //           ),
  //           child: Text(
  //             message,
  //             style: TextStyle(color: Colors.white),
  //           ),
  //         ),
  //       ),
  //       duration: Duration(seconds: 2),
  //       behavior: SnackBarBehavior.floating,
  //     ),
  //   );
  // }

  void showToast(
      BuildContext context, String message, double xPos, double yPos) {
    final overlay = Overlay.of(context).context;

    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: xPos - 100, // Adjust the xOffset to center the toast horizontally
        top: yPos - 50, // Adjust the yOffset to center the toast vertically
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );

    Overlay.of(overlay).insert(overlayEntry);

    // Show the toast for 2 seconds and then remove it from the overlay
    Future.delayed(const Duration(seconds: 2), () {
      overlayEntry.remove();
    });
  }


 
}
