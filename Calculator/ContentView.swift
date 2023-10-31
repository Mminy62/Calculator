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
}


struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    
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
        [.zero, .zero, .comma, .equal],
        

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
                
                
                LazyVGrid(columns: gridForm, spacing: 10) {
                    
                    ForEach(buttonData, id: \.self){ line in
                        
                        ForEach(line, id:\.self){ item in
                            
                            Button(action:{},
                                   label: {
                                
                                Text(item.buttonDisplayName)
                                
                            })
                            .frame(width: 80, height: 80)
                            .foregroundColor(item.foregroundColor)
                            .background(item.buttonColor)
                            .cornerRadius(40)
                            .font(.system(size: 34))
                        }
                        
                    }
                    
                }
                .padding(.horizontal)
            }
            
        }
    }
    
    struct NumberButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(Color("NumberButton"))
                .cornerRadius(40)
                .font(.system(size: 34))
        }
    }
    
    struct OperatorButtonStyle: ButtonStyle {
        func makeBody(configuration: Self.Configuration) -> some View {
            configuration.label
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .background(Color.orange)
                .cornerRadius(40)
                .font(.system(size: 34))
        }
    }
    
}
        
        

#Preview {
    ContentView()
}

