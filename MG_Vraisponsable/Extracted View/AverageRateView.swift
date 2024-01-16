//
//  AverageRateView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 21/09/2023.
//

import SwiftUI

struct AverageRateView: View {

    @ObservedObject var place: Place
    @State var userRating: Double = 0

    var body: some View {
        HStack{
            ForEach(1..<6, id: \.self) {index in
                Button(action: {
                }, label: {
                    Text(String(repeating: " ", count: 3))
                        .font(.system(size: 18))
                        .overlay(Image(systemName: index <= Int(place.userRating) ? "star.fill" : "star")
                            .resizable()
                            .frame(width : 20, height : 20)
                            .foregroundColor(.yellow)
                        )
                    }
                )
            }

            Text("\(String(format : "%.1f", place.userRating)) sur \(place.userRatings.count) avis")    }
    }
}
struct AverageRateView_Previews: PreviewProvider {
    static var previews: some View {
        AverageRateView(place : place1)
    }
}
