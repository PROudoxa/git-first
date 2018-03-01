//
//  ErrorManager.swift
//  WeatherApp(API_Tutorial)
//
//  Created by Alex Voronov on 14.01.18.
//  Copyright © 2018 Alex Voronov. All rights reserved.
//

import Foundation

public let SWINetworkingErrorDomain = "ru.swiftbook.WeatherApp.NetworkingError"  // SWI - три буквы для пространства имен, чтобы исключить совпадение имен с другими библиотеками. Может быть какими угодно(из названия сайта приложения, например)
public let MissingHTTPResponseError100 = 100
public let UnexpectedResponseError200 = 200
