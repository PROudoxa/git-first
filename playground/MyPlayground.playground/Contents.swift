//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// обьявляем константы и переменные. разный формы записи
// var - переменная, let - константа

var myFirstVariable = 12
myFirstVariable = -234
let myFirstConstant = 27
// myFirstConstant = 33 // не сможет быть перезаписана, т.к. это константа

var greetings = "Hello!"     // определится как String
greetings = "Hello, who are you? "

//типы переменных
let languageName: String = "Swift"
var version: Double = 1.0
var version2: Float = 1.1
var version3 = 1.2         // double 64 разряда. float 32. по умолчанию угадывается double.
let introduced: Int = 2014
let isAwesome: Bool = true

//склеиваем строки. Новая строка неизменна. если нужно изменить, надо заменить let на var
let whoIs = greetings + " - " + languageName

let pigs = 3
let cows = 2
let pigsSummary = "I have \(pigs) pigs."
let animalsSummary = "I have \(pigs + cows) animals."
let hello = "Hello \(languageName)!"


//                       КОЛЛЕКЦИИ. массив, словарь, сет
//Первый вид это - массивы, которые представляет собой набор элементов данных,
//к которым можно получить доступ через индекс начинающийся с 0

//Массивы
//пустые массивы
let emptyArray = [String]()
let emptyArrayOnemore = []

var cardNames: [String] = ["A", "K", "Q"]

//вывести эдемент массива на экран
print(cardNames[0])

//добавить элемент(ы)
//cardNames += "J"
cardNames += ["10", "9", "8"]
cardNames[0] = "Ace"                  //заменить элемент
cardNames[1..<3] = ["King", "Queen"]  //заменить диапазон элементов

// Словарь
let emptyDictionary = [String: Int16]()   // пустые
let emptyDictionaryOneMore = [:]          // словари

var cardAlternative = ["Jack" : 11, "Queen" : 12, "King" : 13]  // предугадан как [String]

cardAlternative["Ace"] = 15    // добавить элемент
cardAlternative["Ace"] = 1     // изменить его

print(cardAlternative["Ace"])     // извлечь

var occup = [
"Mal": "Cap"
]
print(occup["Mal"])
//---------------------------------------------
//                 ЦИКЛЫ
// while, do-while, for, for-in

for var i = 1; i < 3; ++i {
print(cardNames[i])
}

for cardName in cardNames {   // FOR .. IN .. {  ___  }
    print(cardName)
}

for number in 1...10 {   // 1..<11  аналог
    print("\(number) удвоено это \(number*2)")
}

for (cardName, cardValue) in cardAlternative {  // распечатка словаря
    print("\(cardName) = \(cardValue)")
}

// if
var cardValue = 11
if cardValue == 11 {
    print("Jack")
} else if cardValue == 12 {
print("Queen")
} else {
    print("Не найдено")
}

// switch
switch cardValue {
    case 11:
        print("Jack")
    case 12:
        print("Queen")
    default:
        print("Не найдено")
}

/*// for image bottom ------------
 let imgURL: NSURL = NSURL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/cf/Flag_of_Canada.svg/135px-Flag_of_Canada.svg.png")!
 let imgData: NSData = NSData(contentsOfURL: imgURL)!
 myImage.image = UIImage(data: imgData)
 //------------------------------ */


