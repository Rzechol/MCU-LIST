//
//  SourceLinkView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct SourceLinkView: View {
    var body: some View {
        GroupBox(){
            HStack{
                Text("OBEJRZYJ NA")
                Spacer()
                Link("DISNEY PLUS", destination: URL(string:
                    "https://disneyplus.pl")!)
                Image(systemName: "arrow.up.right.square")
            }
            .font(.footnote)
        }
        
    }
}

struct SourceLinkView_Previews: PreviewProvider {
    static var previews: some View {
        SourceLinkView()
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
