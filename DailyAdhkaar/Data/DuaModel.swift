//
//  DuaModel.swift
//  DailyAdhkaar
//
//  Created by AbuTalha on 23/12/2021.
//

struct Dua : Decodable {
    var id: Int
    var title: String?
    var group: [Group]
}

struct Group: Decodable {
    var dua: String
    var repeatcount: Int?
    var audiourl: String?
    var repeattext: String?
    var explain: String?
    var issaved: Bool?
}

/*
{
    "id": 10,
    "title": "",
    "group": [
      {
        "dua": "يَا حيُّ يَا قَيُّومُ بِرَحْمَتِكَ أَسْتَغِيثُ ، أَصْلِحْ لي شَأْنِي كُلَّهُ ، وَلَا تَكِلْنِي إِلىٰ نَفْسِي طَرْفَةَ عَيْنٍ",
        "repeatcount": "",
        "audioUrl": "",
        "repeattext": "",
        "issaved": false,
        "explain": ""
      }
    ]
  }
*/
