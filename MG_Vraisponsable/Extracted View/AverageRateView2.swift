//
//  AverageRateView2.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 27/09/2023.
//

import SwiftUI

struct AverageRateView2: View {
    var place: Place
    @State var userRating: Double = 0

    var body: some View {

        HStack{
            ForEach(1..<6, id: \.self) {index in
                Button(action: {
                }, label: {
                    Text(String(repeating: " ", count: 3))
                        .font(.system(size: 12))
                        .overlay(Image(systemName: index <= Int(place.userRating) ? "star.fill" : "star")
                            .resizable()
                            .frame(width : 20, height : 20)
                            .foregroundColor(.yellow)
                        )
                    }
                )
            }
        }
    }
}

struct AverageRateView2_Previews: PreviewProvider {
    static var previews: some View {
        AverageRateView2(place: place1)
    }
}
