//
//  FavoritesView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 21/09/2023.
//

import SwiftUI

struct FavoritesView : View {

    @State var favoritePlaces: [Place] = []
    @State var place : Place


    func getFavoris() {
        var pl: [Place] = []
        for place in places {
            if place.isFavorite == true{
                pl.append(place)
            }
        }
        favoritePlaces = pl
    }
var body: some View {
        NavigationView {
            List(favoritePlaces) { favoritePlace in
                NavigationLink(destination: PlacesDetailsView(place: favoritePlace)) {
                    VStack(spacing: 7){
                        HStack{

                            Image(systemName: iconType(for: favoritePlace))
                                .foregroundColor(circleColor(favoritePlace.type))


                            Text(favoritePlace.name)
                                .font(Font.custom("AmericanTypewriter-Semibold", size: 20))
                                .foregroundColor(circleColor(favoritePlace.type))
                                .tracking(-1.5)
                                .multilineTextAlignment(.center)

                            AverageRateView2(place: place)
                                .padding(.leading, 20)
                        }
                        HStack{
                            Image(favoritePlace.photos[0])
                                .resizable()
                                .frame(width: 70, height: 70)
                                .cornerRadius(50)


                            VStack{



                                //Affichage de l'adresse

                                Text("\(favoritePlace.adresse.numero), \(favoritePlace.adresse.voie), \n  \(favoritePlace.adresse.commune)")
                                    .font(.system(size:10))
                                    .multilineTextAlignment(.center)
                                    .padding(.bottom, 6)
                            } //vstack
                            SocialsButtons()
                                .padding(.leading, 10)

                        }//hstack




                    }//vstack
                }
            }//list

            .navigationTitle("Favoris")
            .onAppear{
                getFavoris()
            }//list
        }


    }//body
    private func iconType(for place: Place) -> String {
        switch place.type {
        case .restos:
            return "fork.knife"
        case .alim :
            return "carrot"
        case .ressou :
            return "arrow.3.trianglepath"
        case .bars :
            return "wineglass"
        case .magasins :
            return "cart"
        case .vetements :
            return "tshirt.fill"
        case .loisirs :
            return "figure.dance"
        default:
            return ""
        }

    }
    // .type == PlaceType(rawValue: restos)



    func circleColor(_ placeType: PlaceType) -> Color {
        switch placeType {
        case .alim:
            return .yellow
        case .restos:
            return .orange
        case .ressou:
            return .purple
        case.bars:
            return .green
        case.magasins:
            return .blue
        case.vetements:
            return .red
        case.loisirs:
            return .mint
        default:
            return .gray
       }
    } // fonction qui adapte la couleur du circle à celle du place.type

}//struct
struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(place: place1)
    }
}
//
