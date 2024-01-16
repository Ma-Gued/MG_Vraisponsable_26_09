//
//  LaunchView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 28/09/2023.
//

import SwiftUI

struct LaunchView: View {
    var body: some View {
        VStack{
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(width: 300)

            Text("Vraisponsable!")
                .foregroundColor(.accentColor)
                .font(Font.custom("AmericanTypewriter-Semibold", size: 30))
        }
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView()
    }
}
