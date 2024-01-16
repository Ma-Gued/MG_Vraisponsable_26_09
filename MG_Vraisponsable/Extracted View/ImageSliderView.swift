//
//  ImageSliderView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 20/09/2023.
//

import SwiftUI

struct ImageSliderView: View {
    var photos : [String]

    var body: some View {

        TabView{
            ForEach(photos, id: \.self) {photo in
                Image(photo)
                    .resizable()
                    .scaledToFit()
            }
        }.tabViewStyle(PageTabViewStyle())
    }
}
