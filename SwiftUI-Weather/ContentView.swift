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
                
                //VStack holds the temp State and the temp Degree
                VStack{
                    //temperature state
                    Image(systemName: "cloud.sun.bolt.fill")
                        //renderMode with .original will give multi color sf symbol
                        .renderingMode(.original)
                        //to resize image
                        .resizable()
                        //making sure the quality of the image good
                        .aspectRatio(contentMode: .fit)
                        //give the picture a frame
                        .frame(width: 150, height: 150, alignment: .center)
                        .font(.system(size:20))
                        .padding()
                    
                    //temperature degree
                    Text("76°")
                        .foregroundColor(.white)
                        .font(.system(size: 50))
                    
                    
                    //creating coming weather information for next days...
                    
                    VStack{
                  
                        HStack(spacing:21){
                            //expected temperature for each day and image state
                            upComingView(day: "TUE", image: "cloud.bolt.rain.fill", degree: "76°")
                            upComingView(day: "WED", image: "cloud.rain.fill", degree: "26°")
                            upComingView(day: "THU", image: "cloud.moon.rain.fill", degree: "46°")
                            upComingView(day: "FRI", image: "cloud.bolt.rain.fill", degree: "56°")
                            upComingView(day: "SAT", image: "cloud.bolt.rain.fill", degree: "24°")
                              
                        }
                        .padding()
                            
                            
                        }
                        .padding()
                    
                    }
                .padding()
                Spacer()
                }
                  
            }
       
        }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct upComingView: View {
    @State var day: String = "TUE"
    @State var image: String = "cloud.bolt.rain.fill"
    @State var degree: String = "76°"
    var body: some View {
        
        //styling all images gives them multi color and resize them
        VStack{
            Text("\(day)")
                .foregroundColor(.white)
                .font(.system(size: 20))
            
            Image(systemName: "\(image)")
                .resizable()
                .renderingMode(.original)
                .frame(width: 40, height: 40, alignment: .center)
                .aspectRatio(contentMode: .fit)
            
            Text("\(degree)")
                .font(.system(size: 20))
                .foregroundColor(.white)
            
        }
    }
}
