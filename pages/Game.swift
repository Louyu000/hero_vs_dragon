//
//  Game.swift
//  pages
//
//  Created by User03 on 2022/11/15.
//

import SwiftUI

struct Game: View {
    @State private var show = false
    @State private var opacity = 1.0
    
    @Binding var random : Bool
    @Binding var luck : Int
    @Binding  var selectedIndex : Int
    @Binding var power : Float
    @Binding var MainColor : Color
    @Binding var name :String
    @Binding var  dragonHP : Int
    @State private var magicHP = 100
    @State private var info = "開始戰鬥"
    @State private var YourDamage = 0
    @State private var EmenyDamage = 0
    @State private var showalert = false
    @State private var pic = "physic"
    @State private var end = false
    @State private var showreturn = false
    
    @State private var YourMaxDamage = 0
    @State private var YourMinDamage = 999
    @State private var EmenyMaxDamage = 0
    @State private var EmenyMinDamage = 999
    @State private var times = 0
    
    func checkstate(YourDamage:Int,EnemyDamage:Int) -> Void{
        if YourDamage>YourMaxDamage {
            YourMaxDamage=YourDamage
        }
        if YourDamage<YourMinDamage {
            YourMinDamage=YourDamage
        }
        if EmenyDamage>EmenyMaxDamage {
            EmenyMaxDamage=EmenyDamage
        }
        if EmenyDamage<EmenyMinDamage {
            EmenyMinDamage=EmenyDamage
        }
        times+=1
    }

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack{
            MainColor.edgesIgnoringSafeArea(.all)
            VStack {
                Image("dragon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250.0, height: 250.0)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .shadow(radius: 10)
                Group{
                    Text("HP:\(dragonHP)")
                    HStack{
                        Image(pic)
                            .resizable()
                            .scaledToFit()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .padding()
                        Text(info).font(.headline)
                    }
                    Text("HP:\(magicHP)")
                }.lineLimit(4)
                .font(.custom("ChenYuluoyan-Thin",size:45))
                .frame(width: UIScreen.main.bounds.width, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                
                HStack{
                    Image("magic")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150.0, height: 150.0)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                    VStack{
                        if(!showreturn){
                            HStack{
                                Button {
                                    YourDamage = 0
                                    EmenyDamage = 20
                                    if (random){
                                        EmenyDamage += Int.random(in: -luck..<luck)
                                    }
                                    if(YourDamage<0){
                                        YourDamage=0
                                    }else{
                                        YourDamage=Int(Float(YourDamage)*(Float(selectedIndex)/8+1))
                                    }
                                    dragonHP-=YourDamage
                                    magicHP-=EmenyDamage
                                    checkstate(YourDamage: YourDamage, EnemyDamage: EmenyDamage)
                                    showalert=true
                                    info="你使用物理攻擊\n造成了 \(YourDamage) 點傷害\n敵人對你造成了 \(EmenyDamage) 點傷害"
                                    pic="physic"
                                    if (dragonHP<=0 || magicHP<=0){
                                        showreturn=true
                                        end=true
                                    }
                                } label: {
                                    Text("物理攻擊")
                                }.alert(isPresented: $showalert, content: {
                                    return Alert(title: Text("法杖敲人，不痛不癢"))
                                })
                                .frame(width: 100.0, height: 30.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .cornerRadius(9.0)
                                .padding(4.0)
                                Button {
                                    YourDamage = Int(power)
                                    EmenyDamage = 20
                                    if (random){
                                        YourDamage += Int.random(in: -luck..<luck)
                                        EmenyDamage += Int.random(in: -luck..<luck)
                                    }
                                    if(YourDamage<0){
                                        YourDamage=0
                                    }else{
                                        YourDamage=Int(Float(YourDamage)*(Float(selectedIndex)/8+1))
                                    }
                                    dragonHP-=YourDamage
                                    magicHP-=EmenyDamage
                                    checkstate(YourDamage: YourDamage, EnemyDamage: EmenyDamage)
                                    info="你使用火焰攻擊\n造成了 \(YourDamage) 點傷害\n敵人對你造成了 \(EmenyDamage) 點傷害"
                                    pic="fire"
                                    if (dragonHP<=0 || magicHP<=0){
                                        showreturn=true
                                        end=true
                                    }
                                } label: {
                                    Text("火焰攻擊")
                                }
                                .frame(width: 100.0, height: 30.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .cornerRadius(9.0)
                                .padding(4.0)
                                
                            }
                            HStack{
                                Button {
                                    YourDamage = Int(power)
                                    EmenyDamage = 20
                                    if (random){
                                        YourDamage += Int.random(in: -luck..<luck)
                                        EmenyDamage += Int.random(in: -luck..<luck)
                                    }
                                    if(YourDamage<0){
                                        YourDamage=0
                                    }else{
                                        YourDamage=Int(Float(YourDamage)*(Float(selectedIndex)/8+1))
                                    }
                                    dragonHP-=YourDamage
                                    magicHP-=EmenyDamage
                                    checkstate(YourDamage: YourDamage, EnemyDamage: EmenyDamage)
                                    info="你使用風刃攻擊\n造成了 \(YourDamage) 點傷害\n敵人對你造成了 \(EmenyDamage) 點傷害"
                                    pic="wind"
                                    if (dragonHP<=0 || magicHP<=0){
                                        showreturn=true
                                        end=true
                                    }
                                } label: {
                                    Text("風刃攻擊")
                                }
                                .frame(width: 100.0, height: 30.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .cornerRadius(9.0)
                                .padding(4.0)
                                
                                Button {
                                    YourDamage = Int(power)
                                    EmenyDamage = 20
                                    if (random){
                                        YourDamage += Int.random(in: -luck..<luck)
                                        EmenyDamage += Int.random(in: -luck..<luck)
                                    }
                                    if(YourDamage<0){
                                        YourDamage=0
                                    }else{
                                        YourDamage=Int(Float(YourDamage)*(Float(selectedIndex)/8+1))
                                    }
                                    dragonHP-=YourDamage
                                    magicHP-=EmenyDamage
                                    checkstate(YourDamage: YourDamage, EnemyDamage: EmenyDamage)
                                    info="你使用冰霜攻擊\n造成了 \(YourDamage) 點傷害\n敵人對你造成了 \(EmenyDamage) 點傷害"
                                    pic="froze"
                                    if (dragonHP<=0 || magicHP<=0){
                                        showreturn=true
                                        end=true
                                        
                                    }
                                } label: {
                                    Text("冰霜攻擊")
                                }
                                .frame(width: 100.0, height: 30.0)
                                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                                .cornerRadius(9.0)
                                .padding(4.0)
                            }
                            
                        }
                        else{
                            Button {
                                presentationMode.wrappedValue.dismiss()
                            } label: {
                                Text("回首頁")
                            }
                            .sheet(isPresented: $end, content: {
                                result(name:$name,dragonHP: $dragonHP, magicHP: $magicHP, YourMaxDamage: $YourMaxDamage, YourMinDamage: $YourMinDamage, EmenyMaxDamage: $EmenyMaxDamage, EmenyMinDamage: $EmenyMinDamage, times: $times)
                            })
                            .frame(width: 100.0, height: 30.0)
                            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                            .cornerRadius(9.0)
                            .padding(4.0)
                        }
                    }
                }
            }
        }
    }
}

