//
//  buttonView.swift
//  projet
//
//  Created by apprenant42 on 18/09/2023.
//

import SwiftUI

struct ButtonExt_Previews: PreviewProvider {
    static var previews: some View {
        ButtonExt( text: .alim, image: "carrot", clrButton: .yellow, selectedType: .constant(.alim))
    }
}
struct ButtonExt: View{

    let text: PlaceType
    let image : String
    let clrButton: Color
    @Binding var selectedType: PlaceType
    
    var body: some View{
        Button(action: {
            selectedType = text
        },
               label: {
            HStack{
                Image(systemName: image)
                Text(text.rawValue)
            }.padding(.vertical,5)
                .padding(.horizontal,5)
                .background(clrButton)
                .cornerRadius(20)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
        })
    }
}

