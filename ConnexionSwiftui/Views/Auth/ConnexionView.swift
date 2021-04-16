//
//  ConnexionView.swift
//  Event
//
//  Created by dikeys on 26/03/2021.
//

import SwiftUI
import Foundation
import Firebase

struct ConnexionView: View {
    
    var body: some View {
        if Auth.auth().currentUser != nil {
            Homepage()
        } else {
            ConnexionDispatcher()
        }
    }
}

struct ConnexionView_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionView()
    }
}
