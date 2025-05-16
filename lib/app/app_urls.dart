class AppUrls {
  static const String _baseurl = 'https://task.teamrabbil.com/api/v1';
  static const String registrationUrl = '$_baseurl/registration';
  static const String loginUrl = '$_baseurl/login';
  static const String createUrl = '$_baseurl/createTask';
  static String listTaskByStatus(String status) => '$_baseurl/listTaskByStatus/$status';
  static String updateTaskStatusUrl(String id, status) =>
      '$_baseurl/updateTaskStatus/$id/$status';
}