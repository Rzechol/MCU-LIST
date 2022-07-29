//
//  DetailIfoView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 25/07/2022.
//

import SwiftUI

struct DetailIfoView: View {
    // MARK: - PROPERTIES
    
    var poster: Poster
    let detailInfo: [String] = [ "REŻYSER", "SCENARIUSZ", "OCENA FANÓW", "OCENA KRYTYKÓW", "DŁUGOŚĆ FILMU", "BUDŻET", "PREMIERA",]
    
    // MARK: - BODY
    
    
    var body: some View {
        GroupBox() {
            DisclosureGroup("SZCEGÓŁÓWE INFORMACJE O FILMIE")
                 {
                ForEach(0..<detailInfo.count, id: \.self) { item in
                    Divider().padding(.vertical,2)
                    
                    HStack {
                        Group {
                            Image(systemName: "info.circle")
                            Text(detailInfo[item])
                        }
                        .foregroundColor(poster.gradientColors[1])
                        .font(Font.system(.body).bold())
                        
                        
                        Spacer(minLength: 25)
                        Text(poster.info[item])
                            .multilineTextAlignment(.trailing)
                    }
                }
            }
        }
    }
}
// MARK: - PREVIEW

struct DetailIfoView_Previews: PreviewProvider {
    static var previews: some View {
        DetailIfoView(poster: posterData[0])
            .preferredColorScheme(.dark)
            .previewLayout(.fixed(width: 375, height: 480))
            .padding()
    }
}
