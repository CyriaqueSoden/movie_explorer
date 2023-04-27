class Token {
  final String accessToken;
  final String refreshToken;

  Token(this.accessToken, this.refreshToken);

  factory Token.fromJson(Map<String, dynamic> json) =>
      Token(json['access_token'], json['refresh_token']);

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
    };
  }
}
