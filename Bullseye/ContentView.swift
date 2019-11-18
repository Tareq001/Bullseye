//
//  ContentView.swift
//  Bullseye
//
//  Created by Tareq Saifullah on 16/11/2019.
//  Copyright © 2019 Tareq Saifullah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible:Bool = false
    @State var sliderValue:Double = 50
    @State var target : Int = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                Text("Pull the bullseye as close as you an to: ")
                Text("\(self.target)")
            }
            Spacer()
            HStack{
                Text("1")
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            
            
            Spacer()
            
            Button(action: {
                self.alertIsVisible = true
            }){
                Text("Hit Me!")
            }
            .alert(isPresented: $alertIsVisible) { () -> Alert in
                return Alert(title: Text("Pop Up"), message: Text("You have got \(Int(self.sliderValue.rounded()))" + "You have scored \(self.pointsForCurrentRound()) points in this round"), dismissButton: .default(Text("awesome")))
            }
            
            
            Spacer()
            
            HStack{
                Text("Start Over")
                Spacer()
                Text("Score: ")
                Text("99999")
                Spacer()
                Text("Round")
                Text("999")
                Spacer()
                Text("Info")
            }
            Spacer()
            
            }
        }
    func pointsForCurrentRound()-> Int{
        
        let roundedValue:Int = Int(self.sliderValue.rounded())
        let awardedPoints  = 100 - abs(self.target - roundedValue)
        return awardedPoints
        
        
        
    }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 568, height: 320))
    }
}
