//
//  PayOutputRowView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

struct PayOutputRowView: View {
    let name: String
    let output: Double
    
    var body: some View {
        HStack(spacing: 16) {
            nameView
            Spacer()
            outputView
        }
        
    }
}

private extension PayOutputRowView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .foregroundStyle(Color.appTheme.secondaryText)
    }
    
    var outputView: some View {
        Text("$\(output.formattedAsWholeCurrencyOrInvalid)")
            .fontWeight(.semibold)
            .foregroundStyle(Color.appTheme.accent)
    }
}

#Preview {
    PayOutputRowView(
        name: "Weely", output: 1_117
    )
    .padding()
    .infinityFrame()
    .background(Color.appTheme.viewBackground)
}
