/*
 * Author: Trung Shin
 */

enum Gender {
  female,
  male,
  unknown,
}

class GenderUtil {
  static const int FEMALE = 0;
  static const int MALE = 1;
  static const int UNKNOWN = 2;

  static Gender getGender(int gender) {
    switch (gender) {
      case FEMALE:
        return Gender.female;
      case MALE:
        return Gender.male;
      default:
        return Gender.unknown;
    }
  }
}
