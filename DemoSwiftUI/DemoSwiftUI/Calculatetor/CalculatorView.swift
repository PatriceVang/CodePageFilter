//
//  CanculatorView.swift
//  DemoSwiftUI
//
//  Created by Apple on 11/8/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI

class CalculatorObject: ObservableObject {
    
    @Published var result: String = ""
    
    var resultTemp = ""
    var isUseToantu = false
    var temp1 = 0
    var temp2 = 0
    
    func receivedResult(button: CalculatorButton) {
        
        if (Int(button.title) != nil) || button == .decimal {
            resultTemp += button.title
            result = resultTemp

        }
       
    }
    

    
    
    
}


enum CalculatorButton: String {
    case zero, one, two, three, four, five, six, seven, eight, night, ten
    case equal, minus, add, multiply, divide
    case ac, percent, plusMinus, decimal
    
    var backgroudColor: Color {
        switch self {
        case .ac, .plusMinus, .percent:
            return Color(.lightGray)
        case .equal, .minus, .add, .multiply, .divide:
            return Color(.orange)
        default:
            return Color(.darkGray)
        }
    }
    
    var title: String {
        switch self {
        case .zero:     return "0"
        case .one:      return "1"
        case .two:      return "2"
        case .three:    return "3"
        case .four:     return"4"
        case .five:     return "5"
        case .six:      return "6"
        case .seven:    return "7"
        case .eight:    return "8"
        case .night:    return "9"
        case .ten:      return "10"
        case .equal:    return "="
        case .minus:    return "-"
        case .add:      return "+"
        case .multiply: return "x"
        case .divide:   return "/"
        case .ac:       return "AC"
        case .percent:  return "%"
        case .plusMinus: return "+/-"
        case .decimal:  return "."
        }
    }
}

struct CalculatorView: View {
    
    @ObservedObject var calcularor = CalculatorObject()
    
    private let buttons: [[CalculatorButton]] = [
        [.ac, .plusMinus, .percent, .divide],
        [.seven, .eight, .night, .multiply],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .add],
        [.zero, .decimal, .equal]
    ]
    
    var body: some View {
        ZStack (alignment: .bottom) {
            Color.black.edgesIgnoringSafeArea(.all)
            
            VStack (spacing: 12) {
                HStack {
                    Spacer()
                    Text(calcularor.result)
                        .font(.system(size: 64))
                        .foregroundColor(.white)
                }.padding(12)
                
                //-- Button
                ForEach(buttons, id: \.self) { row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { button in
                            ButtonView(button: button, object: self.calcularor)
                        }
                    }
                }
            }
        }
        
    }
    
    
}

struct ButtonView: View {
    var button: CalculatorButton
    var object: CalculatorObject
    
    var body: some View {
        Button(action: {
            self.object.receivedResult(button: self.button)
            
        }) {
            Text(button.title)
            .font(.system(size: 46))
            .frame(width: self.buttonWidth(button: button), height: (UIScreen.main.bounds.width - 12 * 5) / 4)
            .background(button.backgroudColor)
            .cornerRadius(self.buttonWidth(button: button) / 2)
            .foregroundColor(Color.white)
        }
    }
    
    func buttonWidth(button: CalculatorButton) -> CGFloat {
        if button == .zero {
            return (UIScreen.main.bounds.width - 12 * 4) / 2
        }
        return (UIScreen.main.bounds.width - 12 * 5) / 4
    }
}

struct CanculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
