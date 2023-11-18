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
    func calc(_ item: ContentView.ButtonType, _ queue: String, _ totalNumber: String) -> (String, String){
        
        var queue = queue
        var totalNumber = totalNumber
        
        var rightNumber: Bool = false
        var isNumber: Bool = true
        
        
        // 연산자/피연산자 인지  아닌지 파악
        switch item{
        case .multiple, .plus, .minus, .divide, .clear, .equal, .percent:
            isNumber = false
        default:
            isNumber = true
        }
        
        
        if isNumber{
            
            // 두번째 항인지 판단
            if "+-*/".contains(queue.last ?? "0")
            {
                rightNumber = true
            }
            else{
                rightNumber = false
            }
            
            // 계산 값이 없는 초기화 상태일때
            if totalNumber == "0" {
                totalNumber = item.buttonDisplayName
                queue = item.buttonOperatorValue
            }
            // 연산자 뒤의 숫자인 경우
            else if rightNumber{
                totalNumber = item.buttonDisplayName // 화면엔 보여지고
                queue += totalNumber // 계산은 큐에서
            }
            else{
                
                totalNumber += item.buttonDisplayName
                queue += item.buttonDisplayName
                
            }
            
            
        }
        else{
            
            // = 버튼 눌렀을때 결과 보여주기
            if item == .equal{
                print(queue)
                let mathExpression = NSExpression(format: queue)
                let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
                
                // mathValue, 결과 값이 Int형인지 확인
                if (mathValue ?? 0.0).truncatingRemainder(dividingBy: 1) == 0{
                    queue = String(Int(mathValue ?? 0.0))
                }
                else{
                    queue = String(mathValue ?? 0.0)
                }
                
                totalNumber = queue
                print(queue)
            }
            // 클리어로 다 지우기
            else if item == .clear{
                totalNumber = "0"
                queue = "0.0"
            }
            else if item == .percent{
                queue += item.buttonOperatorValue
                print(queue)
                let mathExpression = NSExpression(format: queue)
                let mathValue = mathExpression.expressionValue(with: nil, context: nil) as? Double
                queue = String(mathValue ?? 0.0)
                totalNumber = queue
                
            }
            
            
            else{ // 일반 연산자
                queue += item.buttonOperatorValue
                
            }

        }
        

        return (queue, totalNumber)
    }
    
}
        
