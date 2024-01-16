//
//  CommentView.swift
//  MG_Vraisponsable
//
//  Created by apprenant43 on 26/09/2023.
//

import SwiftUI

struct CommentView: View {
    @State var newComment : String = ""
    @ObservedObject var place : Place


    var body: some View {
        VStack{
            Text("Les avis de la communauté 🫶")
                .padding(.bottom, 5)
                .font(.system(size: 20))
                .bold()

            HStack{
                Text("Laissez une note :")
                UserRateView(place : place1)
            }
            .padding(.bottom, 5)


            Section(header : Text("Laissez un commentaire 👇")){
                HStack{
                    Image("user")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80)
                        .cornerRadius(50)
                        .padding(.leading, 25)

                        Spacer()
                        TextEditor(text: $newComment)
                            .frame(width: 180, height: 30)
                            .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                            .padding(.trailing, 20)
                            .border(Color.gray, width: 0.5)
                            .cornerRadius(20)
                    Spacer()

                }

                Button(action:{
                    place.comments.append(Comment(text: newComment, user: "Ayoub"))
                    newComment = ""
                }, label: {
                    Text("Commenter").padding(3)
                }
                )//bouton
                .background(Color.accentColor)
                .cornerRadius(10)
                .foregroundColor(.white)
                .padding(.leading, 250)



            }//Section

            VStack{
                ForEach(place.comments){ comment in
                    VStack(alignment: .leading) {
                        HStack{
                            Image("user")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80)
                                .cornerRadius(50)
                                .padding(.leading, 10)
                                .padding(.bottom, 3)


                            VStack(alignment: .leading){
                                Text("\(comment.user)")
                                    .padding(.leading, 3)

                                UserRateView(place: place)
                                    .padding(.leading, 3)
                                Text(comment.text)
                                    .frame(width: 180, height: 15, alignment: .leading)
                                        .padding(EdgeInsets(top: 15, leading: 15, bottom: 15, trailing: 15))
                                        .border(Color.gray, width: 0.2)
                                        .cornerRadius(20)
                                        .padding(.trailing, 20)
                                        .padding(.bottom, 20)

                            }


                        }
                    }//vstack
                }//foreach

                FakeComment()
                Divider().background(Color.gray)
                FakeComment()

            }//list



        }
    }
}

struct CommentView_Previews: PreviewProvider {
    static var previews: some View {
        CommentView(place: place1)
    }
}
