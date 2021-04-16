//
//  RegisterView.swift
//  Event
//
//  Created by dikeys on 27/03/2021.
//
import SwiftUI
import Firebase
import FirebaseDatabase


struct RegisterView: View {
    @State private var firstName = ""
    @State private var lastName = ""
    @State private var email = ""
    @State private var text = ""
    @State private var password = ""
    @State private var confirmedPassword = ""
    @State private var register = false
    @State private var user: FirebaseAuth.User?
    @State private var showMain = false
    @State private var isPresented = false
    @State private var isPresentedCover = false
    @State var authenfication = false
    @State private var isAlertPresent = false
    @State private var alertMessage = ""
    @State private var showPassword = false
    @State private var showConfirmedPassword = false
    
    
    var body: some View {
        GeometryReader { geometry in
            ZStack{
                
                Color.blue
                    .opacity(0.3)
                    .background(
                        Image("Login2")
                            .resizable()
                            .scaledToFill()
                        
                    )
                
                VStack(alignment: .center){
                    
                    Text("Création de compte")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.secondary)
                        .padding(.top, 34.0)
                        .opacity(0.5)
                  
                    
                    
                    HStack{
                        
                        
                        TextFieldCustom(text: $firstName, placeholder: "Nom", size: geometry.size.width / 3.5)
                        
                        
                        
                        TextFieldCustom(text: $lastName, placeholder: "Prénom", size: geometry.size.width / 3.5)
                        
                    }
                    
                    TextFieldCustom(text: $email, placeholder: "Email", size: geometry.size.width / 1.3)
                    
                    SecurefieldCustom(password: $password, showPassword: $showPassword, placeholder: "Mot de passe ", size: geometry.size.width / 1.6)
                    
                    SecurefieldCustom(password: $confirmedPassword, showPassword: $showConfirmedPassword, placeholder: "Confirmation mot de passe", size: geometry.size.width / 3)
                    Spacer()
                    Button(action:{
                        self.register.toggle()
                        if password == confirmedPassword{
                            Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
                                if error != nil {
                                    isAlertPresent.toggle()
                                    alertMessage = error!.localizedDescription
                                }else{
                                    if let user = authDataResult?.user{
                                        self.user = user
                                        self.showMain = true
                                        self.authenfication = true
                                        self.isPresentedCover = true
                                        let userId = Auth.auth().currentUser?.uid
//                                        let ref = Database.database().reference()
                                        var ref: DatabaseReference!
                                        ref = Database.database(url: "https://event-17d9e-default-rtdb.europe-west1.firebasedatabase.app").reference()

                                        ref.child("users").child(userId!).setValue(["firstName": self.firstName])

                                       

                                                                            }
                                }
                            }
                        }else{
                            isAlertPresent = true
                            alertMessage = "Les mots de passe ne sont pas similaire"
                        }
                        
                    }, label:
                        
                        {
                            HStack{
                                Spacer()
                                Text("Envoyer")
                                Spacer()
                            }.foregroundColor(.white)
                            .padding()
                            .background(Color.black)
                            .cornerRadius(10)
                            
                        }).padding()
                    
                    Spacer()
                }.alert(isPresented: $isAlertPresent, content: {
                    Alert(title: Text("\(alertMessage)"))
                })
//                .fullScreenCover(isPresented: $isPresentedCover, content:
//                                    TabBarView.init
//                )
                
            
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}

struct Title: ViewModifier {
    
    func body(content: Content)->some View{
        content
            .font(.largeTitle)
            .foregroundColor(.white)
            .padding()
            .background(Color.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
    
    
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            RegisterView()
                .preferredColorScheme(.light)
            RegisterView()
                .preferredColorScheme(.dark)
        }
        
    }
}
