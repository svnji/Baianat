import Foundation

func firstTask() {
    var arr: [Int] = [2,4,5,7,1,3,9,6]
    print(arr.max()!)
    print(arr.sort() {$0 < $1})
    for num in arr {
        if num % 2 == 0 {
            print("\(num) is even")
        }else {
            print("\(num) is odd")
        }
    }
    let arr2: [Int] = [1,2,0,6]
    
    let set1:Set<Int> = Set(arr)
    let set2:Set<Int> = Set(arr2)
    
    print(set1.intersection(set2))
    
}
firstTask()

func secondTask() {
    var arr1 = [1,3,5,7,9]
    var arr2 = [2,4,6,8,10,11,12,13,14,15]
    
    let mergedArray = (arr1+arr2).sorted()
    print("merged array: \(mergedArray)")
    print("the middel num is: \(mergedArray[(mergedArray.count) / 2])")
    
    let primeNumbers = mergedArray.filter { num in
        if num <= 1 {
            return false
        }
        if num <= 3 {
            return true
        }
        if num % 2 == 0 || num % 3 == 0 {
            return false
        }
        var i = 5
        while i * i <= num {
            if num % i == 0 || num % (i + 2) == 0 {
                return false
            }
            i += 6
        }
        return true
    }

    print("prime numbers: \(primeNumbers)")
}
secondTask()
