//
//  bind.swift
//  pages
//
//  Created by User03 on 2022/11/2.
//

import SwiftUI

struct bind: View {
    @State private var random = false
    @State private var start = false
    @State private var luck = 1
    @State private var selectedIndex = 0
    @State private var power : Float = 5
    @State private var MainColor = Color.red
    @State private var name = "無名英雄"
    @State private var BattleTime = Date()
    @State var dragonHP=100
    let difficulty = ["輕輕鬆鬆", "有點挑戰", "自找苦吃", "屢敗屢戰", "九死一生"]
    let diffimage = ["sun.min","sun.max","cloud","cloud.heavyrain","cloud.bolt.rain"]
    var body: some View {
        VStack {
            Image(systemName: diffimage[selectedIndex])
                .resizable()
                .frame(width: 75, height: 65)
            HStack{
                Text("勇者之名:")
                TextField("勇者之名", text: $name)
                    .multilineTextAlignment(.center)
                    .padding(3.0)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 2)
                    )
                
            }
            .padding(.horizontal)
            HStack{
                Text("難度")
                Picker(selection: $selectedIndex, label: Text("選擇難度")) {
                    Text(difficulty[0]).tag(0)
                    Text(difficulty[1]).tag(1)
                    Text(difficulty[2]).tag(2)
                    Text(difficulty[3]).tag(3)
                    Text(difficulty[4]).tag(4)
                }
                .pickerStyle(SegmentedPickerStyle())
            }.padding(.horizontal)
            DatePicker("戰鬥開始日期", selection: $BattleTime,displayedComponents: .date)
                .padding(.horizontal)
            ColorPicker("我的主題色", selection: $MainColor)
                .padding(.horizontal)
            HStack{
                Text("我的戰鬥力\(power,specifier: "%g")").frame(width: 90.0)
                Slider(value: $power, in: 5...100)
            }
            .padding(.horizontal)
            Toggle("運氣成份", isOn: $random)
                .padding()
            if(random){
                Stepper("運氣成份要有 \(luck) 才夠", value: $luck, in: 1...15)
                    .padding(.horizontal)
            }
            Button(action: {
                start=true
                let calendar = Calendar.current
                dragonHP = 100 + 50 * (selectedIndex*4)
                if (calendar.dateComponents([.day], from: Date(), to: BattleTime).day! > 10){
                    dragonHP*=2
                }
                else if (calendar.dateComponents([.day], from: Date(), to: BattleTime).day! < -10){
                    dragonHP/=2
                }
            },
            label: {
                Text("開始戰鬥")
            })
            .fullScreenCover(isPresented: $start, content: {
                Game(random: $random, luck: $luck,selectedIndex: $selectedIndex, power: $power, MainColor: $MainColor, name: $name,dragonHP: $dragonHP)
            })
        }
    }
}

struct bind_Previews: PreviewProvider {
    static var previews: some View {
        bind()
    }
}
