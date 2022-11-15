//
//  ContentView.swift
//  pages
//
//  Created by User16 on 2022/10/5.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack{
                Text("Let's go")
                    .padding()
                    .navigationTitle("遊戲介紹")
                Link(destination: URL(string: "https://shadowverse.com/cht/")!, label: {
                    /*@START_MENU_TOKEN@*/Text("Link")/*@END_MENU_TOKEN@*/
                })
                NavigationLink(
                    destination: dice(),
                    label: {
                        Text("DiceGame")
                    })
                NavigationLink(
                    destination: bind(),
                    label: {
                        Text("Bind")
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
