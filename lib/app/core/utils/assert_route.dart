assertRoute(String path) {
  bool verifyPath = path.endsWith('/');
  String route = '';

  if (!verifyPath) {
    route = path + "/";
  }
  return route;
}
