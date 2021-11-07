//
//  SignUp.swift
//  UpHeatPro
//
//  Created by Thahi on 03/11/2021.
//

import SwiftUI
import FirebaseAuth
struct SignUp: View {
    
    @State var color = Color.black.opacity(0.7)
    @State var fname = ""
    @State var lname = ""
    @State var phone = ""
    @State var email = ""
    @State var password = ""
    @State var rePassword = ""
    @State var isVisible = false
    @State var reVisible = false
    @State var alert = false
    @State var error = ""
    
    @Binding var show: Bool
    var body: some View {
        ZStack{
            ZStack(alignment: .topLeading){
                GeometryReader{_ in
                    VStack{
                        Spacer()
    //                    Image(systemName: "person.fill")
    //                        .resizable()
    //                        .scaledToFit()
    //                        .foregroundColor(Color("Color"))
    //                        .frame(width: 100, height: 100)
                        Text("Register Account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                            .padding(.top, 5)
                        TextField("First Name", text: $fname)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(fname != "" ? Color("Color") : color, lineWidth: 2 ))
                            .padding(.top, 25)
                        TextField("Last Name", text: $lname)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 4).stroke(lname != "" ? Color("Color") : color, lineWidth: 2 ))
                            .padding(.top, 25)
                        TextField("Phone Number", text: $phone)
                            .padding()
                            .keyboardType(.decimalPad)
                            .background(RoundedRectangle(cornerRadius: 4).stroke(phone != "" ? Color("Color") : color, lineWidth: 2 ))
                            .padding(.top, 25)
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
                        
                     /*
                      //ReEnter
    //                    HStack(spacing: 15){
    //                        VStack{
    //                            if reVisible{
    //                                TextField("Re-Enter", text: $rePassword)
    //                            }else{
    //                                SecureField("Re - Enter", text: $rePassword)
    //                            }
    //                        }
    //                        Button {
    //                            reVisible.toggle()
    //                        } label: {
    //                            Image(systemName: reVisible ? "eye.slash.fill" : "eye.fill")
    //                                .foregroundColor(color)
    //                        }
    //
    //                    }
    //                    .padding()
    //                    .background(RoundedRectangle(cornerRadius: 4).stroke(rePassword != "" ? Color("Color") : color, lineWidth: 2 ))
    //                    .padding(.top, 25)
                        */
                        
                        Button {
                           register()
                        } label: {
                            Text("Register")
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
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundColor(Color("Color"))
                       
                }
                .padding()
            }
            if alert{
                AlertView(alert: $alert, error: $error)
            }
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
       
    }
    
    func register(){
        if email != ""{
            Auth.auth().createUser(withEmail: email, password: password) { res, err in
                if err != nil{
                    error = err!.localizedDescription
                    return
                }
                print("success")
                
                UserDefaults.standard.set(true, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("status"), object: nil)
            }
        }
    }
}



