//
//  DetailPage.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 31.07.2023.
//

import SwiftUI

struct DetailPage: View {
   // @State var movie: MovieResult
    var body: some View {

        VStack {
            ZStack {
                Image("resim")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 375,height: 210)
                    
            }
                HStack {
                    Image("r")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 120)
                        .cornerRadius(16)
                        .offset(x: 30,y: -60)
                    HStack{
                        Image(systemName: "star")
                        Text("9.5")
                            .font(.system(size: 15))
                            .bold()
                        
                    }
                    .offset(x:240,y:-80)
                    .foregroundColor(.orange)
                    Text("Spiderman No Way\nHome")
                        .frame(width: 250, height: 70)
                        .font(Font.custom("Helvetica", size: 20))
                        .bold()
                        .offset(x: -50,y:-35)
                    
                }
            HStack {
                Text("2021 |")
                Text("148 Minutes |")
                Text("Action")
                
            }
            .frame(width: 274,height: 32)
            .font(Font.custom("Helvetica", size: 20))
            .padding()
            ScrollView(.horizontal) {
                HStack(spacing: 50) {
                    Button {
                      //  viewModel.loadNowPlaying()
                    } label: {
                        Text("About Movie")
                            .foregroundColor(.black)
                    }
                    .padding(.leading,20)
                    Button {
                     //  viewModel.loadUpComing()
                    } label: {
                        Text("Reviews")
                            .foregroundColor(.black)
                    }
                    Button {
                      // viewModel.loadPopular()
                      
                    } label: {
                        Text("Cast")
                            .foregroundColor(.black)
                    }
                }
            }
            .padding()
            
 
        }
        
       
    }
}

struct DetailPage_Previews: PreviewProvider {
    static var previews: some View {
        DetailPage()
    }
}
