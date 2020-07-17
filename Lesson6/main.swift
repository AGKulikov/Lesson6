//
//  main.swift
//  Lesson6
//
//  Created by Feniks on 17.07.2020.
//  Copyright © 2020 Feniks. All rights reserved.
//

import Foundation

struct Queue <T>{
    var arrayCharacters = [T]()
    
    mutating func queueUp(_ character: T) {
        arrayCharacters.append(character)
    }
    
    mutating func queueOut() -> T {
        arrayCharacters.removeFirst()
    }
    
    
    subscript(element: Int) -> T? {
        if element > arrayCharacters.count-1 || element < 0 {
            return nil
        }
        else {return arrayCharacters[element]}
    }
    
    
    func filterFunc (predicate: (T) -> Bool) -> [T]{
        var arrayTemp = [T]()
        for element in arrayCharacters{
            if predicate(element){
                arrayTemp.append(element)
            }
        }
        return arrayTemp
    }
    
}

var letters = Queue(arrayCharacters: ["a", "b", "c"]) // массив с буквами
letters.queueUp("d") // добавляем в очередь
print(letters)

letters.queueOut() // убираем из очереди
print(letters)

print(letters[2]) // subscript
print(letters[7]) // subscript

var lettersFilter = letters.filterFunc(){(i: String) -> Bool in
    return i == "d"} // новый отфильтрованный массив
print(lettersFilter)



var numeric = Queue(arrayCharacters: [1,2,3,4,5,6,7,8,9]) // массив с числами
numeric.queueUp(15) // добавляем в очередь
print(numeric)

numeric.queueOut() // убираем из очереди
print(numeric)

print(numeric[0]) // subscript
print(numeric[10]) // subscript

var numericFilter = numeric.filterFunc (){(i: Int) -> Bool in
    return i % 2 == 0} // новый отфильтрованный массив чисел
print(numericFilter)
