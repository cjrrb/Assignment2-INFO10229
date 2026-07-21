//
//  ContentView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan (991697602) on 2026-07-21.
//

import SwiftUI

struct ContentView: View {
    @State var useTieredPricing: Bool = false
    
    var body: some View {
        //Reference: https://developer.apple.com/documentation/swiftui/navigationstack
        NavigationStack {
            Form{
                Section{
                    Toggle("Tiered Pricing?", isOn: $useTieredPricing)
                }
                if useTieredPricing {
                    TieredPricingView()
                    
                } else {
                    TOUPricingView()
                }
            }
            .padding(.top, -30)
            .navigationTitle("Electricity Billing System")
            .navigationBarTitleDisplayMode( .inline)
        }
    }
}

#Preview {
    ContentView()
}
