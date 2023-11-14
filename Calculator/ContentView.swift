//
//  ContentView.swift
//  Calculator
//
//  Created by 이민영 on 2023/10/30.
//
// extension은 보통 파일 뒤에 플러스 붙임
import SwiftUI

struct ContentView: View {
    
    @State private var totalNumber: String = "0"
    @State private var queue: String = ""
    @State private var newNumber: Bool = false
    
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
                            
                            Button(action: {
                                (queue, newNumber, totalNumber) = Calculation().calc(item, queue, newNumber, totalNumber)
                            },
                                   label: {
                                
                                Text(item.buttonDisplayName)
                                
                            })
                            
                            .frame(width: item == .zero ? 173 : 80, height: 80)
                            .foregroundColor(item.foregroundColor)
                            .background(item.buttonColor)
                            .cornerRadius(40)
                            .padding(2)
                            .font(.system(size: 34))
                        }
                    }
                    
                }
                    
                .padding(.horizontal)
            }
            
        }
    }
    
}


        

#Preview {
    ContentView()
}

