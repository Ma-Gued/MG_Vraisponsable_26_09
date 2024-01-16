//
//  PlacesDetailsView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 19/09/2023.
//

import SwiftUI
import UIKit

struct PlacesDetailsView: View {
    var place : Place

    @State var newComment : String = ""


    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    VStack{
                        HStack{
                            Text("\(place.name)")
                                .foregroundColor(.accentColor)
                                .font(.system(size:30))
                                .padding(.top, 20)
                                .bold()

                           FavoriteButtonView(place : place)

                        } // hstack name + bouton favoris

                AverageRateView(place : place)
                            .padding(.bottom, 8)
                            .padding(.leading, 12)

                    }//note moyenne sur 5



                SocialsButtons()
                        .padding(.leading, 20)
                        .padding(.top, 15)
                }

                //Affichage de l'adresse
                    let codePostalSansVirgule = String(place.adresse.codePostal).replacingOccurrences(of: ",", with: "") //pour retirer la virgule du code postal
                    Text("\(place.adresse.numero), \(place.adresse.voie), \n \(codePostalSansVirgule) \(place.adresse.commune)")
                        .font(.system(size:16))
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 6)


                CriteresView(place: place1)

                ImageSliderView(photos : place.photos).frame(height : 200)

                CommentView(place: place1)

            } //vstack
        } //scrollview
        .navigationBarTitleDisplayMode(.inline)
    } //body
}


struct PlacesDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesDetailsView(place: place1)
        PlacesDetailsView(place: place2)
        PlacesDetailsView(place: place3)

    }
}
