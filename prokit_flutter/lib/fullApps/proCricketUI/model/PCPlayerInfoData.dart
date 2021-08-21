class PCPlayerInfoData {
  IplStats? iplStats;
  OdiStats? odiStats;
  PlayerCareer? playerCareer;
  PlayerInfo? playerInfo;
  String? playerProfile;
  T20iStats? t20iStats;
  TestStats? testStats;

  PCPlayerInfoData({this.iplStats, this.odiStats, this.playerCareer, this.playerInfo, this.playerProfile, this.t20iStats, this.testStats});

  factory PCPlayerInfoData.fromJson(Map<String, dynamic> json) {
    return PCPlayerInfoData(
      iplStats: json['iplStats'] != null ? IplStats.fromJson(json['iplStats']) : null,
      odiStats: json['odiStats'] != null ? OdiStats.fromJson(json['odiStats']) : null,
      playerCareer: json['playerCareer'] != null ? PlayerCareer.fromJson(json['playerCareer']) : null,
      playerInfo: json['playerInfo'] != null ? PlayerInfo.fromJson(json['playerInfo']) : null,
      playerProfile: json['playerProfile'],
      t20iStats: json['t20iStats'] != null ? T20iStats.fromJson(json['t20iStats']) : null,
      testStats: json['testStats'] != null ? TestStats.fromJson(json['testStats']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['playerProfile'] = this.playerProfile;
    if (this.iplStats != null) {
      data['iplStats'] = this.iplStats!.toJson();
    }
    if (this.odiStats != null) {
      data['odiStats'] = this.odiStats!.toJson();
    }
    if (this.playerCareer != null) {
      data['playerCareer'] = this.playerCareer!.toJson();
    }
    if (this.playerInfo != null) {
      data['playerInfo'] = this.playerInfo!.toJson();
    }
    if (this.t20iStats != null) {
      data['t20iStats'] = this.t20iStats!.toJson();
    }
    if (this.testStats != null) {
      data['testStats'] = this.testStats!.toJson();
    }
    return data;
  }
}

class PlayerCareer {
  String? clDebut;
  String? clDebutAgainst;
  String? clDebutAgainstId;
  String? clDebutAt;
  String? clDebutAtId;
  String? clMatchId;
  // ignore: non_constant_identifier_names
  String? cl_debut_match_id;
  String? intlDebutAgainst;
  String? intlDebutAgainstId;
  String? intlDebutAt;
  String? intlDebutAtId;
  String? intlDebutMatchId;
  String? intlDebutMatchTypeId;
  String? intlDebutOn;
  String? intlLastAgainst;
  String? intlLastAgainstId;
  String? intlLastAt;
  String? intlLastAtId;
  String? intlLastMatchId;
  String? intlLastMatchTypeId;
  String? intlLastPlayedOn;
  String? iplDebut;
  String? iplDebutAgainst;
  String? iplDebutAgainstId;
  String? iplDebutAt;
  String? iplDebutAtId;
  String? iplMatchId;
  // ignore: non_constant_identifier_names
  String? ipl_debut_match_id;
  String? lastClPlayed;
  String? lastClPlayedAgainst;
  String? lastClPlayedAgainstId;
  String? lastClPlayedAt;
  String? lastClPlayedAtId;
  String? lastIplPlayed;
  String? lastIplPlayedAgainst;
  String? lastIplPlayedAgainstId;
  String? lastIplPlayedAt;
  String? lastIplPlayedAtId;
  String? lastOdiPlayed;
  String? lastOdiPlayedAgainst;
  String? lastOdiPlayedAgainstId;
  String? lastOdiPlayedAt;
  String? lastOdiPlayedAtId;
  String? lastT20iPlayed;
  String? lastT20iPlayedAgainst;
  String? lastT20iPlayedAgainstId;
  String? lastT20iPlayedAt;
  String? lastT20iPlayedAtId;
  String? lastTestPlayed;
  String? lastTestPlayedAgainst;
  String? lastTestPlayedAgainstId;
  String? lastTestPlayedAt;
  String? lastTestPlayedAtId;
  String? odiDebut;
  String? odiDebutAgainst;
  String? odiDebutAgainstId;
  String? odiDebutAt;
  String? odiDebutAtId;
  String? odiMatchId;
  // ignore: non_constant_identifier_names
  String? odi_debut_match_id;
  String? t20iDebut;
  String? t20iDebutAgainst;
  String? t20iDebutAgainstId;
  String? t20iDebutAt;
  String? t20iDebutAtId;
  String? t20iMatchId;
  // ignore: non_constant_identifier_names
  String? t20i_debut_match_id;
  String? testDebut;
  String? testDebutAgainst;
  String? testDebutAgainstId;
  String? testDebutAt;
  String? testDebutAtId;
  String? testMatchId;
  // ignore: non_constant_identifier_names
  String? test_debut_match_id;

  PlayerCareer(
      {this.clDebut,
      this.clDebutAgainst,
      this.clDebutAgainstId,
      this.clDebutAt,
      this.clDebutAtId,
      this.clMatchId,
      // ignore: non_constant_identifier_names
      this.cl_debut_match_id,
      this.intlDebutAgainst,
      this.intlDebutAgainstId,
      this.intlDebutAt,
      this.intlDebutAtId,
      this.intlDebutMatchId,
      this.intlDebutMatchTypeId,
      this.intlDebutOn,
      this.intlLastAgainst,
      this.intlLastAgainstId,
      this.intlLastAt,
      this.intlLastAtId,
      this.intlLastMatchId,
      this.intlLastMatchTypeId,
      this.intlLastPlayedOn,
      this.iplDebut,
      this.iplDebutAgainst,
      this.iplDebutAgainstId,
      this.iplDebutAt,
      this.iplDebutAtId,
      this.iplMatchId,
      // ignore: non_constant_identifier_names
      this.ipl_debut_match_id,
      this.lastClPlayed,
      this.lastClPlayedAgainst,
      this.lastClPlayedAgainstId,
      this.lastClPlayedAt,
      this.lastClPlayedAtId,
      this.lastIplPlayed,
      this.lastIplPlayedAgainst,
      this.lastIplPlayedAgainstId,
      this.lastIplPlayedAt,
      this.lastIplPlayedAtId,
      this.lastOdiPlayed,
      this.lastOdiPlayedAgainst,
      this.lastOdiPlayedAgainstId,
      this.lastOdiPlayedAt,
      this.lastOdiPlayedAtId,
      this.lastT20iPlayed,
      this.lastT20iPlayedAgainst,
      this.lastT20iPlayedAgainstId,
      this.lastT20iPlayedAt,
      this.lastT20iPlayedAtId,
      this.lastTestPlayed,
      this.lastTestPlayedAgainst,
      this.lastTestPlayedAgainstId,
      this.lastTestPlayedAt,
      this.lastTestPlayedAtId,
      this.odiDebut,
      this.odiDebutAgainst,
      this.odiDebutAgainstId,
      this.odiDebutAt,
      this.odiDebutAtId,
      this.odiMatchId,
      // ignore: non_constant_identifier_names
      this.odi_debut_match_id,
      this.t20iDebut,
      this.t20iDebutAgainst,
      this.t20iDebutAgainstId,
      this.t20iDebutAt,
      this.t20iDebutAtId,
      this.t20iMatchId,
      // ignore: non_constant_identifier_names
      this.t20i_debut_match_id,
      this.testDebut,
      this.testDebutAgainst,
      this.testDebutAgainstId,
      this.testDebutAt,
      this.testDebutAtId,
      this.testMatchId,
      // ignore: non_constant_identifier_names
      this.test_debut_match_id});

  factory PlayerCareer.fromJson(Map<String, dynamic> json) {
    return PlayerCareer(
      clDebut: json['clDebut'],
      clDebutAgainst: json['clDebutAgainst'],
      clDebutAgainstId: json['clDebutAgainstId'],
      clDebutAt: json['clDebutAt'],
      clDebutAtId: json['clDebutAtId'],
      clMatchId: json['clMatchId'],
      cl_debut_match_id: json['cl_debut_match_id'],
      intlDebutAgainst: json['intlDebutAgainst'],
      intlDebutAgainstId: json['intlDebutAgainstId'],
      intlDebutAt: json['intlDebutAt'],
      intlDebutAtId: json['intlDebutAtId'],
      intlDebutMatchId: json['intlDebutMatchId'],
      intlDebutMatchTypeId: json['intlDebutMatchTypeId'],
      intlDebutOn: json['intlDebutOn'],
      intlLastAgainst: json['intlLastAgainst'],
      intlLastAgainstId: json['intlLastAgainstId'],
      intlLastAt: json['intlLastAt'],
      intlLastAtId: json['intlLastAtId'],
      intlLastMatchId: json['intlLastMatchId'],
      intlLastMatchTypeId: json['intlLastMatchTypeId'],
      intlLastPlayedOn: json['intlLastPlayedOn'],
      iplDebut: json['iplDebut'],
      iplDebutAgainst: json['iplDebutAgainst'],
      iplDebutAgainstId: json['iplDebutAgainstId'],
      iplDebutAt: json['iplDebutAt'],
      iplDebutAtId: json['iplDebutAtId'],
      iplMatchId: json['iplMatchId'],
      ipl_debut_match_id: json['ipl_debut_match_id'],
      lastClPlayed: json['lastClPlayed'],
      lastClPlayedAgainst: json['lastClPlayedAgainst'],
      lastClPlayedAgainstId: json['lastClPlayedAgainstId'],
      lastClPlayedAt: json['lastClPlayedAt'],
      lastClPlayedAtId: json['lastClPlayedAtId'],
      lastIplPlayed: json['lastIplPlayed'],
      lastIplPlayedAgainst: json['lastIplPlayedAgainst'],
      lastIplPlayedAgainstId: json['lastIplPlayedAgainstId'],
      lastIplPlayedAt: json['lastIplPlayedAt'],
      lastIplPlayedAtId: json['lastIplPlayedAtId'],
      lastOdiPlayed: json['lastOdiPlayed'],
      lastOdiPlayedAgainst: json['lastOdiPlayedAgainst'],
      lastOdiPlayedAgainstId: json['lastOdiPlayedAgainstId'],
      lastOdiPlayedAt: json['lastOdiPlayedAt'],
      lastOdiPlayedAtId: json['lastOdiPlayedAtId'],
      lastT20iPlayed: json['lastT20iPlayed'],
      lastT20iPlayedAgainst: json['lastT20iPlayedAgainst'],
      lastT20iPlayedAgainstId: json['lastT20iPlayedAgainstId'],
      lastT20iPlayedAt: json['lastT20iPlayedAt'],
      lastT20iPlayedAtId: json['lastT20iPlayedAtId'],
      lastTestPlayed: json['lastTestPlayed'],
      lastTestPlayedAgainst: json['lastTestPlayedAgainst'],
      lastTestPlayedAgainstId: json['lastTestPlayedAgainstId'],
      lastTestPlayedAt: json['lastTestPlayedAt'],
      lastTestPlayedAtId: json['lastTestPlayedAtId'],
      odiDebut: json['odiDebut'],
      odiDebutAgainst: json['odiDebutAgainst'],
      odiDebutAgainstId: json['odiDebutAgainstId'],
      odiDebutAt: json['odiDebutAt'],
      odiDebutAtId: json['odiDebutAtId'],
      odiMatchId: json['odiMatchId'],
      odi_debut_match_id: json['odi_debut_match_id'],
      t20iDebut: json['t20iDebut'],
      t20iDebutAgainst: json['t20iDebutAgainst'],
      t20iDebutAgainstId: json['t20iDebutAgainstId'],
      t20iDebutAt: json['t20iDebutAt'],
      t20iDebutAtId: json['t20iDebutAtId'],
      t20iMatchId: json['t20iMatchId'],
      t20i_debut_match_id: json['t20i_debut_match_id'],
      testDebut: json['testDebut'],
      testDebutAgainst: json['testDebutAgainst'],
      testDebutAgainstId: json['testDebutAgainstId'],
      testDebutAt: json['testDebutAt'],
      testDebutAtId: json['testDebutAtId'],
      testMatchId: json['testMatchId'],
      test_debut_match_id: json['test_debut_match_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clDebut'] = this.clDebut;
    data['clDebutAgainst'] = this.clDebutAgainst;
    data['clDebutAgainstId'] = this.clDebutAgainstId;
    data['clDebutAt'] = this.clDebutAt;
    data['clDebutAtId'] = this.clDebutAtId;
    data['clMatchId'] = this.clMatchId;
    data['cl_debut_match_id'] = this.cl_debut_match_id;
    data['intlDebutAgainst'] = this.intlDebutAgainst;
    data['intlDebutAgainstId'] = this.intlDebutAgainstId;
    data['intlDebutAt'] = this.intlDebutAt;
    data['intlDebutAtId'] = this.intlDebutAtId;
    data['intlDebutMatchId'] = this.intlDebutMatchId;
    data['intlDebutMatchTypeId'] = this.intlDebutMatchTypeId;
    data['intlDebutOn'] = this.intlDebutOn;
    data['intlLastAgainst'] = this.intlLastAgainst;
    data['intlLastAgainstId'] = this.intlLastAgainstId;
    data['intlLastAt'] = this.intlLastAt;
    data['intlLastAtId'] = this.intlLastAtId;
    data['intlLastMatchId'] = this.intlLastMatchId;
    data['intlLastMatchTypeId'] = this.intlLastMatchTypeId;
    data['intlLastPlayedOn'] = this.intlLastPlayedOn;
    data['iplDebut'] = this.iplDebut;
    data['iplDebutAgainst'] = this.iplDebutAgainst;
    data['iplDebutAgainstId'] = this.iplDebutAgainstId;
    data['iplDebutAt'] = this.iplDebutAt;
    data['iplDebutAtId'] = this.iplDebutAtId;
    data['iplMatchId'] = this.iplMatchId;
    data['ipl_debut_match_id'] = this.ipl_debut_match_id;
    data['lastClPlayed'] = this.lastClPlayed;
    data['lastClPlayedAgainst'] = this.lastClPlayedAgainst;
    data['lastClPlayedAgainstId'] = this.lastClPlayedAgainstId;
    data['lastClPlayedAt'] = this.lastClPlayedAt;
    data['lastClPlayedAtId'] = this.lastClPlayedAtId;
    data['lastIplPlayed'] = this.lastIplPlayed;
    data['lastIplPlayedAgainst'] = this.lastIplPlayedAgainst;
    data['lastIplPlayedAgainstId'] = this.lastIplPlayedAgainstId;
    data['lastIplPlayedAt'] = this.lastIplPlayedAt;
    data['lastIplPlayedAtId'] = this.lastIplPlayedAtId;
    data['lastOdiPlayed'] = this.lastOdiPlayed;
    data['lastOdiPlayedAgainst'] = this.lastOdiPlayedAgainst;
    data['lastOdiPlayedAgainstId'] = this.lastOdiPlayedAgainstId;
    data['lastOdiPlayedAt'] = this.lastOdiPlayedAt;
    data['lastOdiPlayedAtId'] = this.lastOdiPlayedAtId;
    data['lastT20iPlayed'] = this.lastT20iPlayed;
    data['lastT20iPlayedAgainst'] = this.lastT20iPlayedAgainst;
    data['lastT20iPlayedAgainstId'] = this.lastT20iPlayedAgainstId;
    data['lastT20iPlayedAt'] = this.lastT20iPlayedAt;
    data['lastT20iPlayedAtId'] = this.lastT20iPlayedAtId;
    data['lastTestPlayed'] = this.lastTestPlayed;
    data['lastTestPlayedAgainst'] = this.lastTestPlayedAgainst;
    data['lastTestPlayedAgainstId'] = this.lastTestPlayedAgainstId;
    data['lastTestPlayedAt'] = this.lastTestPlayedAt;
    data['lastTestPlayedAtId'] = this.lastTestPlayedAtId;
    data['odiDebut'] = this.odiDebut;
    data['odiDebutAgainst'] = this.odiDebutAgainst;
    data['odiDebutAgainstId'] = this.odiDebutAgainstId;
    data['odiDebutAt'] = this.odiDebutAt;
    data['odiDebutAtId'] = this.odiDebutAtId;
    data['odiMatchId'] = this.odiMatchId;
    data['odi_debut_match_id'] = this.odi_debut_match_id;
    data['t20iDebut'] = this.t20iDebut;
    data['t20iDebutAgainst'] = this.t20iDebutAgainst;
    data['t20iDebutAgainstId'] = this.t20iDebutAgainstId;
    data['t20iDebutAt'] = this.t20iDebutAt;
    data['t20iDebutAtId'] = this.t20iDebutAtId;
    data['t20iMatchId'] = this.t20iMatchId;
    data['t20i_debut_match_id'] = this.t20i_debut_match_id;
    data['testDebut'] = this.testDebut;
    data['testDebutAgainst'] = this.testDebutAgainst;
    data['testDebutAgainstId'] = this.testDebutAgainstId;
    data['testDebutAt'] = this.testDebutAt;
    data['testDebutAtId'] = this.testDebutAtId;
    data['testMatchId'] = this.testMatchId;
    data['test_debut_match_id'] = this.test_debut_match_id;
    return data;
  }
}

class T20iStats {
  int? bBIruns;
  int? bBIwickets;
  int? bBMruns;
  int? bBMwickets;
  int? ballsBowled;
  int? ballsTaken;
  double? batAverage;
  double? batStrikeRate;
  double? bowlAverage;
  int? bowlInnings;
  double? bowlStrikeRate;
  int? doubleHundreds;
  int? ducks;
  double? economy;
  int? fifties;
  int? fiveWicket;
  int? fourWicket;
  int? fours;
  int? highestScore;
  int? hundreds;
  int? id;
  int? innings;
  int? keepingCatches;
  int? keepingDismissals;
  int? maidens;
  int? matches;
  int? notouts;
  int? quadrupleHundreds;
  int? runs;
  int? runsGiven;
  int? sixes;
  int? stumpings;
  int? tenWicket;
  int? tripleHundreds;
  int? wicketsTaken;

  T20iStats(
      {this.bBIruns,
      this.bBIwickets,
      this.bBMruns,
      this.bBMwickets,
      this.ballsBowled,
      this.ballsTaken,
      this.batAverage,
      this.batStrikeRate,
      this.bowlAverage,
      this.bowlInnings,
      this.bowlStrikeRate,
      this.doubleHundreds,
      this.ducks,
      this.economy,
      this.fifties,
      this.fiveWicket,
      this.fourWicket,
      this.fours,
      this.highestScore,
      this.hundreds,
      this.id,
      this.innings,
      this.keepingCatches,
      this.keepingDismissals,
      this.maidens,
      this.matches,
      this.notouts,
      this.quadrupleHundreds,
      this.runs,
      this.runsGiven,
      this.sixes,
      this.stumpings,
      this.tenWicket,
      this.tripleHundreds,
      this.wicketsTaken});

  factory T20iStats.fromJson(Map<String, dynamic> json) {
    return T20iStats(
      bBIruns: json['bBIruns'],
      bBIwickets: json['bBIwickets'],
      bBMruns: json['bBMruns'],
      bBMwickets: json['bBMwickets'],
      ballsBowled: json['ballsBowled'],
      ballsTaken: json['ballsTaken'],
      batAverage: json['batAverage'],
      batStrikeRate: json['batStrikeRate'],
      bowlAverage: json['bowlAverage'],
      bowlInnings: json['bowlInnings'],
      bowlStrikeRate: json['bowlStrikeRate'],
      doubleHundreds: json['doubleHundreds'],
      ducks: json['ducks'],
      economy: json['economy'],
      fifties: json['fifties'],
      fiveWicket: json['fiveWicket'],
      fourWicket: json['fourWicket'],
      fours: json['fours'],
      highestScore: json['highestScore'],
      hundreds: json['hundreds'],
      id: json['id'],
      innings: json['innings'],
      keepingCatches: json['keepingCatches'],
      keepingDismissals: json['keepingDismissals'],
      maidens: json['maidens'],
      matches: json['matches'],
      notouts: json['notouts'],
      quadrupleHundreds: json['quadrupleHundreds'],
      runs: json['runs'],
      runsGiven: json['runsGiven'],
      sixes: json['sixes'],
      stumpings: json['stumpings'],
      tenWicket: json['tenWicket'],
      tripleHundreds: json['tripleHundreds'],
      wicketsTaken: json['wicketsTaken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bBIruns'] = this.bBIruns;
    data['bBIwickets'] = this.bBIwickets;
    data['bBMruns'] = this.bBMruns;
    data['bBMwickets'] = this.bBMwickets;
    data['ballsBowled'] = this.ballsBowled;
    data['ballsTaken'] = this.ballsTaken;
    data['batAverage'] = this.batAverage;
    data['batStrikeRate'] = this.batStrikeRate;
    data['bowlAverage'] = this.bowlAverage;
    data['bowlInnings'] = this.bowlInnings;
    data['bowlStrikeRate'] = this.bowlStrikeRate;
    data['doubleHundreds'] = this.doubleHundreds;
    data['ducks'] = this.ducks;
    data['economy'] = this.economy;
    data['fifties'] = this.fifties;
    data['fiveWicket'] = this.fiveWicket;
    data['fourWicket'] = this.fourWicket;
    data['fours'] = this.fours;
    data['highestScore'] = this.highestScore;
    data['hundreds'] = this.hundreds;
    data['id'] = this.id;
    data['innings'] = this.innings;
    data['keepingCatches'] = this.keepingCatches;
    data['keepingDismissals'] = this.keepingDismissals;
    data['maidens'] = this.maidens;
    data['matches'] = this.matches;
    data['notouts'] = this.notouts;
    data['quadrupleHundreds'] = this.quadrupleHundreds;
    data['runs'] = this.runs;
    data['runsGiven'] = this.runsGiven;
    data['sixes'] = this.sixes;
    data['stumpings'] = this.stumpings;
    data['tenWicket'] = this.tenWicket;
    data['tripleHundreds'] = this.tripleHundreds;
    data['wicketsTaken'] = this.wicketsTaken;
    return data;
  }
}

class OdiStats {
  int? bBIruns;
  int? bBIwickets;
  int? bBMruns;
  int? bBMwickets;
  int? ballsBowled;
  int? ballsTaken;
  double? batAverage;
  double? batStrikeRate;
  double? bowlAverage;
  int? bowlInnings;
  double? bowlStrikeRate;
  int? doubleHundreds;
  int? ducks;
  double? economy;
  int? fifties;
  int? fiveWicket;
  int? fourWicket;
  int? fours;
  int? highestScore;
  int? hundreds;
  int? id;
  int? innings;
  int? keepingCatches;
  int? keepingDismissals;
  int? maidens;
  int? matches;
  int? notouts;
  int? quadrupleHundreds;
  int? runs;
  int? runsGiven;
  int? sixes;
  int? stumpings;
  int? tenWicket;
  int? tripleHundreds;
  int? wicketsTaken;

  OdiStats(
      {this.bBIruns,
      this.bBIwickets,
      this.bBMruns,
      this.bBMwickets,
      this.ballsBowled,
      this.ballsTaken,
      this.batAverage,
      this.batStrikeRate,
      this.bowlAverage,
      this.bowlInnings,
      this.bowlStrikeRate,
      this.doubleHundreds,
      this.ducks,
      this.economy,
      this.fifties,
      this.fiveWicket,
      this.fourWicket,
      this.fours,
      this.highestScore,
      this.hundreds,
      this.id,
      this.innings,
      this.keepingCatches,
      this.keepingDismissals,
      this.maidens,
      this.matches,
      this.notouts,
      this.quadrupleHundreds,
      this.runs,
      this.runsGiven,
      this.sixes,
      this.stumpings,
      this.tenWicket,
      this.tripleHundreds,
      this.wicketsTaken});

  factory OdiStats.fromJson(Map<String, dynamic> json) {
    return OdiStats(
      bBIruns: json['bBIruns'],
      bBIwickets: json['bBIwickets'],
      bBMruns: json['BBMruns'],
      bBMwickets: json['BBMwickets'],
      ballsBowled: json['ballsBowled'],
      ballsTaken: json['ballsTaken'],
      batAverage: json['BatAverage'],
      batStrikeRate: json['BatStrikeRate'],
      bowlAverage: json['BowlAverage'],
      bowlInnings: json['BowlInnings'],
      bowlStrikeRate: json['BowlStrikeRate'],
      doubleHundreds: json['doubleHundreds'],
      ducks: json['ducks'],
      economy: json['Economy'],
      fifties: json['Fifties'],
      fiveWicket: json['FiveWicket'],
      fourWicket: json['FourWicket'],
      fours: json['Fours'],
      highestScore: json['HighestScore'],
      hundreds: json['Hundreds'],
      id: json['id'],
      innings: json['Innings'],
      keepingCatches: json['keepingCatches'],
      keepingDismissals: json['keepingDismissals'],
      maidens: json['Maidens'],
      matches: json['Matches'],
      notouts: json['notouts'],
      quadrupleHundreds: json['quadrupleHundreds'],
      runs: json['Runs'],
      runsGiven: json['runsGiven'],
      sixes: json['Sixes'],
      stumpings: json['Stumpings'],
      tenWicket: json['tenWicket'],
      tripleHundreds: json['tripleHundreds'],
      wicketsTaken: json['WicketsTaken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bBIruns'] = this.bBIruns;
    data['bBIwickets'] = this.bBIwickets;
    data['bBMruns'] = this.bBMruns;
    data['bBMwickets'] = this.bBMwickets;
    data['ballsBowled'] = this.ballsBowled;
    data['ballsTaken'] = this.ballsTaken;
    data['batAverage'] = this.batAverage;
    data['batStrikeRate'] = this.batStrikeRate;
    data['bowlAverage'] = this.bowlAverage;
    data['bowlInnings'] = this.bowlInnings;
    data['bowlStrikeRate'] = this.bowlStrikeRate;
    data['doubleHundreds'] = this.doubleHundreds;
    data['ducks'] = this.ducks;
    data['economy'] = this.economy;
    data['fifties'] = this.fifties;
    data['fiveWicket'] = this.fiveWicket;
    data['fourWicket'] = this.fourWicket;
    data['fours'] = this.fours;
    data['highestScore'] = this.highestScore;
    data['hundreds'] = this.hundreds;
    data['id'] = this.id;
    data['innings'] = this.innings;
    data['keepingCatches'] = this.keepingCatches;
    data['keepingDismissals'] = this.keepingDismissals;
    data['maidens'] = this.maidens;
    data['matches'] = this.matches;
    data['notouts'] = this.notouts;
    data['quadrupleHundreds'] = this.quadrupleHundreds;
    data['runs'] = this.runs;
    data['runsGiven'] = this.runsGiven;
    data['sixes'] = this.sixes;
    data['stumpings'] = this.stumpings;
    data['tenWicket'] = this.tenWicket;
    data['tripleHundreds'] = this.tripleHundreds;
    data['wicketsTaken'] = this.wicketsTaken;
    return data;
  }
}

class TestStats {
  int? bBIruns;
  int? bBIwickets;
  int? bBMruns;
  int? bBMwickets;
  int? ballsBowled;
  int? ballsTaken;
  double? batAverage;
  double? batStrikeRate;
  int? bowlAverage;
  int? bowlInnings;
  int? bowlStrikeRate;
  int? doubleHundreds;
  int? ducks;
  double? economy;
  int? fifties;
  int? fiveWicket;
  int? fourWicket;
  int? fours;
  int? highestScore;
  int? hundreds;
  int? id;
  int? innings;
  int? keepingCatches;
  int? keepingDismissals;
  int? maidens;
  int? matches;
  int? notouts;
  int? quadrupleHundreds;
  int? runs;
  int? runsGiven;
  int? sixes;
  int? stumpings;
  int? tenWicket;
  int? tripleHundreds;
  int? wicketsTaken;

  TestStats(
      {this.bBIruns,
      this.bBIwickets,
      this.bBMruns,
      this.bBMwickets,
      this.ballsBowled,
      this.ballsTaken,
      this.batAverage,
      this.batStrikeRate,
      this.bowlAverage,
      this.bowlInnings,
      this.bowlStrikeRate,
      this.doubleHundreds,
      this.ducks,
      this.economy,
      this.fifties,
      this.fiveWicket,
      this.fourWicket,
      this.fours,
      this.highestScore,
      this.hundreds,
      this.id,
      this.innings,
      this.keepingCatches,
      this.keepingDismissals,
      this.maidens,
      this.matches,
      this.notouts,
      this.quadrupleHundreds,
      this.runs,
      this.runsGiven,
      this.sixes,
      this.stumpings,
      this.tenWicket,
      this.tripleHundreds,
      this.wicketsTaken});

  factory TestStats.fromJson(Map<String, dynamic> json) {
    return TestStats(
      bBIruns: json['bBIruns'],
      bBIwickets: json['bBIwickets'],
      bBMruns: json['bBMruns'],
      bBMwickets: json['bBMwickets'],
      ballsBowled: json['ballsBowled'],
      ballsTaken: json['ballsTaken'],
      batAverage: json['batAverage'],
      batStrikeRate: json['batStrikeRate'],
      bowlAverage: json['bowlAverage'],
      bowlInnings: json['bowlInnings'],
      bowlStrikeRate: json['bowlStrikeRate'],
      doubleHundreds: json['doubleHundreds'],
      ducks: json['ducks'],
      economy: json['economy'],
      fifties: json['fifties'],
      fiveWicket: json['fiveWicket'],
      fourWicket: json['fourWicket'],
      fours: json['fours'],
      highestScore: json['highestScore'],
      hundreds: json['hundreds'],
      id: json['id'],
      innings: json['innings'],
      keepingCatches: json['keepingCatches'],
      keepingDismissals: json['keepingDismissals'],
      maidens: json['maidens'],
      matches: json['matches'],
      notouts: json['notouts'],
      quadrupleHundreds: json['quadrupleHundreds'],
      runs: json['runs'],
      runsGiven: json['runsGiven'],
      sixes: json['sixes'],
      stumpings: json['stumpings'],
      tenWicket: json['tenWicket'],
      tripleHundreds: json['tripleHundreds'],
      wicketsTaken: json['wicketsTaken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bBIruns'] = this.bBIruns;
    data['bBIwickets'] = this.bBIwickets;
    data['bBMruns'] = this.bBMruns;
    data['bBMwickets'] = this.bBMwickets;
    data['ballsBowled'] = this.ballsBowled;
    data['ballsTaken'] = this.ballsTaken;
    data['batAverage'] = this.batAverage;
    data['batStrikeRate'] = this.batStrikeRate;
    data['bowlAverage'] = this.bowlAverage;
    data['bowlInnings'] = this.bowlInnings;
    data['bowlStrikeRate'] = this.bowlStrikeRate;
    data['doubleHundreds'] = this.doubleHundreds;
    data['ducks'] = this.ducks;
    data['economy'] = this.economy;
    data['fifties'] = this.fifties;
    data['fiveWicket'] = this.fiveWicket;
    data['fourWicket'] = this.fourWicket;
    data['fours'] = this.fours;
    data['highestScore'] = this.highestScore;
    data['hundreds'] = this.hundreds;
    data['id'] = this.id;
    data['innings'] = this.innings;
    data['keepingCatches'] = this.keepingCatches;
    data['keepingDismissals'] = this.keepingDismissals;
    data['maidens'] = this.maidens;
    data['matches'] = this.matches;
    data['notouts'] = this.notouts;
    data['quadrupleHundreds'] = this.quadrupleHundreds;
    data['runs'] = this.runs;
    data['runsGiven'] = this.runsGiven;
    data['sixes'] = this.sixes;
    data['stumpings'] = this.stumpings;
    data['tenWicket'] = this.tenWicket;
    data['tripleHundreds'] = this.tripleHundreds;
    data['wicketsTaken'] = this.wicketsTaken;
    return data;
  }
}

class IplStats {
  int? bBIruns;
  int? bBIwickets;
  int? bBMruns;
  int? bBMwickets;
  int? ballsBowled;
  int? ballsTaken;
  double? batAverage;
  double? batStrikeRate;
  int? bowlAverage;
  int? bowlInnings;
  double? bowlStrikeRate;
  int? doubleHundreds;
  int? ducks;
  double? economy;
  int? fifties;
  int? fiveWicket;
  int? fourWicket;
  int? fours;
  int? highestScore;
  int? hundreds;
  int? id;
  int? innings;
  int? keepingCatches;
  int? keepingDismissals;
  int? maidens;
  int? matches;
  int? notouts;
  int? quadrupleHundreds;
  int? runs;
  int? runsGiven;
  int? sixes;
  int? stumpings;
  int? tenWicket;
  int? tripleHundreds;
  int? wicketsTaken;

  IplStats(
      {this.bBIruns,
      this.bBIwickets,
      this.bBMruns,
      this.bBMwickets,
      this.ballsBowled,
      this.ballsTaken,
      this.batAverage,
      this.batStrikeRate,
      this.bowlAverage,
      this.bowlInnings,
      this.bowlStrikeRate,
      this.doubleHundreds,
      this.ducks,
      this.economy,
      this.fifties,
      this.fiveWicket,
      this.fourWicket,
      this.fours,
      this.highestScore,
      this.hundreds,
      this.id,
      this.innings,
      this.keepingCatches,
      this.keepingDismissals,
      this.maidens,
      this.matches,
      this.notouts,
      this.quadrupleHundreds,
      this.runs,
      this.runsGiven,
      this.sixes,
      this.stumpings,
      this.tenWicket,
      this.tripleHundreds,
      this.wicketsTaken});

  factory IplStats.fromJson(Map<String, dynamic> json) {
    return IplStats(
      bBIruns: json['bBIruns'],
      bBIwickets: json['bBIwickets'],
      bBMruns: json['bBMruns'],
      bBMwickets: json['bBMwickets'],
      ballsBowled: json['ballsBowled'],
      ballsTaken: json['ballsTaken'],
      batAverage: json['batAverage'],
      batStrikeRate: json['batStrikeRate'],
      bowlAverage: json['bowlAverage'],
      bowlInnings: json['bowlInnings'],
      bowlStrikeRate: json['bowlStrikeRate'],
      doubleHundreds: json['doubleHundreds'],
      ducks: json['ducks'],
      economy: json['economy'],
      fifties: json['fifties'],
      fiveWicket: json['fiveWicket'],
      fourWicket: json['fourWicket'],
      fours: json['fours'],
      highestScore: json['highestScore'],
      hundreds: json['hundreds'],
      id: json['id'],
      innings: json['innings'],
      keepingCatches: json['keepingCatches'],
      keepingDismissals: json['keepingDismissals'],
      maidens: json['maidens'],
      matches: json['matches'],
      notouts: json['notouts'],
      quadrupleHundreds: json['quadrupleHundreds'],
      runs: json['runs'],
      runsGiven: json['runsGiven'],
      sixes: json['sixes'],
      stumpings: json['stumpings'],
      tenWicket: json['tenWicket'],
      tripleHundreds: json['tripleHundreds'],
      wicketsTaken: json['wicketsTaken'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['bBIruns'] = this.bBIruns;
    data['bBIwickets'] = this.bBIwickets;
    data['bBMruns'] = this.bBMruns;
    data['bBMwickets'] = this.bBMwickets;
    data['ballsBowled'] = this.ballsBowled;
    data['ballsTaken'] = this.ballsTaken;
    data['batAverage'] = this.batAverage;
    data['batStrikeRate'] = this.batStrikeRate;
    data['bowlAverage'] = this.bowlAverage;
    data['bowlInnings'] = this.bowlInnings;
    data['bowlStrikeRate'] = this.bowlStrikeRate;
    data['doubleHundreds'] = this.doubleHundreds;
    data['ducks'] = this.ducks;
    data['economy'] = this.economy;
    data['fifties'] = this.fifties;
    data['fiveWicket'] = this.fiveWicket;
    data['fourWicket'] = this.fourWicket;
    data['fours'] = this.fours;
    data['highestScore'] = this.highestScore;
    data['hundreds'] = this.hundreds;
    data['id'] = this.id;
    data['innings'] = this.innings;
    data['keepingCatches'] = this.keepingCatches;
    data['keepingDismissals'] = this.keepingDismissals;
    data['maidens'] = this.maidens;
    data['matches'] = this.matches;
    data['notouts'] = this.notouts;
    data['quadrupleHundreds'] = this.quadrupleHundreds;
    data['runs'] = this.runs;
    data['runsGiven'] = this.runsGiven;
    data['sixes'] = this.sixes;
    data['stumpings'] = this.stumpings;
    data['tenWicket'] = this.tenWicket;
    data['tripleHundreds'] = this.tripleHundreds;
    data['wicketsTaken'] = this.wicketsTaken;
    return data;
  }
}

class PlayerInfo {
  String? birthPlace;
  // ignore: non_constant_identifier_names
  String? birth_year;
  String? completeName;
  String? coverImageName;
  // ignore: non_constant_identifier_names
  String? date_of_death;
  // ignore: non_constant_identifier_names
  String? death_year;
  String? doB;
  String? doBFormat;
  String? education;
  // ignore: non_constant_identifier_names
  int? face_image_id;
  // ignore: non_constant_identifier_names
  String? fielding_position_id;
  String? fullName;
  String? height;
  String? id;
  String? imageHeight;
  String? imageName;
  String? imageWidth;
  String? intro;
  // ignore: non_constant_identifier_names
  bool? is_woman;
  // ignore: non_constant_identifier_names
  String? known_as;
  String? nickName;
  String? other;
  // ignore: non_constant_identifier_names
  String? place_of_death;
  String? playerBatStyle;
  String? playerBowlStyle;
  // ignore: non_constant_identifier_names
  String? player_role;
  // ignore: non_constant_identifier_names
  String? playerrole_id;
  String? shortName;
  String? team;
  String? teamId;

  PlayerInfo(
      {this.birthPlace,
      // ignore: non_constant_identifier_names
      this.birth_year,
      this.completeName,
      this.coverImageName,
      // ignore: non_constant_identifier_names
      this.date_of_death,
      // ignore: non_constant_identifier_names
      this.death_year,
      this.doB,
      this.doBFormat,
      this.education,
      // ignore: non_constant_identifier_names
      this.face_image_id,
      // ignore: non_constant_identifier_names
      this.fielding_position_id,
      this.fullName,
      this.height,
      this.id,
      this.imageHeight,
      this.imageName,
      this.imageWidth,
      this.intro,
      // ignore: non_constant_identifier_names
      this.is_woman,
      // ignore: non_constant_identifier_names
      this.known_as,
      this.nickName,
      this.other,
      // ignore: non_constant_identifier_names
      this.place_of_death,
      this.playerBatStyle,
      this.playerBowlStyle,
      // ignore: non_constant_identifier_names
      this.player_role,
      // ignore: non_constant_identifier_names
      this.playerrole_id,
      this.shortName,
      this.team,
      this.teamId});

  factory PlayerInfo.fromJson(Map<String, dynamic> json) {
    return PlayerInfo(
      birthPlace: json['birthPlace'],
      birth_year: json['birth_year'],
      completeName: json['completeName'],
      coverImageName: json['coverImageName'],
      date_of_death: json['date_of_death'],
      death_year: json['death_year'],
      doB: json['doB'],
      doBFormat: json['doBFormat'],
      education: json['education'],
      face_image_id: json['face_image_id'],
      fielding_position_id: json['fielding_position_id'],
      fullName: json['fullName'],
      height: json['height'],
      id: json['id'],
      imageHeight: json['imageHeight'],
      imageName: json['imageName'],
      imageWidth: json['imageWidth'],
      intro: json['intro'],
      is_woman: json['is_woman'],
      known_as: json['known_as'],
      nickName: json['nickName'],
      other: json['other'],
      place_of_death: json['place_of_death'],
      playerBatStyle: json['playerBatStyle'],
      playerBowlStyle: json['playerBowlStyle'],
      player_role: json['player_role'],
      playerrole_id: json['playerrole_id'],
      shortName: json['shortName'],
      team: json['team'],
      teamId: json['teamId'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['birthPlace'] = this.birthPlace;
    data['birth_year'] = this.birth_year;
    data['completeName'] = this.completeName;
    data['coverImageName'] = this.coverImageName;
    data['date_of_death'] = this.date_of_death;
    data['death_year'] = this.death_year;
    data['doB'] = this.doB;
    data['doBFormat'] = this.doBFormat;
    data['education'] = this.education;
    data['face_image_id'] = this.face_image_id;
    data['fielding_position_id'] = this.fielding_position_id;
    data['fullName'] = this.fullName;
    data['height'] = this.height;
    data['id'] = this.id;
    data['imageHeight'] = this.imageHeight;
    data['imageName'] = this.imageName;
    data['imageWidth'] = this.imageWidth;
    data['intro'] = this.intro;
    data['is_woman'] = this.is_woman;
    data['known_as'] = this.known_as;
    data['nickName'] = this.nickName;
    data['other'] = this.other;
    data['place_of_death'] = this.place_of_death;
    data['playerBatStyle'] = this.playerBatStyle;
    data['playerBowlStyle'] = this.playerBowlStyle;
    data['player_role'] = this.player_role;
    data['playerrole_id'] = this.playerrole_id;
    data['shortName'] = this.shortName;
    data['team'] = this.team;
    data['teamId'] = this.teamId;
    return data;
  }
}
