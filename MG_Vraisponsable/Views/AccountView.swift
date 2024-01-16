//
//  HoSoView.swift
//  projet
//
//  Created by apprenant42 on 21/09/2023.
//

import SwiftUI

struct AccountView: View {
    
    @State private var firstname = ""
    @State private var lastname = ""
    @State private var Password = ""
    @State private var utilis = ""

    
    var body: some View {
        NavigationStack {
            VStack{
                ZStack(alignment: .bottomTrailing){
                Image("user")
                    .resizable()
                    .frame(width: 150, height: 150)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .shadow(radius: 10)
                    .padding(.bottom, 20)
                    
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "pencil").resizable()
                            .scaledToFit()
                            .frame(height :18)
                    }
                    .padding(.bottom, 20)
                          
                }
                Spacer()
                Form {
                    Section(header: Text("NOM")) {
                        HStack{
                            TextField("LeTouriste",
                                      text: $lastname)
                            Image(systemName: "pencil").resizable()
                                .scaledToFit()
                                .frame(height :18)
                        }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Section(header: Text("Prénom")) {
                        HStack{
                        TextField("Yannis",
                                  text: $firstname)
                        Image(systemName: "pencil").resizable()
                            .scaledToFit()
                            .frame(height :18)
                    }
                    }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Section(header: Text("Nom d’utilisateur")){
                        HStack{
                                TextField(" El-Tourista",
                              text: $utilis)
                            Image(systemName: "pencil").resizable()
                        .scaledToFit()
                        .frame(height :18)
                }
                        }
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    Section(header: Text("Mot de passe ")) {
                        HStack{
                            TextField(" ************",
                                      text: $Password)
                            Image(systemName: "pencil").resizable()
                                .scaledToFit()
                                .frame(height :18)
                        }
                    }.listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    }
                NavigationLink {
                    Text("Detail View")
                } label: {
                    Text("Supprimer mon compte")
                        .font(.system(size: 14))

                    Image(systemName: "person.fill.xmark")
                      
                } .foregroundColor(.red)
            } .navigationTitle("Mon Profil")
                .padding()
            
        }
    }
}
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
