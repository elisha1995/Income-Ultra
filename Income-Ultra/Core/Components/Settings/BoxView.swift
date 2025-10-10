//
//  BoxView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

struct BoxView<Content: View>: View {
    let data: Data
    @ViewBuilder let content: Content
    
    var body: some View {
        VStack(spacing: 8) {
            heading
            divider
            content
        }
        .padding()
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension BoxView {
    var heading: some View {
        HStack {
            Text(data.title)
                .fontWeight(.semibold)
            Spacer()
            if let sfSymbol = data.sfSymbol {
                Image(systemName: sfSymbol)
            }
        }
    }
    var divider: some View {
        Divider()
            .foregroundStyle(Color.appTheme.divider)
    }
}

extension BoxView {
    struct Data {
        let title: String
        var sfSymbol: String?
    }
}

#Preview {
    BoxView(
        data: .init(title: "Developer", sfSymbol: "person.crop.circle")
    ) {
        Text("Content goes here")
    }
    .padding()
    .infinityFrame()
    .background(Color.appTheme.viewBackground)
}
