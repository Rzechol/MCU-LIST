//
//  StartButtonView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 24/07/2022.
//

import SwiftUI

struct StartButtonView: View {
    // MARK: - PROPERTIES
    @AppStorage("MainView") var isMainViewActive: Bool?
    
    // MARK: - BODY
    var body: some View {
        Button(action: {
            isMainViewActive = false
        }
        )
        {
            HStack(spacing: 8){
            Text("Start")
                    
                    .foregroundColor(Color.white)
                    
                
                
            Image(systemName:  "arrow.right.circle")
                    .imageScale(.large)
                    .foregroundColor(Color.white)
                    
        }
            
            
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color.white, lineWidth: 1.25)
                    
            )
           
            
    }
        .buttonStyle(PlainButtonStyle())
        //: BUUTON
       // .accentColor(Color.white)
        
}
}
//MARK: - PREVIEW
struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .preferredColorScheme(.dark)
            .previewLayout(.sizeThatFits)
    }
}
