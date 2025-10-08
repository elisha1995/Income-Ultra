//
//  Views+hideKeyboard.swift
//  Income-Ultra
//
//  Created by Elisha Samuel Gyamfi on 10/8/25.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
