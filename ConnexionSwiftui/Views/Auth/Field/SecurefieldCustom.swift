//
//  securefieldCustom.swift
//  Event
//
//  Created by dikeys on 02/04/2021.
//

import SwiftUI

struct SecurefieldCustom: View {
    @Binding var password:String
    @Binding var showPassword: Bool
    @Environment(\.colorScheme) var colorScheme
    var placeholder: String
    var size: CGFloat?
    var body: some View {
        HStack {
            Image(systemName: "lock")
                .foregroundColor(.black)
            if showPassword {
                TextField(placeholder,
                          text: $password)
                
            } else {
                SecureField(placeholder,
                            text: $password)
                   
                
            }
            Button(action: { self.showPassword.toggle()}) {
                
                Image(systemName: "eye")
                    .foregroundColor(colorScheme == .dark ? .black : .secondary)
            }
        }.padding().background(Capsule().fill(Color.white))
    }
}

struct securefieldCustom_Previews: PreviewProvider {
    static var previews: some View {
        SecurefieldCustom(password: .constant("aqwzsx"),showPassword: .constant(false), placeholder: "")
    }
}
