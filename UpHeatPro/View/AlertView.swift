//
//  ErrorView.swift
//  UpHeatPro
//
//  Created by Thahi on 03/11/2021.
//

import SwiftUI

struct AlertView: View {
    @State var color = Color.black.opacity(0.7)
    @Binding var alert: Bool
    @Binding var error: String
    var body: some View {
        GeometryReader{_ in
            VStack{
                
                HStack {
                    Text("Alert")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(color)
                        
                    //Spacer()
                }
                .padding(.horizontal, 25)
                Text(error)
                    .foregroundColor(color)
                    .padding(.top)
                    .padding(.horizontal,25)
                   
                
                Button {
                    alert.toggle()
                } label: {
                    Text("Cancel")
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 120)
                }
                .background(Color("Color"))
                .cornerRadius(10)
                .padding(.top)
                .padding(.horizontal,25)
            }
            .padding(.vertical, 25)
            .frame(width: UIScreen.main.bounds.width - 70)
            .background(Color.white)
            .cornerRadius(15)
        }
        .background(Color.black.opacity(0.35).edgesIgnoringSafeArea(.all))
    }
}


