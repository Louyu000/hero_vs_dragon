//
//  anim.swift
//  pages
//
//  Created by User16 on 2022/10/12.
//

import SwiftUI
import AVKit
struct anim: View {
    @State private var show = false
    
    var body: some View {
        VStack {
            if show {
                VStack{
                    Image("dragon")
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity)
                    Image("magic")
                        .resizable()
                        .scaledToFit()
                        .transition(.opacity)
                }
            }
        }.background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color.blue/*@END_MENU_TOKEN@*/)
        .onAppear {
            withAnimation(.easeInOut(duration: 2)){
                show = true
            }
            
        }
        
    }
}
struct anim_Previews: PreviewProvider {
    static var previews: some View {
        anim()
    }
}
