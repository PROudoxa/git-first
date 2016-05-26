//
//  Resources.swift
//  Sities&Countries
//
//  Created by Алексей on 23.05.16.
//  Copyright © 2016 Alex&V. All rights reserved.
//

import UIKit

class Resources: NSObject {

    var url: String = "https://ru.wikipedia.org"  // Default link for screen "moreInformation"
    var urlWebView: String = "http://apple.com"   // Link for webView on the main screen
    
    //Array for Europe countries
    let europeCountries: [String] = [
        "Ger",
        "Bel",
        "Fra"
    ]
    
    //Array for America countries
    let americaCountries: [String] = [
        "Urug",
        "Cuba",
        "Arge",
        "Para"
    ]
    
    // Array for countries and their pictures
    let countriesArray = [
        (name: "Ukraine",        image: "ua"),
        (name: "USA",            image: "us"),
        (name: "United Kingdom", image: "gb"),
        (name: "Canada",         image: "ca")
    ]
    
    // Dictionary of links of countries
    let countriesWikiURL: [String: String] = [
        "Ukraine":          "https://ru.wikipedia.org/wiki/%D0%A3%D0%BA%D1%80%D0%B0%D0%B8%D0%BD%D0%B0",
        "United Kingdom":   "https://ru.wikipedia.org/wiki/%D0%92%D0%B5%D0%BB%D0%B8%D0%BA%D0%BE%D0%B1%D1%80%D0%B8%D1%82%D0%B0%D0%BD%D0%B8%D1%8F",
        "Canada":           "https://ru.wikipedia.org/wiki/%D0%9A%D0%B0%D0%BD%D0%B0%D0%B4%D0%B0",
        "USA":              "https://ru.wikipedia.org/wiki/%D0%A1%D0%BE%D0%B5%D0%B4%D0%B8%D0%BD%D1%91%D0%BD%D0%BD%D1%8B%D0%B5_%D0%A8%D1%82%D0%B0%D1%82%D1%8B_%D0%90%D0%BC%D0%B5%D1%80%D0%B8%D0%BA%D0%B8"
    ]
    
    // Dictionary of links of emblems
    let emblemWikiURL: [String: String] = [
        "Ukraine":          "https://upload.wikimedia.org/wikipedia/commons/thumb/9/95/Lesser_Coat_of_Arms_of_Ukraine.svg/100px-Lesser_Coat_of_Arms_of_Ukraine.svg.png",
        "United Kingdom":   "https://upload.wikimedia.org/wikipedia/commons/thumb/9/98/Royal_Coat_of_Arms_of_the_United_Kingdom.svg/100px-Royal_Coat_of_Arms_of_the_United_Kingdom.svg.png",
        "Canada":           "https://upload.wikimedia.org/wikipedia/ru/thumb/4/4f/Coat_of_arms_of_Canada.svg/100px-Coat_of_arms_of_Canada.svg.png",
        "USA":              "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5c/Great_Seal_of_the_United_States_%28obverse%29.svg/100px-Great_Seal_of_the_United_States_%28obverse%29.svg.png"
    ]
    
    func changeURL(country: String) -> String {
        switch country {
            case "Ukraine":        url = countriesWikiURL[country]!
            case "USA":            url = countriesWikiURL[country]!
            case "United Kingdom": url = countriesWikiURL[country]!
            case "Canada":         url = countriesWikiURL[country]!
            default:               break
        }
        return  url
    }
    
    func changeURLEmblem(country: String) -> String {
        switch country {
        case "Ukraine":        url = emblemWikiURL[country]!
        case "USA":            url = emblemWikiURL[country]!
        case "United Kingdom": url = emblemWikiURL[country]!
        case "Canada":         url = emblemWikiURL[country]!
        default:               break
        }
        return  url
    }
    
}
