class AppConfig {
  // static const baseUrl = "https://jsonplaceholder.typicode.com";
  // static const signIn = '$baseUrl/users';

  static const baseUrl = "https://dummyjson.com";
  static const auth = '$baseUrl/auth';
  static const signIn = '$auth/login';

  // For post Url is https://dummyjson.com/docs/posts
  static const posts = '$baseUrl/posts';
}
