//
//  ConnexionDispatcher.swift
//  EventV1
//
//  Created by dikeys on 16/04/2021.
//

import SwiftUI

struct ConnexionDispatcher: View {
    @State private var  loginOn = false
    @State private var registerOn = false
    @Environment(\.openURL) var openURL
    var body: some View {
        ZStack{
            
           
               
            VStack{
                Spacer()
                HStack{
                    Button(action:{
                        self.registerOn.toggle()
//                        openURL(URL(string: "https://www.apple.com")!)
                    }, label:
                        
                        {
                            HStack{
                                Spacer()
                                Text("S'inscrire")
                                
                                
                                Spacer()
                                
                            }.foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            
                        }).sheet(isPresented: $registerOn) {
                            RegisterView()
                        }
//                    .fullScreenCover(isPresented: $loginOn, content:
//                                        LoginView.init
//                    )
                    Button(action:{
                        self.loginOn.toggle()
                    }, label:
                        
                        {
                            HStack{
                                Spacer()
                                Text("Connexion")
                                
                                Spacer()
                                
                            }.foregroundColor(.black)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(10)
                            
                        }).sheet(isPresented: $loginOn) {
                            LoginView()
                        }
//                    .fullScreenCover(isPresented: $loginOn, content:
//                                        LoginView.init
//                    )
                }
                .padding()
                
                HStack{
                    Button(action:{
                        self.loginOn.toggle()
                    }, label:

                        {
                            HStack{
                                Spacer()
                                Text("Continuer sans compte")

                                Spacer()

                            }.foregroundColor(.white)
                            .padding()
                            .background(Color.darkLight)
                            .cornerRadius(10)

                        })
                    .fullScreenCover(isPresented: $loginOn, content:
                                        LoginView.init
                    )
                    
                }
                .padding()
                
            }
        }
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
}

struct ConnexionDispatcher_Previews: PreviewProvider {
    static var previews: some View {
        ConnexionDispatcher()
    }
}
