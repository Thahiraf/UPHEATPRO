//
//  HomeScreen.swift
//  UpHeatPro
//
//  Created by Macbook on 05/11/2021.
//

import SwiftUI
import FirebaseAuth
struct HomeScreen: View {
    var body: some View {
        VStack{
            Text("Logged Successfully")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color.black.opacity(0.7))
            
            Button {
                try! Auth.auth().signOut()
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
                
            } label: {
                Text("Log out")
                    .foregroundColor(.black
                    )
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 50)
            }

        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
