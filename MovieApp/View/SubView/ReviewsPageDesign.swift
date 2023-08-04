//
//  ReviewsPageDesign.swift
//  MovieApp
//
//  Created by Eyüphan Akkaya on 3.08.2023.
//

import SwiftUI

struct ReviewsPageDesign: View {
    @ObservedObject var viewModel: MovieDBViewModel
    @State var movie: MovieResult?

    @State var reviewList =  [ReviewsPersons]()
    var body: some View {
        ScrollView{
            ForEach(reviewList,id: \.self) { review in
                LazyVGrid(columns: [GridItem(.flexible())], content: {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 55,height: 55)
                        .foregroundColor(.white)
                        .padding(.leading)
                    if let author = review.author, let content = review.content, let created = review.created_at {
                        HStack {
                            VStack(alignment: .leading,spacing: 15){
                                Text(author)
                                    .foregroundColor(.white)
                                Text(content)
                                    .foregroundColor(.white)
                                Text(created)
                                    .foregroundColor(.white)
                                
                            }
                        }.padding()
                    }
                    
                })
            }

            
        }
        .onAppear{
            viewModel.fetchReviews(id: movie?.id ?? 0) { result in
                self.reviewList.append(contentsOf: result)
            }
        }
        .background(Color("background"))
        
    }
}

struct ReviewsPageDesign_Previews: PreviewProvider {
    static var previews: some View {
        ReviewsPageDesign(viewModel: MovieDBViewModel())
    }
}
