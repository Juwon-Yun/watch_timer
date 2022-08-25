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
    @ScaledMetric var borderWidth: CGFloat = 20
    
    
    var body: some View {
        VStack{
            Spacer()
            Text("Start Timer for \(timerValue) seconds")
                .font(.system(size: 16))
            
            Picker(selection: $timerValue, label: Text("")) {
                Text("1").tag(1)
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                Text("20").tag(20)
                Text("25").tag(25)
                Text("30").tag(30)
                
            }
            .border(Color.black, width: borderWidth)
            
            
            NavigationLink(
                destination: SecondView(
                    shownSecondScreen: $shownSecondScreen,
                    timerValue: timerValue),
                isActive: $shownSecondScreen,
                label: {
                    Text("Go")
                        .font(.system(size: 14))
                }
            )
            
        }
    }
}

struct SecondView : View{
    @Binding var shownSecondScreen:Bool
    @State var timerValue:Int
    
    var body: some View{
        VStack{
            Spacer()
            if timerValue > 0 {
                
                Text("Time remaining")
                    .font(.system(size: 18))
                Text("\(timerValue)")
                    .font(.system(size: 40))
                    .onAppear(){
                        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true){ (timer) in
                            if self.timerValue > 0 {
                                self.timerValue -= 1
                            }
                        }
                    }
                Text("seconds")
                    .font(.system(size: 18))
                Spacer()
                Button(action: {
                    self.shownSecondScreen = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(.red)
                    
                }
                )
                
            } else {
                Spacer()
                Button(action: {
                    self.shownSecondScreen = false
                }, label: {
                    Text("Done")
                        .foregroundColor(.green)
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
