/*
 * Author: Trung Shin
 */

class GenderUtil {
  static const String MALE = 'male';
  static const String FEMALE = 'female';
  static const String UNKNOWN = 'unknown';

  static String checkGender(dynamic gender) {
    if (gender == null) return UNKNOWN;
    if (gender.toString() == MALE)
      return MALE;
    else if (gender.toString() == FEMALE)
      return FEMALE;
    else
      return UNKNOWN;
  }
}
