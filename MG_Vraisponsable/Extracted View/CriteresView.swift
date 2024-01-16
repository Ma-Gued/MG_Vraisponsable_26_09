//
//  CriteresView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 26/09/2023.
//

import SwiftUI

struct CriteresView: View {

        var place : Place
        var checkmark : some View{ Image(systemName: "checkmark").foregroundColor(.green)}
        var multiply : some View {Image(systemName: "multiply").foregroundColor(.red)}


        var body: some View {
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 2), GridItem(.flexible(), spacing: 2)], spacing: 2) {

                ForEach(place.criteres) { critere in
                    HStack {
                        if critere.isChecked {
                            checkmark
                                .padding(.leading, 12)
                        } else {
                            multiply
                                .padding(.leading, 12)
                        }
                        Text(critere.name)
                            .font(.system(size:14))
                            .frame(maxWidth: .infinity, alignment: .leading)

                    }
                }// for each
            }//lazyvgrid Critères
        }
    }

struct CriteresView_Previews: PreviewProvider {
    static var previews: some View {
        CriteresView(place: place1)
    }
}
