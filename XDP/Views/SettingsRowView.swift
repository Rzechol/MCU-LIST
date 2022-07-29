//
//  SettingsRowView.swift
//  XDP
//
//  Created by Bartosz Rzechółka on 26/07/2022.
//

import SwiftUI

struct SettingsRowView: View {
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil
    
    // MARK: - BODY
    var body: some View {
        VStack {
            
            Divider().padding(.vertical,4)
            
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                if content != nil {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil ) {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square").foregroundColor(.pink)
                } else {
                    EmptyView()
                }
                
            }
        }
    }
}
// MARK: - PREVIEW
struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "DEVELOPER", content: "Bartosz Rzechółka")
                .preferredColorScheme(.light)
                .previewLayout(.fixed(width: 375, height: 60))
            .padding()
            SettingsRowView(name: "WEBSITE", linkLabel: "AM SZCZECIN", linkDestination: "am.szczecin.pl")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}
