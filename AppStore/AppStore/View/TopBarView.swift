//
//  TopBarView.swift
//  AppStore
//
//  Created by alex on 2022/10/27.
//

import SwiftUI

struct TopBarView : View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            VStack(alignment: .leading) {
                Text(getCurrentDate().uppercased())
                    .font(.caption)
                    .foregroundColor(.secondary)
                Text("Today")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
            }
            Spacer()
            AvatarView(image: "profile", width: 40, height: 40)
        }
    }
    
    func getCurrentDate(with format: String = "EEEE, MMM d") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        return dateFormatter.string(from: Date())
    }
}

//struct TopBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopBarView()
//    }
//}
