//
//  TabViewScreen.swift
//  tabview
//
//  Created by apprenant63 on 19/09/2023.
//

import SwiftUI

struct TabViewScreen: View {

    var body: some View {

        
        
            TabView{
                MapView(place: place1)
                    .tabItem {
                        Label("Carte" , systemImage: "map")
                    }

                FavoritesView(place: place1)
                                .tabItem {
                                    Label("Favoris", systemImage: "heart.fill")
                                }

                NotificationView(place: place1)
                    .tabItem{
                        Label("Notifications", systemImage: "bell")
                    }
                
                SettingsView()
                    .tabItem {
                        Label("Paramètres", systemImage: "gearshape.fill")
                    }
                AccountView()
                    .tabItem {
                        Label("Favoris", systemImage: "person.fill")
                    }


                
            }.padding(.horizontal, 10)
                .background(Color.white)
        

    }
}

struct TabViewScreen_Previews: PreviewProvider {
    static var previews: some View {
        TabViewScreen()
    }
}
