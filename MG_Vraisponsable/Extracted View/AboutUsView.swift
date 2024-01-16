//
//  AboutUsView.swift
//  Myapplication
//
//  Created by apprenant65 on 20/09/2023.
//

import SwiftUI

struct AboutUsView: View {
    var body: some View {
        ScrollView {
            VStack {
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    .padding(.bottom, 30)
                Text("Hello, nous c’est l’équipe Vraisponsable 🥰\n")
                Text("Nous nous sommes lancés en 2023 en partant d’un constat : il n’était pas simple de trouver des endroits où consommer responsable autour de chez soi.")
                    .multilineTextAlignment(.center)

                Text("Aussi, les enseignes pratiquent de plus en plus le greenwashing, ce qui complique les recherches🤯 ")
                    .multilineTextAlignment(.center)

                Text("Avec Vraisponsable, plus besoin de vérifier toutes les étiquettes, ou de manger une fraise en hiver ! Nous référençons les acteurs locaux et leurs bonnes pratiques pour vous guider dans vos choix 👍🏻")
                    .multilineTextAlignment(.center)
                Spacer()
                
            }.padding()
            Spacer()
        }

        // Vous pouvez ajouter plus de sections d'informations ici

        
    }
}
    


struct AboutUsView_Previews: PreviewProvider {
    static var previews: some View {
        AboutUsView()
    }
}
