//
//  FormProView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 27/09/2023.
//

import SwiftUI

struct ProRegistrationForm: View {
    @State private var businessName = ""
    @State private var contactName = ""
    @State private var email = ""
    @State private var phoneNumber = ""
    @State private var message = ""
    @State private var numero = ""
    @State private var voie = ""
    @State private var codepostal = ""
    @State private var ville = ""



    var body: some View {
        VStack(alignment: .leading) {
            Text("Contactez-nous !")

                .multilineTextAlignment(.center)
                .font(Font.custom("AmericanTypewriter-Semibold", size: 25))
                .shadow(color: .accentColor, radius: 1)


            TextField("NOM Prénom", text: $contactName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)


            TextField("Nom de l'établissement", text: $businessName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)

            TextField("Adresse e-mail", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)

            TextField("Numéro de téléphone", text: $phoneNumber)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)

            HStack{
                TextField("N°", text: $numero)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                TextField("Voie", text: $voie)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                Spacer()
            }
            HStack{
                TextField("Code Postal", text: $codepostal)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                TextField("Ville", text: $ville)
                    .keyboardType(.emailAddress)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
            }

            TextField("Message", text: $message)
                .keyboardType(.phonePad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.bottom)
                .frame(height: 50)


            HStack{
                Spacer()
                Button(action: {
                    // Ajoutez ici le code pour traiter l'inscription du professionnel
                }, label: {
                    Text("Envoyer 🤝")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.accentColor)
                        .cornerRadius(20)
                        .frame(width: 150)
                        .bold()
                }) //boutton
            }

        }.padding()
    }
}
