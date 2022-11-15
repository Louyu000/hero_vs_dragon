//
//  dice.swift
//  pages
//
//  Created by User16 on 2022/10/12.
//

import SwiftUI

struct dice: View {
    
    @State private var die1number = 1
    @State private var die2number = 1
    @State private var sum = 7
    @State private var combo = 0
    @State private var maxcombo = 0
    @State private var rotateDegree:Double = 0
    @State var info="猜猜比７大還小"
    var body: some View {
        VStack {
            Text("最大成功次數\(maxcombo)")
            Text(info)
            HStack{
                Image(systemName: "die.face.\(die1number).fill")
                    .resizable()
                    .frame(width: 100, height: 100)
                Image(systemName: "die.face.\(die2number).fill")
                    .resizable()
                    .frame(width: 100, height: 100)
            }
            HStack{

                Button {
                    die1number = Int.random(in: 1..<7)
                    die2number = Int.random(in: 1..<7)
                    if (sum<die1number+die2number){
                        sum=die1number+die2number
                        combo+=1
                        info="猜猜比\(sum)大還小\n連續成功了\(combo)次"
                        if combo>maxcombo{
                            maxcombo=combo
                        }
                    }
                    else{
                        sum=7
                        combo=0
                        info="失敗了 從７再開始猜大小"
                    }
                    
                } label: {
                    Text("大?")
                }
                .frame(width: 100.0, height: 30.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                .cornerRadius(9.0)
                
                Button {
                    die1number = Int.random(in: 1..<7)
                    die2number = Int.random(in: 1..<7)
                    if (sum>die1number+die2number){
                        sum=die1number+die2number
                        combo+=1
                        info="猜猜比\(sum)大還小\n連續成功了\(combo)次"
                        if combo>maxcombo{
                            maxcombo=combo
                        }
                    }
                    else{
                        sum=7
                        combo=0
                        info="失敗了 從７再開始猜大小"
                    }
                } label: {
                    Text("小?")
                }
                .frame(width: 100.0, height: 30.0)
                .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.yellow/*@END_MENU_TOKEN@*/)
                .cornerRadius(9.0)
            }
        }
       
    }
    
}
struct dice_Previews: PreviewProvider {
    static var previews: some View {
        dice()
            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
    }
}
