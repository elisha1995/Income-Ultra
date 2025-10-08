//
//  PayOutputView.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

struct PayOutputView: View {
    let pay: Pay
    
    var body: some View {
        VStack(spacing: 12) {
            titleView
            payView
        }
        .frame(maxWidth: .infinity)
        .padding(12)
        .background(Color.appTheme.cellBackground)
        .cornerRadius(.cell)
    }
}

private extension PayOutputView {
    var titleView: some View {
        Text("\(pay.incomeType.description) Pay")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.callout)
            .fontWeight(.semibold)
            .foregroundStyle(Color.appTheme.alternateAccent)
    }
    
    var payView: some View {
        ForEach(pay.brealdown, id: \.name) { singlePay in
            PayOutputRowView(name: singlePay.name, output: singlePay.value)
            if singlePay != pay.brealdown.last! {
                divider
            }
        }
    }
    
    var divider: some View {
        Divider()
            .foregroundStyle(Color.appTheme.divider)
    }
}

#Preview {
    PayOutputView(
        pay: .init(
            incomeType: .gross,
            weekly: 1_117,
            biWeekly: 2_235,
            fourWeekly: 4_469,
            monthly: 4_838,
            yearly: 58_100
        )
    )
    .padding()
    .infinityFrame()
    .background(Color.appTheme.viewBackground)
}
