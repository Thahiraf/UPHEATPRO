//
//  Home.swift
//  UpHeatPro
//
//  Created by Thahi on 03/11/2021.
//

import SwiftUI

struct Home: View {
    @State var show = false
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
    var body: some View {
        NavigationView{
            if self.status{
              //  HomeScreen()
                DashboardView()
            }else{
                ZStack{
                    NavigationLink(destination: SignUp(show: $show), isActive: $show, label: {
                        Text("")
                    })
                    .hidden()
                    Login(show: $show)
                }
            }
        }
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            .onAppear(){
                NotificationCenter.default.addObserver(forName: NSNotification.Name("status"), object: nil, queue: .main) {(_) in
                    self.status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                }
            }
        }
    }


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
