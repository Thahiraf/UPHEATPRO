//
//  Login.swift
//  UpHeatPro
//
//  Created by Thahi on 03/11/2021.
//

import SwiftUI
import Firebase
struct Login: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var email = ""
    @State var password = ""
    @State var isVisible = false
    @Binding var show: Bool
    @State var alert = false
    @State var error = ""
    
    @EnvironmentObject var viewModel : AppViewModel
    var body: some View {
        ZStack{
        ZStack(alignment: .topTrailing){
            GeometryReader{_ in
                VStack{
                    Spacer()
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(Color("Color"))
                        .frame(width: 100, height: 100)
                    Text("Login to your account")
                        .font(.title)
                       // .fontWeight(.bold)
                        .foregroundColor(Color("Color"))
                        .padding(.top, 5)
                    TextField("Email", text: $email)
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("Color") : color, lineWidth: 2 ))
                        .padding(.top, 25)
                    HStack(spacing: 15){
                        VStack{
                            if isVisible{
                                TextField("password", text: $password)
                            }else{
                                SecureField("password", text: $password)
                            }
                        }
                        Button {
                            isVisible.toggle()
                        } label: {
                            Image(systemName: isVisible ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(color)
                        }

                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).stroke(email != "" ? Color("Color") : color, lineWidth: 2 ))
                    .padding(.top, 25)
                    
                    HStack{
                        Spacer()
                        Button {
                            print("forget")
                        } label: {
                            Text("Forget password")
                                .fontWeight(.bold)
                                .foregroundColor(Color("Color"))
                        }

                    }
                    .padding(.top, 20)
                    
                    Button {
                        
                            
//                        guard !email.isEmpty, !password.isEmpty else{
//                            return}
//                        viewModel.signIn(email: email, password: password)
                        verify()
                    } label: {
                        Text("Login")
                            .foregroundColor(.white)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 50)
                    }
                    .background(Color("Color"))
                    .cornerRadius(10)
                    .padding(.top, 25)
                    Spacer()
                }
                .padding(.horizontal, 25)
               
            }
            Button {
                show.toggle()
            } label: {
                Text("Register")
                    .fontWeight(.bold)
                    .foregroundColor(Color("Color"))
            }
            .padding()
        }
            if alert{
                AlertView(alert: $alert, error: $error)
            }
        }
       
    }
    func verify(){
        if email != "" && password != ""{
            Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
                if err != nil {
                    self.error = err!.localizedDescription

                }
                print("success")
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
                return
            
        }
    }


}
}
