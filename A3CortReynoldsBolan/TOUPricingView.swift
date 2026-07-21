//
//  TOUPricingView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan on 2026-07-21.
//

import SwiftUI

struct TOUPricingView: View {
    //Usage details entered by user
    @State var onPeakUsage: Double = 0.0
    @State var offPeakUsage: Double = 0.0
    @State var midPeakUsage: Double = 0.0
    
    //Computed Consumption Charges
    var onPeakCharges: Double {
        onPeakUsage * 0.203
    }
    
    var offPeakCharges: Double {
        offPeakUsage * 0.098
    }
    
    var midPeakCharges: Double {
        midPeakUsage * 0.157
    }
    
    var totalConsumptionCharges: Double {
        onPeakUsage + offPeakUsage + midPeakUsage
    }
    
    //Computed Regulatory Charges
    var provincialRebate: Double {
        totalConsumptionCharges * 0.131
    }
    
    var hstCharge: Double {
        totalConsumptionCharges * 0.13 - provincialRebate
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
    TOUPricingView()
}
