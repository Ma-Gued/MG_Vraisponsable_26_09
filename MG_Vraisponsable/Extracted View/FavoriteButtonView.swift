//
//  FavoriteButtonView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 26/09/2023.
//

import SwiftUI

struct FavoriteButtonView: View {
    @ObservedObject var place : Place
    //var placeToAdd : Place //Pierre



//   func isFavorite(place: Place)-> Bool {
//        for p in observedFavorite.favorites {
//            if place.id == p.id {
//                return true
//            }
//        }
//        return false
//        } //fonction pour vérifier si la place est ou non dans les favoris
    var body: some View {


        //BOUTON AJOUTER/SUPPRIMER DES FAVORIS ❤️
//  dans le fichier data, on crée une class observable dans laquelle on met une caractéristique published (car l'utilisareur peut modifier), c pas une state pour un écran mais une state pour tous les écrans
//  ensuite on initialise -> si class = favorite on initialise un let usersFavorite = favorite()
//  dans la view, on ajoute un @ObservedObject var observedFavorite = instance créée, en l'occurence usersFavorite
//  puis on crée le bouton et on appelle usersFavorite.propriete


        VStack {
            Button(action: {
                place.isFavorite.toggle()

            }, label: {
                Image(systemName: place.isFavorite ? "heart.fill" : "heart")
                    .foregroundColor(.red)
            })
        }




        //        //pierre
        //
        //                            Button(action : {
        //            observedFavorite.favorites.append(placeToAdd)
        //        }, label : {
        //            ZStack{
        //                RoundedRectangle(cornerRadius: 25)
        //                    .frame(width : 80, height : 80)
        //                    .foregroundColor(.gray)
        //                Image(systemName : "plus")
        //                    .font(.system(size : 60))
        //                    .foregroundColor(.black)
        //            }
        //        })
        //
        //
        //        Button(action : {
        //            if let index = observedFavorite.favorites.indices.first(where: { observedFavorite.favorites[$0].id == place.id }) {
        //                observedFavorite.favorites.remove(at: index)
        //                }
        //        }, label : {
        //            ZStack {
        //                Circle()
        //                    .frame(width : 25)
        //                    .foregroundColor(.white)
        //                Image(systemName: "minus.circle")
        //                    .font(.system(size : 25))
        //                    .bold()
        //            }
        //        })
        //
        //
                //pierre


    }
}

struct FavoriteButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteButtonView(place : place1)
    }
}
