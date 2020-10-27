//
//  ContentView.swift
//  DemoSwiftUI
//
//  Created by Apple on 10/25/20.
//  Copyright © 2020 vinova. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    let rTarget = Double.random(in: 0..<1)
    let gTarget = Double.random(in: 0..<1)
    let bTarget = Double.random(in: 0..<1)
    
    @State var rGuess: Double
    @State var gGuess: Double
    @State var bGuess: Double
    
    
    @State var name = "123"
    @State private var showAlert = false
    
    @ObservedObject var timer = TimerCounter()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    VStack {
                        ZStack(alignment: .center) {
                            Color(red: rTarget, green: gTarget, blue: bTarget)
                            Text(String(timer.counter)).modifier(CustomModifer(backgroudcolor: .white))
                        }
                        self.showAlert ? Text("Show alert = true") : Text("Match this color").fontWeight(.semibold)
                    }
                    VStack {
                        Color(red: rTarget, green: gTarget, blue: bTarget)
                        Text("R: \(Int(rGuess * 255)) G: \(Int(gGuess * 255)) B: \(Int(bGuess * 255))")
                    }.font(Font.subheadline.lowercaseSmallCaps().weight(.light))
                }
                Button(action: {
                    self.showAlert = true
                    self.timer.killTimer()
                }) {
                    Text("Hit me")
                }.alert(isPresented: $showAlert) { () -> Alert in
                    Alert(
                        title: Text("Your Score"),
                        message: Text(String(computeScore()))
                    )
                }.padding()
                VStack {
                    ColorSlider(value: $rGuess, textColor: .red)
                    ColorSlider(value: $gGuess, textColor: .green)
                    ColorSlider(value: $bGuess, textColor: .blue)
                }.padding(.horizontal)
            }.background(Color(.systemBackground))
        }
            // Present split view in lanscape
            .navigationViewStyle(StackNavigationViewStyle())
    }
    
    func onChangedName() {
        name = ""
    }
    
    func computeScore() -> Int {
        let rDiff = rGuess - rTarget
        let gDiff = gGuess - gTarget
        let bDiff = bGuess - bTarget
        let diff = sqrt((rDiff * rDiff + gDiff * gDiff
            + bDiff * bDiff) / 3.0)
        return lround((1.0 - diff) * 100.0)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(rGuess: 0.8, gGuess: 0.5, bGuess: 0.5)
    }
}

struct ColorSlider: View {
    
    @Binding var value: Double
    var textColor: Color
    
    var body: some View {
        HStack {
            Text("0").foregroundColor(.red)
            Slider(value: $value)
                .background(textColor)
                .cornerRadius(10)
            Text("255").foregroundColor(textColor)
        }
    }
}

struct CustomModifer: ViewModifier {
    
    @State var backgroudcolor = Color.blue
    
    func body(content: Content) -> some View {
        return content.padding(.all, 5)
        .background(backgroudcolor)
        .mask(Circle())
        .foregroundColor(.black)
    }
   
    

}


