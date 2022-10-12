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
                Image("ダダダダ天使")
                    .transition(.opacity)
            }
            let url = URL(string: "https://www.youtube.com/82ce5d0f-d513-4a6b-b22d-d01137466ae8")!
            VideoPlayer(player: AVPlayer(url: url))
        }
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
