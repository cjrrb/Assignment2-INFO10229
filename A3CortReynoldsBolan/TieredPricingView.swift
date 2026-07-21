//
//  TieredPricingView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan on 2026-07-21.
//

import SwiftUI

struct TieredPricingView: View {
    //Total usage entered by user
    @State var totalUsage: Double = 0
    
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
    var provicialRebate: Double {
        totalConsumptionCharges * 0.131
    }
    
    var hstCharge: Double {
        totalConsumptionCharges * 0.13 - provicialRebate
    }
    
    var totalRegulatoryCharges: Double {
        hstCharge - provicialRebate
    }
    
    //Net bill amount
    var netBillAmount: Double {
        totalConsumptionCharges + totalRegulatoryCharges
    }
    
    var body: some View {
        Form{
            Section("USAGE DETAILS"){
                
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
