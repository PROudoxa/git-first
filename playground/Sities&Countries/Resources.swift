//
//  Resources.swift
//  Sities&Countries
//
//  Created by Алексей on 23.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

protocol Resources{
    
    var url: String {get}
    var urlWebView: String {get}
    var countriesArrayWithPicture: [(name: String, image: String)] {get}
    var countriesWikiURL: [String: String] {get}
    var emblemWikiURL: [String: String] {get}
    func changeURL(country: String) -> String
    func changeURLEmblem(country: String) -> String
}

//   ------------------------------------------ AMERICA  --------------------------

class ResourcesAmerica: Resources {
    
    var url: String = "https://ru.wikipedia.org"  // Default link for screen "moreInformation"
    var urlWebView: String = "http://apple.com"   // Link for webView on the main screen
    
    // Dictionary of links of countries
    let countriesWikiURL: [String: String] = [
        "Canada":           "https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0",
        "USA":              "https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%91%D0%BD%D0%BD%D1%8B%D0%B5_%D0%A8%D1%82%D0%B0%D1%82%D1%8B_%D0%90%D0%BC%D0%B5%D1%80%D0%B8%D0%BA%D0%B8"
    ]
    
    // Array for countries and their pictures
    let countriesArrayWithPicture: [(name: String, image: String)] = [
        (name: "USA",            image: "us"),
        (name: "Canada",         image: "ca")
    ]
    
    // Dictionary of links of emblems
    let emblemWikiURL: [String: String] = [
        "Canada":           "https://upload.wikimedia.org/wikipedia/ru/thumb/4/4f/Coat_of_arms_of_Canada.svg/100px-Coat_of_arms_of_Canada.svg.png",
        "USA":              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Great_Seal_of_the_United_States_%28obverse%29.svg/100px-Great_Seal_of_the_United_States_%28obverse%29.svg.png"
    ]
    
    func changeURL(country: String) -> String {
        switch country {
            case "USA":            url = countriesWikiURL[country]!
            case "Canada":         url = countriesWikiURL[country]!
            default:               break
        }
        return  url
    }
    
    func changeURLEmblem(country: String) -> String {
        switch country {
            case "USA":            url = emblemWikiURL[country]!
            case "Canada":         url = emblemWikiURL[country]!
            default:               break
        }
        return  url
    }
    
}
    // --------------------------------------------------------- EUROPE--------------------------
class ResourcesEurope: Resources {

    var url: String = "https://ru.wikipedia.org"  // Default link for screen "moreInformation"
    var urlWebView: String = "http://apple.com"   // Link for webView on the main screen
    
    // Array for countries and their pictures
    let countriesArrayWithPicture = [
        (name: "Germany",        image: "de"),
        (name: "Ukraine",        image: "ua"),
        (name: "United Kingdom", image: "gb")
    ]
    
    // Dictionary of links of countries
    let countriesWikiURL: [String: String] = [
        "Germany":          "https://ru.wikipedia.org/wiki/%D0%93%D0%B5%D1%80%D0%BC%D0%B0%D0%BD%D0%B8%D1%8F",
        "Ukraine":          "https://ru.wikipedia.org/wiki/%D0%A3%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B0",
        "United Kingdom":   "https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BB%D0%B8%D0%BA%D0%BE%D0%B1%D1%80%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F",
    ]
    
    // Dictionary of links of emblems
    let emblemWikiURL: [String: String] = [
        "Germany":          "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/Coat_of_arms_of_Germany.svg/100px-Coat_of_arms_of_Germany.svg.png",
        "Ukraine":          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Lesser_Coat_of_Arms_of_Ukraine.svg/100px-Lesser_Coat_of_Arms_of_Ukraine.svg.png",
        "United Kingdom":   "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Royal_Coat_of_Arms_of_the_United_Kingdom.svg/100px-Royal_Coat_of_Arms_of_the_United_Kingdom.svg.png",
    ]
    
    func changeURL(country: String) -> String {
        switch country {
            case "Germany":        url = countriesWikiURL[country]!
            case "Ukraine":        url = countriesWikiURL[country]!
            case "United Kingdom": url = countriesWikiURL[country]!
            default:               break
        }
        return  url
    }
    
    func changeURLEmblem(country: String) -> String {
        switch country {
            case "Germany":         url = emblemWikiURL[country]!
            case "Ukraine":         url = emblemWikiURL[country]!
            case "United Kingdom":  url = emblemWikiURL[country]!
            default:                break
        }
        return  url
    }
    
}
