//
//  SettingsView.swift
//  Myapplication
//
//  Created by apprenant65 on 19/09/2023.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            
            Settings()
        }
    }
    
    struct SettingView_Previews: PreviewProvider {
        static var previews: some View {
            SettingsView()
        }
    }
    
    struct Settings :View {
        
        var body : some View {
            
            VStack(spacing: 15) {
                                
                VStack(spacing: 15) {
                    
                    NavigationLink(destination: AboutUsView()) {
                        btnView(name: "À propos de nous")
                    }
                    .foregroundColor(.black)
                    NavigationLink(destination: ProContactView()) {
                        btnView(name: "Vous êtes un professionnel ?\nContactez-nous !")
                    }
                    .foregroundColor(.black)

                    
                    btnView(name: "Langue")
                    
                }
                .padding(.top, 50)
                
                Spacer()
            }.navigationTitle("Paramètres")
        }
    }
}
    struct btnView : View {
        
        var image = ""
        var name = ""
        
        
        var body : some View {
            
            
            
            HStack {

                Text(name)
                
                    .frame(maxWidth: .infinity)
                
                Spacer(minLength: 15)
                
                Image(systemName: "chevron.right")
                    .padding(.trailing, 25)
                
            }.padding()

        }
    }



