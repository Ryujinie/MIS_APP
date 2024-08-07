// ========================== Sample NewsEvents Data ==========================
class NewsEvents {
  final String newsID;
  final String newsDescription;
  final String newsSubject;

  NewsEvents({
    required this.newsID,
    required this.newsDescription,
    required this.newsSubject,
  });
}

final List<NewsEvents> newsEvents = [
  NewsEvents(
    newsID: '1',
    newsDescription: "Board meeting",
    newsSubject: "SMESoft Inc.",
  ),
  NewsEvents(
    newsID: '2',
    newsDescription: "Management Information System",
    newsSubject: "Internship project",
  ),
  NewsEvents(
    newsID: '3',
    newsDescription: "Independence Day",
    newsSubject: "Public Holiday",
  ),
  NewsEvents(
    newsID: '4',
    newsDescription: "Cybersecurity Seminar",
    newsSubject: "Seminar",
  ),
  NewsEvents(
    newsID: '5',
    newsDescription: "Project Management 101",
    newsSubject: "Course Offering",
  ),
];
