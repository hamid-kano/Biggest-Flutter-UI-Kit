class SocialUser {
  var name;
  var info;
  var duration;
  var call;
  late var image;
}

class Media {
  var image;

  Media(this.image);
}

class Qr {
  var code;

  Qr(this.code);
}

class Chat {
  var msg;
  var isSender;
  var type;
  var duration;
}
