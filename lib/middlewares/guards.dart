//TODO: right now there is no guards later we should atth them : authenticated, roles permissions...

//guard names
const authenticated = "LOGGED-IN";
const notAuthenticated = "NOT-LOGGED-IN";

//check guards
final Map<String, Function> checkGuardMethods = {
  authenticated: () {
    //TODO: authenticad logic
    return false;
  },
  notAuthenticated: () {
    //TODO: not authenticated logic
    return true;
  },
};
