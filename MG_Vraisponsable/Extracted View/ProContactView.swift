//
//  ProContactView.swift
//  Myapplication
//
//  Created by apprenant65 on 21/09/2023.
//

import SwiftUI

struct ProContactView: View {
    @State private var showAlert = false
    @State private var isImageExpanded = false
    var body: some View {

        ScrollView {
            VStack (spacing: 20) {
                    Text("Vous souhaitez être référencé sur Vraisponsable?")
                        .multilineTextAlignment(.center)
                        .font(Font.custom("AmericanTypewriter-Semibold", size: 25))
                            .shadow(color: .accentColor, radius: 1)
                            .padding(.leading, 30)
                            .padding(.trailing, 30)
                
                
                Image("traiteur")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 400, height: 300)
                    .shadow(radius: 5)
                    .cornerRadius(20)
                    .opacity(0.8)
                    .padding(.horizontal, 20)


                
                // Description des avantages pour les professionnels
                Text("Devenez un professionnel sur notre plateforme et augmentez la visibilité de votre entreprise 🧐 Inscrivez votre établissement pour atteindre de nouveaux clients et développer votre activité 🚀")
                    .font(.body)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                // Formulaire d'inscription pour les professionnels
                ProRegistrationForm()
                    .padding()
            }
        }

        
    }
}

struct ProContactView_Previews: PreviewProvider {
    static var previews: some View {
        ProContactView()
    }
}

