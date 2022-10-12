//
//  SongDetail.swift
//  pages
//
//  Created by User16 on 2022/10/5.
//

import SwiftUI

struct SongDetail: View {
    let song:Song
    var body: some View {
        ScrollView(/*@START_MENU_TOKEN@*/.vertical/*@END_MENU_TOKEN@*/, showsIndicators: false){
            VStack{
                Image(song.name)
                    .resizable()
                    .scaledToFit()
                Text("歌名："+song.name)
                Text("歌手："+song.singer)
                Text("歌詞："+song.lyrics)

                
            }
        }
    }
}

struct SongDetail_Previews: PreviewProvider {
    static var previews: some View {
        SongDetail(song:.DemoSong)
    }
}
