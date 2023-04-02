import 'package:e_cinemav1/session/model/session_model.dart';

import '../../home/model/movie_model.dart';

class SessionManager {
  final Movie movie;

  SessionManager(this.movie);

  List<Session> getSessionByDate(DateTime giveDate) {
    List<Session> sessions = [];

    for (var session in movie.sessions) {
      var date =
          DateTime(session.date.year, session.date.month, session.date.day);
      if (date == giveDate) {
        sessions.add(session);
      }
    }
    return sessions;
  }
  List<Session> getSessionByDateAndTimeSorted(DateTime giveDate){
    List<Session> sessions = getSessionByDate(giveDate);
    sessions.sort((a,b) => a.time.compareTo(b.time));
    return sessions;
  }
}
