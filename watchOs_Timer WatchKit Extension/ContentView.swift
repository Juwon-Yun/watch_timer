//
//  ContentView.swift
//  watchOs_Timer WatchKit Extension
//
//  Created by 윤주원 on 2022/08/25.
//

import SwiftUI

struct ContentView: View {
    @State var shownSecondScreen = false
    @State var timerValue = 1
    
    
    var body: some View {
        VStack{
            
        Text("Start Tuner for \(timerValue) seconds")

        Picker(selection: $timerValue, label: Text("")) {
            Text("1").tag(1)
            Text("5").tag(5)
            Text("10").tag(10)
            Text("15").tag(15)

        }
            NavigationLink(
                destination: SecondView(
                    shownSecondScreen: shownSecondScreen,
                    timerValue: timerValue),
                isActive: $shownSecondScreen,
                label: {
                    Text("Go")
                    
                }
            )
            
        }
    }
}

struct SecondView : View{
    @State var shownSecondScreen:Bool
    @State var timerValue = 1
    
    var body: some View{
        Text("second View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
