//
//  result.swift
//  pages
//
//  Created by User03 on 2022/11/15.
//

import SwiftUI

struct result: View {
    @Binding var name :String
    @Binding var dragonHP : Int
    @Binding var magicHP : Int
    @Binding var YourMaxDamage : Int
    @Binding var YourMinDamage : Int
    @Binding var EmenyMaxDamage : Int
    @Binding var EmenyMinDamage : Int
    @Binding var times : Int
    var body: some View {
        VStack{
            if(dragonHP<=0&&magicHP<=0){
                Text("\(name)和敵人同歸於盡")
            }
            else if(dragonHP<=0){
                Text("\(name)贏了")
            }
            else if(magicHP<=0){
                Text("\(name)輸了")
            }
            DisclosureGroup("更多戰鬥細節") {
                Text("造成最大傷害： \(YourMaxDamage)")
                Text("造成最小傷害： \(YourMinDamage)")
                Text("受到最大傷害： \(EmenyMaxDamage)")
                Text("受到最小傷害： \(EmenyMinDamage)")
                Text("交戰次數：\(times)")
            }.padding()
        }.font(.custom("ChenYuluoyan-Thin",size:45))
    }
}
