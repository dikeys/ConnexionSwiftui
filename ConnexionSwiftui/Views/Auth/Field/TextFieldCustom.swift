//
//  textFieldCustom.swift
//  Event
//
//  Created by dikeys on 02/04/2021.
//

import SwiftUI

struct TextFieldCustom: View {
    @Binding var text: String
    var placeholder: String
    var size: CGFloat?
    var body: some View {
        ZStack{
            TextField("", text: $text)
                .padding()
                .foregroundColor(.white)
                .overlay(
                    Rectangle()
                        .frame(height: 1)
                        .foregroundColor(.white)
                        .padding(),
                    alignment: .bottom
                        
                )
               
            HStack{
                if text.isEmpty{
                    Text(placeholder)
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing, size ?? 20)
                }
            }
        }
    }
}

struct textFieldCustom_Previews: PreviewProvider {
    static var previews: some View {
        TextFieldCustom( text: .constant("text"), placeholder: "test", size: 20)
    }
}
