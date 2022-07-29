

class ServerConfig{

  static String  domainName='http://127.0.0.1:8000/';
  static String login='api/auth/login';

  static String logout='api/logout';
  static String addUser='api/admin/user/add';
  static String addTask='api/admin/task/add';

  static String addTeam='api/admin/department/add';
  static String editTeam='api/admin/department/update/';
  static String addMeeting='api/admin/meeting/add';
  static String showTeams='api/admin/department/show/team';

  static String getCommentsByTaskId = "api/task/show/comments/3";
  static String showUsers = "api/admin/user/show/users";
  static String postCommentToTask = "api/task/3/comment/add";


}