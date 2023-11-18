//
//  DataType.swift
//  Calculator
//
//  Created by 이민영 on 2023/11/14.
//

import Foundation
import SwiftUI

extension ContentView{
    
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
            }
        }
        
        var buttonOperatorValue: String{
            switch self{
            case .opposite:
                return "-"
            case .percent:
                return "* (0.01)"
            case .divide:
                return "/"
            case .multiple:
                return "*"
            case .first, .second, .third, .forth, .fifth, .sixth, .seventh, .eight, .nineth:
                return self.buttonDisplayName + ".0"
            default:
                return self.buttonDisplayName
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
                return 2
            }
        }
        
    }

    
}
