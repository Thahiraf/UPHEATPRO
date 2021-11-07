//
//  DashboardView.swift
//  UpHeatPro
//
//  Created by Macbook on 04/11/2021.
//

import SwiftUI
import FirebaseAuth

struct DashboardView: View {
    var items = [
        Item(image: "lakemcdonald", price: "AED 160"),
        Item(image: "umbagog", price: "AED 120"),
        Item(image: "twinlake", price: "AED 120")
    ]
   
    @State var currentPage = 0
    @State var searchText :String = ""
    @State var isSearch = false
    var body: some View {
        ScrollView{
            VStack(spacing:1) {
                HStack{
//                  
                    Button {
                        try! Auth.auth().signOut()
                        UserDefaults.standard.set(false, forKey: "status")
                        NotificationCenter.default.post(name: Notification.Name("status"), object: nil)
                    } label: {
                        Image(systemName: "list.bullet")

                        .aspectRatio( contentMode: .fit)
                    }
                    
                    Spacer()
                    Image(systemName: "tropicalstorm")
                    .padding(.horizontal, 80)
                    Image(systemName: "bell")
                        .padding(.trailing)
                    Button {
                     print("search")
                    } label: {
                        Image(systemName: "magnifyingglass")
                    }
            
                  }
                .font(.title)
                .foregroundColor(.white)
                .padding()
                .padding(.top, 35)
               
                TabView {
                   
                    Image("charleyrivers")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                       // .frame(height: 200).cornerRadius(20).padding()
                   
                    Image("chincoteague")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                       
                    
                    Image("stmarylake")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                      
                    
                }
                
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color.white)
                .cornerRadius(10)
                .padding()
                .tabViewStyle(PageTabViewStyle())
               // .tabViewStyle(.page(indexDisplayMode: .always))
              //  PageControl(current: currentPage)
                   // .frame(.)
                midFrame
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 15){
                        ForEach(items){item in
                            CardView(item:item)
                                .shadow(color: Color.black.opacity(0.16), radius: 5, x: 0, y: 5)
                        }
                    }
                   // .padding(.vertical,22)
                }
                lowFrame
                //.padding(.top)
            }
            .background(Color.white.clipShape(CustomCorner(corners: [.topLeft, .topRight], size: 55)).ignoresSafeArea(.all, edges: .bottom).padding(.top, 190))
            .background(Color("Colorb").ignoresSafeArea(.all, edges: .all))
        }
        .ignoresSafeArea()
    }
    //ask for advice
     var midFrame: some View {
        
         VStack(alignment: .leading){
                 Text("ASK FOR ADVICE NOW")
                 Text("Ask")
                     .foregroundColor(.white)
                     .frame(width: 75, height: 45)
                     .background(Color("Colorb"))
                     .cornerRadius(28)
                     .onTapGesture {
                         print("Asked")
                     }
             }
             .padding(.leading,115)
             .frame(maxWidth: .infinity)
             .frame(height:200)
             //.background(Color.red)
             
             .background(Image("twinlake").resizable())
          .cornerRadius(10)
          .padding()
         
    }
    var lowFrame: some View{
        ScrollView(.horizontal, showsIndicators: false){
            ZStack {
                HStack{
                    ForEach(items){item in
                        
                        CardView(item:item)
                            .clipShape(Circle())
                            .shadow(color: Color.black.opacity(0.16), radius: 5, x: 0, y: 5)
                    }
                }
            }
            // .padding(.leading,115)
            .frame(maxWidth: .infinity)
            .frame(height:200)
            //.background(Color.red)
            
            .background(Color.gray)
         .cornerRadius(10)
         .padding()
           // .padding(.vertical,22)
        }
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
    }
}
