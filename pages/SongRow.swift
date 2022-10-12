//
//  SongRow.swift
//  pages
//
//  Created by User16 on 2022/10/5.
//

import SwiftUI

struct SongRow: View {
    let song : Song
    var body: some View {
        HStack{
            Image(song.name)
                .resizable()
                .scaledToFill()
                .frame(width: 80.0, height: 80.0)
                .clipped()
            VStack(alignment: .leading){
                Text(song.name)
                Text(song.singer)
            }
            Spacer()
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(song:.DemoSong)
    }
}