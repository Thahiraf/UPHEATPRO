//
//  CardView.swift
//  UpHeatPro
//
//  Created by Macbook on 04/11/2021.
//

import SwiftUI

struct CardView: View {
    var item: Item
    var body: some View {
        ZStack{
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                
            Text(item.price)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
            
        }
        .frame(width:250,height: 130)
        //.padding()
        .background(Color.white)
        .cornerRadius(25)
        
    }
}


