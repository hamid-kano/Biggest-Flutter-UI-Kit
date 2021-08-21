class SDLessonsDetailsModel {
  String? chapterName;
  String? chapterDetails;
  String? score;

  SDLessonsDetailsModel({
    this.chapterName,
    this.chapterDetails,
    this.score,
  });
}

List<SDLessonsDetailsModel> chapters = [
  SDLessonsDetailsModel(chapterName: 'Introduction', chapterDetails: 'Introduction to geography', score: '81'),
  SDLessonsDetailsModel(chapterName: 'Maps type & Usages', chapterDetails: 'Learn about maps type & how to use each...', score: '79'),
  SDLessonsDetailsModel(chapterName: 'Population & Country', chapterDetails: 'Learn the worldwide population & country...', score: '80'),
  SDLessonsDetailsModel(chapterName: 'Climate ', chapterDetails: 'Learn about climate...', score: '60'),
  SDLessonsDetailsModel(chapterName: 'Earth-forming Process ', chapterDetails: 'Learn how the earth-forming process be...', score: '56'),
  SDLessonsDetailsModel(chapterName: 'Rocks', chapterDetails: 'Learn the type of the rocks,and their spec...', score: '90'),
  SDLessonsDetailsModel(chapterName: 'Earthquake', chapterDetails: 'Learn about seismology...', score: '90'),
];
