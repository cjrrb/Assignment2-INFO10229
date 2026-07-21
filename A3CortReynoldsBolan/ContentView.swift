//
//  ContentView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan on 2026-07-21.
//

import SwiftUI

struct ContentView: View {
    @State var useTieredPricing: Bool = false
    
    var body: some View {
        VStack {
            Text("Electricity Billing System")
                        .font(Font.default.bold())
                        
            Form{
                Section{
                    Toggle("Tiered Pricing?", isOn: $useTieredPricing)
                }
            }
            if useTieredPricing {
                TieredPricingView()
            } else {
                TOUPricingView()
            }
            
        }
        .padding(5)
        
    }
}

#Preview {
    ContentView()
}
