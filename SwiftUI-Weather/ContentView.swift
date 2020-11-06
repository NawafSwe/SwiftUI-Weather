//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Nawaf B Al sharqi on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        //making alignment .top to make the VStack on top of the background
        ZStack {
            //making a background color
            LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1))]), startPoint: .bottomTrailing, endPoint: .topLeading)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Text("Cupertino, CA")
                    .font(.title)
                    .font(.system(size:32))
                    .foregroundColor(.white)
                    .padding()
                    Spacer()
                
                //VStack holds the temp State and the temp Degree
                VStack{
                    //temperature state
                    Image(systemName: "cloud.bolt.rain")
                        .resizable()
                        .font(.system(size:20))
                        .foregroundColor(.white)
                        .frame(width: 150, height: 150, alignment: .center)
                        .padding()
                    
                    //temperature degree
                    Text("76C")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    Spacer()
                }
  
                
                
                
            }
        }
  
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
