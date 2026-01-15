class EndPoints {
  // static const String getNews = "/v2/everything";
  // static const String getSources = "/v2/top-headlines/sources";

  static String getNews(String id) => "/v2/everything/$id";

  static String getSources(String? id) => "/v2/top-headlines/sources/$id";
}
