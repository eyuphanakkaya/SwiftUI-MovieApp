//
//  ReviewsPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 3.08.2023.
//

import SwiftUI

struct ReviewsPageDesign: View {
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.flexible())], content: {
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 55,height: 55)
                        .offset(y:-200)
                        .foregroundColor(.white)
                        .padding(.leading)
                    VStack(alignment: .leading,spacing: 15){
                        Text("Eyüphan Akkaya")
                            .foregroundColor(.white)
                        Text("_Barbie_ reels you in with its silly humor and fantastical ideas. The war of Kens during the last half hour of the film is an all-timer because a battle full of handsome maneuvers, like showing off their naked chest and manly noogies, turns into a full on dance off between Ryan Gosling and Simu Liu.\r\n\r\nBut the second half of the film leaves a thought-provoking message in your brain regarding both men and women. The Kens gaining respect little by little mirrors how women eventually earned their rights to be respected individuals — after being considered as only being useful in the kitchen or for making babies — except with the gender roles reversed and nude blobs instead of genitalia.")
                            .foregroundColor(.white)
                        Text("Date: 2023-07-21")
                            .foregroundColor(.white)
                            
                    }
                   

                }.border(.white)
                  
                HStack {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 55,height: 55)
                        .offset(y:-200)
                        .foregroundColor(.white)
                        .padding(.leading)
                    VStack(alignment: .leading,spacing: 15){
                        Text("Eyüphan Akkaya")
                            .foregroundColor(.white)
                        Text("_Barbie_ reels you in with its silly humor and fantastical ideas. The war of Kens during the last half hour of the film is an all-timer because a battle full of handsome maneuvers, like showing off their naked chest and manly noogies, turns into a full on dance off between Ryan Gosling and Simu Liu.\r\n\r\nBut the second half of the film leaves a thought-provoking message in your brain regarding both men and women. The Kens gaining respect little by little mirrors how women eventually earned their rights to be respected individuals — after being considered as only being useful in the kitchen or for making babies — except with the gender roles reversed and nude blobs instead of genitalia.")
                            .foregroundColor(.white)
                        Text("Date: 2023-07-21")
                            .foregroundColor(.white)
                            
                    }
                   

                }.border(.white)
                    
                
                
              
            })
        }
        .background(Color("background"))

    }
}

struct ReviewsPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsPageDesign()
    }
}
