

class ServerConfig{

  static String  domainName='http://10.0.2.2:8000/';
  static String login='api/auth/login';

  static String logout='api/logout';
  static String addUser='api/admin/user/add';
  static String addTask='api/admin/task/add';

  static String addTeam='api/admin/department/add';
  static String editTeam='api/admin/department/update/';
  static String addMeeting='api/admin/meeting/add';
  static String showTeams='api/admin/department/show/team';

  static String getCommentsByTaskId = "api/task/show/comments/3";
  static String showUsers = "api/admin/user/show/with/details";
  static String postCommentToTask = "api/task/3/comment/add";
  static String deleteUser = "api/admin/user/delete/";
  static String updateUser = "api/admin/user/update/";

}