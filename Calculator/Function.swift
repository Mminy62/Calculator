//
//  calculate.swift
//  Calculator
//
//  Created by 이민영 on 2023/11/14.
//

import Foundation
import SwiftUI


class Calculation{

    
    // 사칙연산 기능
    func calc(_ item: ContentView.ButtonType, _ queue: String, _ newNumber: Bool, _ totalNumber: String) -> (String, Bool, String){
        
        var queue = queue
        var newNumber = newNumber
        var totalNumber = totalNumber
        
        // 두번째 항인지 판단
        if "+-*/".contains(queue.last ?? "0")
        {
            newNumber = true
        }
        else{
            newNumber = false
        }
        
        
        if item == .equal{
            print(queue)
            let mathExpression = NSExpression(format: queue)
            let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Int
            queue = String(mathValue ?? 0)
            totalNumber = queue
            print(queue)
        }
        
        else if item == .clear{
            totalNumber = "0"
            queue = "0"
        }
        
        else if totalNumber == "0" {
            totalNumber = item.buttonDisplayName
            queue = totalNumber
        }
        else if newNumber{
            totalNumber = item.buttonDisplayName
            queue += totalNumber
        }
        
        else{ // 0-9, 연산자
            // 연산자는 입력값이 안보여야함
            //만약에 큐에 top이 연산자면 totalNumber는 숫자로 바뀐다. totalNumber == "0" 처럼
            switch item{
            case .divide, .minus, .plus:
                queue += item.buttonDisplayName
            case .multiple:
                queue += "*"
            default://1-9
                totalNumber += item.buttonDisplayName
                queue += item.buttonDisplayName
            }
        }

        return (queue, newNumber, totalNumber)
    }
    
}
        
