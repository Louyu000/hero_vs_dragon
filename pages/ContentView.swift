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
                NavigationLink(
                    destination: SongList(),
                    label: {
                        Text("開始使用")
                    })
                
                Text("Let's go")
                    .padding()
                    .navigationTitle("音樂介紹")
                Link(destination: URL(string: "https://lolesports.com/")!, label: {
                    /*@START_MENU_TOKEN@*/Text("Link")/*@END_MENU_TOKEN@*/
                })
                NavigationLink(
                    destination: dice(),
                    label: {
                        Text("DiceGame")
                    })
                NavigationLink(
                    destination: anim(),
                    label: {
                        Text("Anim")
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
