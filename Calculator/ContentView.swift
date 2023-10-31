//
//  ContentView.swift
//  Calculator
//
//  Created by 이민영 on 2023/10/30.
//

import SwiftUI

enum ButtonType: String{
    case zero, first, second, third, forth, fifth, sixth, seventh,
         eight, nineth
    
    case comma, equal, plus, minus, multiple, divide
    case percent, opposite, clear

    
    var buttonDisplayName: String{
        switch self{
        case .first:
            return "1"
        case .second:
            return "2"
        case .third:
            return "3"
        case .forth:
            return "4"
        case .fifth:
            return "5"
        case .sixth:
            return "6"
        case .seventh:
            return "7"
        case .eight:
            return "8"
        case .nineth:
            return "9"
        case .zero:
            return "0"
        case .clear:
            return "C"
        case .opposite:
            return "+/-"
        case .percent:
            return "%"
        case .divide:
            return "/"
        case .multiple:
            return "X"
        case .minus:
            return "-"
        case .plus:
            return "+"
        case .equal:
            return "="
        case .comma:
            return "."
        default:
            return ""
        }
    }
    
    var buttonColor: Color{
        switch self{
        case .first, .second, .third, .forth, .fifth, .sixth, .seventh, .eight, .nineth, .zero, .comma:
            return Color("NumberButton")
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.orange
        case .clear, .opposite, .percent:
            return Color.gray
        }
    }
    
    var foregroundColor: Color{
        switch self{
        case .clear, .opposite, .percent:
            return .black
        default:
            return .white
        }
    }
    
    var paddingValue: CGFloat{
        switch self{
        default:
            return 3
        }
    }
    
    
}


struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State private var queue: String = ""
    @State private var newNumber: Bool = false
    
    let buttons = [7, 8, 9, 4, 5, 6, 1, 2, 3].map{String($0)}
    let gridForm: [GridItem] = [GridItem(.flexible()),
                               GridItem(.flexible()),
                               GridItem(.flexible()),
                                GridItem(.flexible())
                ]
    
    private let buttonData: [[ButtonType]] = [
        [.clear, .opposite, .percent, .divide],
        [.seventh, .eight, .nineth, .multiple],
        [.forth, .fifth, .sixth, .minus],
        [.first, .second, .third, .plus],
        [.zero, .comma, .equal],
        

    ]
    
    
    var body: some View {
        
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Spacer()// 윗 공간 여백
                HStack{
                    Spacer() //숫자 오른쪽 정렬
                    Text(totalNumber)
                        .padding()
                        .font(.system(size: 73))
                        .foregroundColor(.white)
                    
                }
                
                    
                ForEach(buttonData, id: \.self){ line in
                    
                    HStack{
                        ForEach(line, id:\.self){ item in
                            
                            Button(action:{calc(item)},
                                   label: {
                            
                                Text(item.buttonDisplayName)
                                
                            })
                            .frame(width: item == .zero ? 170 : 80, height: 80)
                            .foregroundColor(item.foregroundColor)
                            .background(item.buttonColor)
                            .cornerRadius(40)
                            .padding(3)
                            .font(.system(size: 34))
                        }
                        
                    }
                    
                }
                    
                
                .padding(.horizontal)
            }
            
        }
    }
    
    // 사칙연산 기능
    func calc(_ item: ButtonType){
        
        // 두번째 항인지 판단
        if "+-*/".contains(queue.last ?? "0")
        {
            newNumber = true
        }
        else{
            newNumber = false
        }
        
        
        if item == .equal{
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
        
        else if totalNumber == "0" || newNumber{
            totalNumber = item.buttonDisplayName
            queue += item.buttonDisplayName
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
        
    }
    

//    
//    struct OperatorButtonStyle: ButtonStyle {
//        func makeBody(configuration: Self.Configuration) -> some View {
//            configuration.label
//                .frame(width: 80, height: 80)
//                .foregroundColor(.white)
//                .background(Color.orange)
//                .cornerRadius(40)
//                .font(.system(size: 34))
//        }
//    }
    
}
        
        

#Preview {
    ContentView()
}

