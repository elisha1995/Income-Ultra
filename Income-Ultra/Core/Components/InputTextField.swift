//
//  InputTextField.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/7/25.
//

import SwiftUI

struct InputTextField: View {
    var placeholder: String
    @Binding var value: Double?
    @State private var text: String = ""
    
    init(_ placeholder: String, value: Binding<Double?>) {
        self.placeholder = placeholder
        self._value = value
    }
    var body: some View {
        TextField(placeholder, text: $text)
            .inputTextField()
            .onAppear {
                if let value {
                    text = formatNumber(value)
                }
            }
            .onChange(of: text) { _, newText in
                let cleanedText = cleanInput(newText)
                value = Double(cleanedText)
            }
            .onChange(of: value) { _, newValue in
                text = formatNumber(newValue)
            }
    }
}

private extension InputTextField {
    func cleanInput(_ string: String) -> String {
        var result = string.filter { "0123456789.".contains($0) }
        let decimalParts = result.split(separator: ".", maxSplits: 1, omittingEmptySubsequences: false)
        
        if decimalParts.count > 1 {
            let integerPart = String(decimalParts[0])
            let fractionalPart = String(decimalParts[1].replacingOccurrences(of: ".", with: ""))
            result = integerPart + "." + fractionalPart
        }
        
        return result
    }
    
    func formatNumber(_ value: Double?) -> String {
        guard let value else { return "" }
        return numberFormatter.string(from: NSNumber(value: value)) ?? ""
    }
    
    var numberFormatter: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = ","
        formatter.maximumFractionDigits = 2
        formatter.minimumFractionDigits = 0
        return formatter
    }
}

#Preview {
    Preview()
}

fileprivate struct Preview: View {
    @State private var value: Double? = nil
    
    var body: some View {
        InputTextField("$ 65,000", value: $value)
            .padding()
            .infinityFrame()
            .background(Color.appTheme.viewBackground)
    }
}
