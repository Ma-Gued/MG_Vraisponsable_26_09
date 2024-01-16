//
//  ModalView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 21/09/2023.
//

import SwiftUI
import UIKit

struct ModalView: View {

     var place : Place

    var checkmark : some View{ Image(systemName: "checkmark").foregroundColor(.green)}

    var multiply : some View {Image(systemName: "multiply").foregroundColor(.red)}


    @State private var isShowingDetails = false

    var body: some View {
        VStack{
            HStack{
                VStack{
                    Text("\(place.name)")

                    let codePostalSansVirgule = String(place.adresse.codePostal).replacingOccurrences(of: ",", with: "") //pour retirer la virgule du code postal
                    Text("\(place.adresse.numero), \(place.adresse.voie), \(codePostalSansVirgule) \(place.adresse.commune)")
                        .font(.system(size:10))

                    AverageRateView(place : place)                    .font(.system(size:10))
                } //1ère vstack
                VStack{
                    ForEach(place.criteres.prefix(4)) { critere in
                        HStack {
                            if critere.isChecked {
                                checkmark
                            } else {
                                multiply
                            }
                            Text(critere.name)
                                .font(.system(size:12))
                        }
                    }// for each

                }.padding() //2ème vstack

                VStack{
                    Button(action:{

                        isShowingDetails = true
                        //ici le lien à ajouter à la version envoyée à Rana

                    }, label : {
                        Image(systemName: "greaterthan")
                            .resizable()
                            .frame(width: 8, height: 20)
                            .foregroundColor(.gray)
                    }
                    )//bouton
                    .sheet(isPresented: $isShowingDetails) {
                        // Afficher la PlacesDetailsView lorsque isShowingDetails est vrai
                        PlacesDetailsView(place: place)


                    }
                }//3ème vstack
                .padding() // hstack

            }//hstack
            VStack{
                SliderModalView(photos : place.photos)

            } //4ème vstack (slider)
        }


            } //body
    } //struct


struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(place : place1)
    }
}
