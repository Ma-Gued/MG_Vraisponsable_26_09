//
//  UserRateView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 19/09/2023.
//

import SwiftUI


struct UserRateView : View {

    @ObservedObject var place: Place
    @State var userRating: Double = 0
    @State var hasUserRated = false

    var body: some View {
        HStack{

            //NOTE UTILISATEUR ETOILES
            if !hasUserRated {

                ForEach(1..<6, id: \.self) { index in
                    Button(action: {
                        userRating = Double(index)
                        place.addUserRating(rating: userRating)
                        hasUserRated = true
                    }, label: {
                        Text(String(repeating: " ", count: 3)) // Count est utilisé pour créer une chaîne de caractères avec des espaces; overlay est utilisé pour superposer une Image (étoile) sur un Text (espace intercaractères). Cela nous permet de contrôler la position de l'image par rapport au texte.
                            .font(.system(size: 18))
                            .overlay(Image(systemName: index <= Int(place.userRating) ? "star.fill" : "star")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.yellow)
                            )
                        }
                    )
                }//foreach
            } else {
                ForEach(1..<6, id: \.self) {index in
                    Button(action: {
                    }, label: {
                        Text(String(repeating: " ", count: 3))
                            .font(.system(size: 18))
                            .overlay(Image(systemName: index <= Int(userRating) ? "star.fill" : "star")
                                .resizable()
                                .frame(width : 20, height : 20)
                                .foregroundColor(.yellow)
                            )
                        }
                    )
                }
            }
            Text("\(String(format : "%.1f", place.userRating))")

        }//if



            }//hstack
        }

struct UserRateView_Previews: PreviewProvider {
    static var previews: some View {
        UserRateView(place: place1)
    }
}
