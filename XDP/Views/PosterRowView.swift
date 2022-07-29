//
//  PosterRowView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct PosterRowView: View {
    //MARK: - PROPERTIES
    
    var poster: Poster
    
    
    var body: some View {
        HStack {
            Image(poster.image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 120, alignment: .center)
                .shadow(color: Color(red: 0, green: 0, blue:  0, opacity: 0.3), radius: 3, x: 2, y: 2)
                .background(
                    LinearGradient(gradient: Gradient(colors:  poster.gradientColors), startPoint: .top, endPoint: .bottom)
                )
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(poster.title)
                    .font(.title2)
                    .fontWeight(.bold)
                Text(poster.subtitle)
                    .font(.headline)
                    .fontWeight(.regular)
                Text(poster.headline)
                    .font(.caption)
                    .foregroundColor(Color.secondary)
            }
        }
    }
}

struct PosterRowView_Previews: PreviewProvider {
    static var previews: some View {
        PosterRowView(poster: posterData[0])
            .previewLayout(.sizeThatFits)
            .padding(3)
    }
}
