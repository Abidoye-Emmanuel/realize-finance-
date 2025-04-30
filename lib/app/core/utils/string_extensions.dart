import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;

class StringUtils {
  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text.split(' ').map((word) => capitalizeFirstLetter(word)).join(' ');
  }

  static String capitalizeFirstLetter(String word) {
    if (word.isEmpty) {
      return word;
    }
    return word[0].toUpperCase() + word.substring(1).toLowerCase();
  }
  // You can add more string-related utility functions here if needed.

  static bool isValidEmail(String? email) {
    if (email == null || email.isEmpty) return false;
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  static String capitalizeFirstLetterOfEachWord(String text) {
    if (text.isEmpty) return ''; // Return an empty string if the input is empty

    List<String> words = text.split(' '); // Split the text into words
    List<String> capitalizedWords = words.map((word) {
      if (word.isEmpty) return ''; // Return an empty string for empty words
      return word[0].toUpperCase() +
          word.substring(1); // Capitalize the first letter of each word
    }).toList();

    return capitalizedWords.join(' '); // Join the words back into a string
  }

  static String formatPrice(String price) {
    final formatter = NumberFormat('#,###');
    final cleanedPrice = price.replaceAll(
        RegExp(r'[^0-9]'), ''); // Remove non-numeric characters
    if (cleanedPrice.isEmpty) {
      return ''; // Return an empty string if there are no valid digits
    }
    return formatter.format(int.parse(cleanedPrice));
  }

  static String convertDateFormat(String dateString) {
    // Parse the input string into a DateTime object
    DateTime dateTime = DateTime.parse(dateString);

    // Format the DateTime object into the desired format (MM-dd-yyyy)
    String formattedDate = '${dateTime.month.toString().padLeft(2, '0')}-'
        '${dateTime.day.toString().padLeft(2, '0')}-'
        '${dateTime.year.toString()}';

    return formattedDate;
  }

  static String getTimeAgo(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);

    timeago.setLocaleMessages('en', timeago.EnMessages());

    return timeago.format(dateTime, allowFromNow: true, locale: 'en');
  }

  static String sliceText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return '${text.substring(0, maxLength)}...';
    }
  }

  static String getMonthYear(String timestamp) {
    DateTime dateTime = DateTime.parse(timestamp);

    // Format the timestamp to display month and year
    String monthYear = '${_getMonth(dateTime.month)} ${dateTime.year}';
    return monthYear;
  }

  static String _getMonth(int month) {
    const monthNames = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    return monthNames[month - 1];
  }
}
