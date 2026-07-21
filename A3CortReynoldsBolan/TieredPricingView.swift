//
//  TieredPricingView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan on 2026-07-21.
//

import SwiftUI

struct TieredPricingView: View {
    //Total usage entered by user
    @State var totalUsage: Double?
    
    //Computed Consumption Charges
    var tier1Charges: Double {
        if (totalUsage ?? 0) > 600 {
            return 600 * 0.12
        } else {
            return (totalUsage ?? 0) * 0.12
        }
    }
    
    var tier2Charges: Double {
        if (totalUsage ?? 0) > 600 {
            return ((totalUsage ?? 0) - 600) * 0.142
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
                HStack{
                    Text("Tier 1 Charges")
                    Spacer()
                    Text("$\(tier1Charges, specifier: "%.2f")")
                }
                HStack{
                    Text("Tier 2 Charges")
                    Spacer()
                    Text("$\(tier2Charges, specifier: "%.2f")")
                }
                HStack{
                    Text("Total Consumption Charges:")
                    Spacer()
                    Text("$\(totalConsumptionCharges, specifier: "%.2f")")
                }
                .foregroundStyle(.blue)
            }
            
            Section("REGULATORY CHARGES"){
                HStack{
                    Text("Provincial Rebate (13.1%):")
                    Spacer()
                    Text("$\(provincialRebate, specifier: "%.2f")")
                }
                HStack{
                    Text("HST (13% of Charges - Rebate):")
                    Spacer()
                    Text("$\(hstCharge, specifier: "%.2f")")
                }
                HStack{
                    Text("Total Regulatory Gharges:")
                    Spacer()
                    Text("$\(totalRegulatoryCharges, specifier: "%.2f")")
                }
                .foregroundStyle(.blue)
            }
            
            Section("BILL AMOUNT"){
                HStack{
                    Text("Net Bill Amount:")
                    Spacer()
                    Text("$\(netBillAmount, specifier: "%.2f")")
                }
                .foregroundStyle(.red)
            }
        }
    }
}

#Preview {
    TieredPricingView()
}
