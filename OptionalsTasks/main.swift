//
//  main.swift
//  OptionalsTasks
//
//  Created by Dmitriy Eliseev on 24.02.2025.
//

import Foundation


//------------------------------------------------------------------------------------(Задача 1)
//-----------------------------------------------------------------(for case let item? in array)


//1. Посчитать сумму позитивных чисел в массиве
//
//[1,-4,7,12] -> 1 + 7 + 12 = 20

/*
func sumOfPositives(_ array: [Int?]) -> Int {
    var result = Int()
    for case let item? in array {
        if item >= 0 {
            result += item
        }
    }
    return result
}

let firstArr = [1, -4, 7, nil, 12]
let result = sumOfPositives(firstArr)
print(result)
*/



//------------------------------------------------------------------------------------(Задача 2)



//2. Написать функцию суммирования строк
//
//"13",  "37" -> "50"

func sumElements(lhs: String, rhs: String) -> String {
    guard let first = Int(lhs),
          let second = Int(rhs)
    else { return "" }
    return String(first + second)
}

let firstString = "13"
let secondString = "37"
print(sumElements(lhs: firstString, rhs: secondString))

//------------------------------------------------------------------------------------(Задача 3)


//3. Удалить первый и последний элемент строки,
//можно использовать dropFirst()/dropLast()
//"place" -> "lac"

/*
func removeFirstLast(_ string: String?) -> String {
    guard var str = string else { return "" }
    str = String(str.dropFirst())
    return String(str.dropLast())
}

let world = "place"
let result = removeFirstLast(world)
print(result)
*/


//------------------------------------------------------------------------------------(Задача 4)


//4. Написать фукнцию суммирования всех элементов массива
//
//["1", 2, 3.5] -> 6.5

/*
func sumOfValues(array: [Any]) -> Double {
    var result = Double()
    array.forEach { item in
        switch item {
        case let item as String: result += Double(item) ?? 0 //вопрос Double(item) ?? 0
        case let item as Int: result += Double(item)
        case let item as Double: result += item
        default: break
        }
        
    }
    return result
}
    



let anyArr: [Any] = ["1", 2, 3.5]
let result = sumOfValues(array: anyArr)
print(result)
*/


//----------------------------------------------------------ТЕОРИЯ---------------------------------

/*
//1. force unwrap
//двойной вложенный опционал
let startText: String?? = "Hello"
print(startText!!, type(of: startText!!))

let textExample: String? = "Test string"
 
//через явную проверку на nil
if textExample != nil {
    let str = textExample!
    print(str)
}



//2. nil coalescing (?? "")
let optString = textExample ?? ""
print("Nil coalescing - \(optString) - type: \(type(of: optString))")



//3. optional binding
if let text = textExample {
    print("Optional binding - \(text)")
}




//4. guard let



//5. Optional chaining
struct City {
    var adress: Adress? = Adress()
}

struct Adress {
    var people: People? = People()
}

struct People {
    var Name = "Ivan"
}
var city = City()
var namePeple = city.adress?.people?.Name



//6. switch-case
switch textExample {
case let text?: print("Switch-case - \(text)")
case .none: print("")
}



//7. if case let
if case let text? = textExample {
    print("if case let - \(text)")
}



//8. for case let
let name: [String?] = ["Иван", "Даниил", nil, "Наташа"]
for case let item? in name {
    print("For case let - \(item)")
}



//9. type casting (as?)
var varible: Any = 5

if let num = varible as? Int {
    print(num)
}

switch varible {
case let num as Int: print("type casting (as) - \(num)")
default: print("casting Bad")
}


//----------------------------------------------------------------------опциональный init? делает структуру "?"
//10. Failable initializer (init?)
struct User {
    var id: Int
    
    init?(id: Int) {
        guard id > 0 else {
            return nil
        }
        self.id = id
    }
}

let user = User.init(id: -1)
print("----------------------")
print(user, type(of: user))
print(user?.id)
print("----------------------")


//11. Error Handling (try?)
//-------------------------------------------------------------(вопросы по методу)
enum PasswordError: Error {
    case unsafe //obvious
}

func checkPassword(_ password: String) throws -> Bool {
    if password == "password" || password == "admin" {
        throw PasswordError.unsafe
    }
    return true
}

do {
    var result = try? checkPassword("admin") // можно поиграть try? и try!
    print("При try? сработает \(result) все равно") //из-за try? - сработает принт все равно!!!
} catch {
    print("При try НЕ сработает print в блоке do{_}!")
    print(error)
}



//-------------------------------------------------------------(вопросы по методу)
//12. Map



let optionalString: String? = "Hello world"
let str = optionalString.map{ str in
    return str
}

print("Map - \(str)")
*/


//------------------------------------------------------------------------------------(Задача 5)


//5. Написать фукнцию суммирования всех элементов массива
//
//["1", 2, 3.5] -> 6.5

/*
func sumOfValues(array: [Any?]?) -> Double {
    guard let array = array else { return 0}
    var result = Double()
    array.forEach { item in
        switch item {
        case let item as String: result += Double(item) ?? 0 //вопрос Double(item) ?? 0
        case let item as Int: result += Double(item)
        case let item as Double: result += item
        default: break
        }
        
    }
    return result
}
    



let anyArr: [Any] = ["1", 2, 3.5]
let result = sumOfValues(array: anyArr)
print(result)
*/



//------------------------------------------------------------------------------------(Задача 6)



//6. Один массив прибавить ко второму массиву - все способы
//
//[1, 2, 3] + [4, 5] -> [1, 2, 3, 4, 5]

func sumArrays(lhs: [Int?]?, rhs: [Int?]?) -> [Int] {
    var resultArr = lhs
    resultArr?.append(contentsOf: rhs ?? [])
    let result = resultArr?.compactMap{$0} ?? []
    return result
}

let arrOne = [1, 2, 3]
let arrTwo = [4, 5]
let result = sumArrays(lhs: arrOne, rhs: arrTwo)
print(result)


//------------------------------------------------------------------------------------(Задача 7)
//----------------------------------------------------------------------(застрял на этой задаче)


//7. Вытащить число из строки
//
//"123" -> 123
//"a1b2c3" -> 123
//"aa1bb2cc3dd" -> 123


/*
func filter(string: String) -> Int {
    let intArr = string.compactMap{Int(String($0))}
    let a = intArr.map(String.init).joined()
    return  Int(a) ?? 0
}

print(filter(string: "a1b2c3"))
*/



//------------------------------------------------------------------------------------(Задача 8)



//8. Сконвертировать массив строк в массив чисел
//
//["1", "2", "3"] -> [1, 2, 3]

/*
func toNumberArray(array: [String]) -> [Int] {
    let result = array.compactMap{Int($0)}
    return result
}


let arrString = ["1", "2", "3"]
print(toNumberArray(array: arrString))
*/



//------------------------------------------------------------------------------------(Задача 9)



//9. Развернуть вложенный опционал
/*
func unwrap(value: Int???) -> Int {
    guard let one = value,
          let two = one,
          let three = two
    else { return 0 }
    return three
}

print(unwrap(value: 777))
*/



//------------------------------------------------------------------------------------(Задача 10)



//10. Написать выведет компилятор?
/*
var value: Int??? = 10
print(value)
//Optional(Optional(Optional(10)))
*/



//------------------------------------------------------------------------------------(Задача 11)



//11. Что выведется на консоль?
/*
print("nil == .none", nil == .none) //что будет выведено в консоль?
//"nil == .none", true
*/



//------------------------------------------------------------------------------------(Задача 12)
//----------------------------------------------------------------------------------(тут затупил)


//12. Что выведет консоль?
/*
print(.some(10) == 10)

//автоматически разворачивает опционал
if let unwrapped = Optional.some(10) {
    print(unwrapped == 10) // true
}
*/



//------------------------------------------------------------------------------------(Задача 13)



/*
var some1: Int? = 10 //Optional(10)

var some2: Optional<Int> = Optional.some(10) //Optional(10)

print(some1 == some2)
//true
*/



//------------------------------------------------------------------------------------(Задача 14)


class Foo {
    func bar() { print("bar") }
}
/*
let foo: Foo? = nil
print(foo?.bar()) //nil
*/

/*
let foo: Foo? = nil
print(foo!.bar()) //crash
*/

/*
let foo: Foo? = nil
print(foo.bar()) //crush компиляции
*/



//------------------------------------------------------------------------------------(Задача 15)
//----------------------------------------------------------------------------------(тут затупил)
/*
print(Optional<Int>(1) == 1)
//true
*/
//Swift позволяет сравнивать Optional<T> с T, используя встроенный оператор ==, который автоматически разворачивает Optional и сравнивает его содержимое с обычным значением.



//------------------------------------------------------------------------------------(Задача 16)

func foo() -> Bool {
        return false && 1 == Optional(1)
}

print(foo())
//false



//------------------------------------------------------------------------------------(Задача 17)
//1. решить с помощью функций высшего пордяка map/flatMap/compactMap
//2. решить обычными циклами for/while

//[[1, 2], [3, nil], nil, [4, 5]] -> [1, 2, 3, 4, 5]

/*
func ingnoreNills(array: [[Int?]?]) -> [Int] {
    return array.compactMap{$0}.flatMap{$0}.compactMap{$0}
}

let arrayOne = [[1, 2], [3, nil], nil, [4, 5]]
print(ingnoreNills(array: arrayOne))
*/

/*
func ingnoreNills(array: [[Int?]?]) -> [Int] {
    var result: [Int] = []
    array.forEach { item in
        guard let item = item else { return }
        for arr in item {
            guard let arr = arr else { return }
            result.append(arr)
        }
    }
    return result
}

let arrayOne = [[1, 2], [3, nil], nil, [4, 5]]
print(ingnoreNills(array: arrayOne))
*/
