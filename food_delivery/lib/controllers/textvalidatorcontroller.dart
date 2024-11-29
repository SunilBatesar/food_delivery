class Textvalidatorcontroller {
  static nametextvalidator(String? v) {
    if (v == null || v.isEmpty) {
      return "Please enter your name"; 
    } else {
      return null;
    }
  }

  static phonenumbertextvalidator(String? v) {
    if (v == null || v.isEmpty) {
      return "Please enter your Number";
    } else if (v.length < 10) {
      return "Please enter a valid Mobile Number";
    } else {
      return null;
    }
  }

  static emailtextvalidator(String? v) {
    if (v == null || v.isEmpty) {
      return "Please enter your email";
    } else if (!v.endsWith("@gmail.com")) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  static passwordtextvalidator(String? v) {
    if (v == null || v.isEmpty) {
      return "Please enter your password";
    } else if (v.length < 4) {
      return "Please enter atleast 4 characters as password";
    } else {
      return null;
    }
  }
}
