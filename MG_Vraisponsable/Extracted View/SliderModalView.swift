//
//  SliderModalView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 21/09/2023.
//

import SwiftUI

struct SliderModalView: View {
    var photos : [String]

    var body: some View {
        TabView{
            ForEach(photos, id: \.self) {photo in
                Image(photo)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width : 400, height : 130)
                    .clipped()
            }
        }.tabViewStyle(PageTabViewStyle())

    }
}
