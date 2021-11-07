//
//  AppViewModel.swift
//  UpHeatPro
//
//  Created by Macbook on 05/11/2021.
//

import SwiftUI
import FirebaseAuth

class AppViewModel: ObservableObject{
    let auth = Auth.auth()
    var isSignedIn: Bool{
        return auth.currentUser != nil
    }
    func signIn(email: String, password: String){
        auth.signIn(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
                return
            }
            //success
        }
    }
    func signUp(email: String, password: String){
        auth.createUser(withEmail: email, password: password) { result, error in
            guard result != nil, error == nil else{
                return
            }
            //success
        }
    }
}
