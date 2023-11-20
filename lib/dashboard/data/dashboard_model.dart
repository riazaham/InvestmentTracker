class SymbolList {
  SymbolList({required this.symbolDetails});

  factory SymbolList.fromJson(Map<String, dynamic> json) {
    print(json);
    List<dynamic> matchList = json['bestMatches'];
    List<SymbolDetail> symbolDetails = [];
    for (Map<String, dynamic> symbolSearchResult in matchList) {
      SymbolDetail symbolDetail = SymbolDetail.fromJson(symbolSearchResult);
      symbolDetails.add(symbolDetail);
    }
    return SymbolList(symbolDetails: symbolDetails);
  }

  final List<SymbolDetail> symbolDetails;
}

class SymbolDetail {
  SymbolDetail({
    required this.id,
    required this.name,
  });

  factory SymbolDetail.fromJson(Map<String, dynamic> json) {
    return SymbolDetail(
      id: json['1. symbol'],
      name: json['2. name'],
    );
  }

  final String id;
  final String name;
}

class SymbolChartData {
  SymbolChartData({
    required this.timestampList,
    required this.indicators,
  });

  factory SymbolChartData.fromJson(Map<String, dynamic> json) {
    return SymbolChartData(
      timestampList: List<int>.from(json['timestamp']),
      indicators: Indicators.fromJson(json['indicators']),
    );
  }

  final List<int> timestampList;
  final Indicators indicators;
}

class Indicators {
  Indicators({required this.quote});

  factory Indicators.fromJson(Map<String, dynamic> json) {
    return Indicators(
      quote: Quote.fromJson(json['quote'][0]),
    );
  }

  final Quote quote;
}

class Quote {
  Quote({
    required this.volume,
    required this.close,
    required this.high,
    required this.open,
    required this.low,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      volume: List<int>.from(json['volume']),
      close: List<double>.from(json['close']),
      high: List<double>.from(json['high']),
      open: List<double>.from(json['open']),
      low: List<double>.from(json['low']),
    );
  }

  final List<int> volume;
  final List<double> close;
  final List<double> high;
  final List<double> open;
  final List<double> low;
}
