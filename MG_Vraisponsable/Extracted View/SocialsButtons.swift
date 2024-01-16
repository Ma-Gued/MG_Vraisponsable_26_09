//
//  SocialsButtons.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 20/09/2023.
//

import SwiftUI


struct SocialsButtons: View {
    @ObservedObject var place: Place = place1


    var body: some View {

        VStack{
            HStack{

                Button(action: {
                    if let facebookURL = place.liens.facebook {
                        UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
                    }
                }, label: {
                    Image("fb")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                }
                )//bouton facebook

                Button(action: {
                    if let instagramURL = place.liens.instagram {
                        UIApplication.shared.open(instagramURL, options: [:], completionHandler: nil)
                    }
                }, label: {
                    Image("insta")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 35)
                }
                )//bouton insta

                Button(action: {
                    if let siteURL = place.liens.site {
                        UIApplication.shared.open(siteURL, options: [:], completionHandler: nil)
                    }
                }, label: {
                    Image("site")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                }
                )//bouton site web
            }
            HStack{
                //bouton d'appel
                Button(action: {
                    if let phoneURL = URL(string: "tel://\(place.telephone)") {
                        UIApplication.shared.open(phoneURL, options: [:], completionHandler: nil)
                    } else {
                        // cas où il n'y a pas de numéro de téléphone disponible
                    }
                }, label: {
                    Image(systemName: "phone.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25)
                        .foregroundColor(.blue)
                        .padding(.leading, 5)

                }
                )//bouton d'appel


                Button(action: {
                    // Créez un lien profond vers la PlacesDetailsView
                    let deepLinkURL = URL(string: "vraisponsable://placedetails/\(place.id)")

                    // Vérifie si le lien profond peut être ouvert
                    if let deepLinkURL = deepLinkURL {
                        // Crée une instance de UIActivityViewController avec le lien profond
                        let activityViewController = UIActivityViewController(activityItems: [deepLinkURL], applicationActivities: nil)

                        // Affiche le UIActivityViewController
                        UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
                    } else {
                        // Gérer le cas où le lien profond n'a pas pu être créé
                    }
                }, label: {
                    Image(systemName: "square.and.arrow.up.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22)
                        .foregroundColor(.accentColor)
                        .cornerRadius(10)
                        .padding(.leading, 5)
                }
                )//bouton Partage
            }


//            Button(action: {    //bouton Itinéraire
//                // Vérifiez si l'application "Plans" est installée sur l'appareil
//                if let mapsURL = URL(string: "http://maps.apple.com/?daddr=\(place.latitude),\(place.longitude)") {
//                    UIApplication.shared.open(mapsURL, options: [:], completionHandler: nil)
//                } else {
//                    // Gérer le cas où l'application "Plans" n'est pas installée ou l'URL est incorrecte
//                }
//            }, label: {
//                Text("Itinéraire")
//                    .padding()
//                    .background(Color.blue)
//                    .foregroundColor(.white)
//                    .cornerRadius(10)
//            })


        }//hstack
    }
}

struct SocialsButtons_Previews: PreviewProvider {
    static var previews: some View {
        SocialsButtons()
    }
}
