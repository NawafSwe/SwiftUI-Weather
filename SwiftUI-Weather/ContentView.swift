//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Nawaf B Al sharqi on 06/11/2020.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        //making alignment .top to make the VStack on top of the background
        ZStack {
            //making a background color
            BackgroundView(isNight: self.$isNight, topColor: self.isNight ? .black : Color(#colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)),  bottomColor: self.isNight ? Color(#colorLiteral(red: 0.06274510175, green: 0, blue: 0.1921568662, alpha: 1)) : Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
            VStack{
            
                CityTextView(cityName: "Cupertino, CA")
                //VStack holds the temp State and the temp Degree
                VStack{
                    CurrentState(degree: "76°", image: "cloud.sun.bolt.fill")

                    
                    
                    //creating coming weather information for next days...
                
                    VStack{
                        HStack(spacing:21){
                            //expected temperature for each day and image state
                            UpComingView(day: "TUE", image: "cloud.bolt.rain.fill", degree: "76°")
                            UpComingView(day: "WED", image: "cloud.rain.fill", degree: "26°")
                            UpComingView(day: "THU", image: "cloud.moon.rain.fill", degree: "46°")
                            UpComingView(day: "FRI", image: "cloud.bolt.rain.fill", degree: "56°")
                            UpComingView(day: "SAT", image: "cloud.bolt.rain.fill", degree: "24°")
                              
                        }
                        .padding()
                            
                            
                        }
                        .padding()

                    }
                .padding()
                Spacer()
                
                ChangeTimeButtonView(toggleDay: self.$isNight)
                //push button up
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

struct UpComingView: View {
    var day: String = "TUE"
     var image: String = "cloud.bolt.rain.fill"
     var degree: String = "76°"
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

struct BackgroundView: View {
    @Binding var isNight : Bool
    var topColor : Color
    var bottomColor : Color
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ self.isNight ? .black :  self.isNight ? .white : topColor , bottomColor]), startPoint: .bottomTrailing, endPoint: .topLeading)
            .edgesIgnoringSafeArea(.all)
    }
}
struct CityTextView:View{
    var cityName: String
    var body:some View{
        Text("\(cityName)")
            .font(.title)
            .font(.system(size:32))
            .foregroundColor(.white)
            .padding()
    }
}

struct CurrentState: View {
    var degree: String
    var image: String
    var body: some View {
        VStack{
            //temperature state
            Image(systemName: "\(image)")
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
            Text("\(degree)")
                .foregroundColor(.white)
                .font(.system(size: 50))
        }
    }
}

struct ChangeTimeButtonView: View {
    @Binding var toggleDay : Bool
    
    var body: some View {
        Button(action:{
            self.toggleDay.toggle()
            
        }){
            Text("Change Time Of Day")
                .font(.system(size: 16 , weight:.bold))
                .foregroundColor(.blue)
                .padding()
                .frame(width: 250)
        }
        
        .background(Color(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)))
        .clipShape(RoundedRectangle(cornerRadius: 20))
        //pushing the button a bit down
        .padding(.vertical)
    }
}
