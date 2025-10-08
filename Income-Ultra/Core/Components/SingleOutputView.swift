//
//  SingleOutputView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

struct SingleOutputView: View {
    let name: String
    let output: Double
    
    var body: some View {
        HStack {
            nameView
            Spacer()
            outputView
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension SingleOutputView {
    var nameView: some View {
        Text(name)
            .font(.callout)
            .foregroundStyle(Color.appTheme.secondaryText)
    }
    
    var outputView: some View {
        Text("$\(output.formattedWithTwoDecimals) ")
            .foregroundStyle(Color.appTheme.accent)
            .fontWeight(.semibold)
    }
}

#Preview {
    SingleOutputView(name: "Hourly Wage", output: 25.50)
        .padding()
        .infinityFrame()
        .background(Color.appTheme.viewBackground)
}
