//
//  FakeComment.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 26/09/2023.
//

import SwiftUI

struct FakeComment: View {
    var body: some View {

        HStack{
            Image("user")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .cornerRadius(50)
                .padding(.leading, 25)
                .padding(.bottom, 3)

            Spacer()

            VStack(alignment: .leading){

                Text("Yaniss Letouriste")
                    .padding(.bottom, 3)

                HStack(spacing: 0){
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                .padding(.bottom, 3)

                    Text("Amazing woaw")
                    .frame(width: 180, height: 15, alignment: .leading)
                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                        .border(Color.gray, width: 0.2)
                        .cornerRadius(20)
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)

            } //vstack
            Spacer()

        }//hstack fake comment


    }
}

struct FakeComment_Previews: PreviewProvider {
    static var previews: some View {
        FakeComment()
    }
}
