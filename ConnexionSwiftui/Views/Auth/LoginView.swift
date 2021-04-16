//
//  LoginView.swift
//  Event
//
//  Created by dikeys on 05/12/2020.
//

import SwiftUI
import Firebase

struct LoginView: View {
    
    @Environment(\.managedObjectContext) var viewContext
    @FetchRequest( sortDescriptors: [])
    var UserIdIdentifiant: FetchedResults<UsersConnect>
    @State private var password: String = ""
    @State private var email: String = ""
    @State private var user: FirebaseAuth.User?
    @State private var showMain = false
    @State private var isPresented = false
    @State var authenfication = false
    @State private var isAlertPresent = false
    @State private var alertMessage = ""
//    var handle:
    var body: some View {
        ZStack{
          
            VStack{
               
                HStack{
                    Spacer()
                    Button(action: {
                        
                    }, label: {
                        Text("Inscription")
                            .foregroundColor(.white)
                    })
                    .padding()
                }
                Spacer()
                
                VStack{
                   
                    Text("Connexion")
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .padding()
                    
                    TextField("Entrer votre Email", text: $email)
                       
                        .padding()
                        .border(Color.white)
                        .foregroundColor(.white)
                    SecureField("Entrer votre mot de passe", text: $password)
                        .padding()
                        .border(Color.white)
                    Button(action: {
                       
                        Auth.auth().signIn(withEmail: email, password: password) { (authDataResult, error) in
                            if error != nil {
                                isAlertPresent.toggle()
                                alertMessage = error!.localizedDescription
                            }else{
                                
                                if let user = authDataResult?.user{
                                    print(user)
                                    self.user = user
                                    self.showMain = true
                                    self.authenfication = true
                                    var ref: DatabaseReference!

                                    ref = Database.database(url: "https://event-17d9e-default-rtdb.europe-west1.firebasedatabase.app").reference()
                                    ref.child("users/\(user.uid)/firstName").getData { (error, snapshot) in
                                        if let error = error {
                                            print("Error getting data \(error)")
                                        }
                                        else if snapshot.exists() {
                                            addItem(snapshot.value! as! String)
                                            print("Got data \(snapshot.value!)")
                                        }
                                        else {
                                            print("No data available")
                                        }
                                    }


                                    print(user.uid)
                                 }
                                
                            }
                        }
                    }, label: {
                        HStack{
                            Spacer()
                            Text("Connexion")
                            Spacer()
                        }
                        
                        
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.darkLight)
                        .cornerRadius(10)
                        
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.darkLight, lineWidth: 2)
                                .padding()
                        )
                        .padding()
                        
                    })
                    .fullScreenCover(isPresented: $showMain, content: {
//                        TabBarView()
                    })
                   
                    Button(action: {
                        self.isPresented.toggle()
                    }, label: {
                        Text("Mot de passe oublié")
                            .foregroundColor(.white)
                    })
             
                    
                }
                
                .padding()
                Spacer()
            }.alert(isPresented: $isAlertPresent, content: {
            Alert(title: Text(alertMessage))
            })
            
        }.background(Color.red)
        .edgesIgnoringSafeArea(.all)
    }
    
    private func addItem(_ firstName: String){
        withAnimation {
            let newUserConnect = UsersConnect(context: viewContext)
            newUserConnect.email = email
            newUserConnect.firstName = firstName
            newUserConnect.isConnected = true
        }
    }
}
extension Color{
    static let purpleDark = Color("PurpleDark")
    static let darkLight = Color("DarkLigteen")
    static let blueLighteen1 = Color("BlueLighteen1")
}
extension UIColor{
    static let purpleDark = UIColor(Color.purpleDark)
    static let darkLight = Color("DarkLigteen")
    static let blueLighteen1 = Color("BlueLighteen1")
}
extension UserDefaults{
    enum userKey {
        case firstName, lastName, connected
    }
}
struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .preferredColorScheme(.light)
            LoginView()
                .preferredColorScheme(.light)
        }
    }
}
