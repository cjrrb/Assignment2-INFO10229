//
//  TieredPricingView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan on 2026-07-21.
//

import SwiftUI

struct TieredPricingView: View {
    //Total usage entered by user
    @State private var totalUsage: Double!
    
    //Computed Consumption Charges
    var tier1Charges: Double {
        if totalUsage > 600 {
            return 600 * 0.142
        } else {
            return totalUsage * 0.12
        }
    }
    
    var tier2Charges: Double {
        if totalUsage > 600 {
            return (totalUsage - 600) * 0.142
        } else {
            return 0
        }
    }
    
    var totalConsumptionCharges: Double {
        tier1Charges + tier2Charges
    }
    
    //Computed Regulatory Charges
    var provincialRebate: Double {
        totalConsumptionCharges * 0.131
    }
    
    var hstCharge: Double {
        return (totalConsumptionCharges - provincialRebate) * 0.13
    }
    
    var totalRegulatoryCharges: Double {
        hstCharge - provincialRebate
    }
    
    //Net bill amount
    var netBillAmount: Double {
        totalConsumptionCharges + totalRegulatoryCharges
    }
    
    var body: some View {
        Form{
            Section("USAGE DETAILS"){
                TextField("Total Usage", value: $totalUsage, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("CONSUMPTION CHARGES"){
                
            }
            
            Section("REGULATORY CHARGES"){
                
            }
            
            Section("BILL AMOUNT"){
                
            }
        }
    }
}

#Preview {
    TieredPricingView()
}
