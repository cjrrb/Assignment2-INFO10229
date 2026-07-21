//
//  TOUPricingView.swift
//  A3CortReynoldsBolan
//
//  Created by Cort Reynolds-Bolan (991697602) on 2026-07-21.
//

import SwiftUI

struct TOUPricingView: View {
    //Usage details entered by user
    @State var onPeakUsage: Double?
    @State var offPeakUsage: Double?
    @State var midPeakUsage: Double?
    
    //Computed Consumption Charges
    var onPeakCharges: Double {
        return (onPeakUsage ?? 0) * 0.203
    }
    
    var offPeakCharges: Double {
        return (offPeakUsage ?? 0) * 0.098
    }
    
    var midPeakCharges: Double {
        return (midPeakUsage ?? 0) * 0.157
    }
    
    var totalConsumptionCharges: Double {
        return onPeakCharges + offPeakCharges + midPeakCharges
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
        List{
            Section("USAGE DETAILS"){
                TextField("On-Peak Usage", value: $onPeakUsage, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Off-Peak Usage", value: $offPeakUsage, format: .number)
                    .keyboardType(.decimalPad)
                TextField("Mid-Peak Usage", value: $midPeakUsage, format: .number)
                    .keyboardType(.decimalPad)
            }
            
            Section("CONSUMPTION CHARGES"){
                HStack{
                    Text("On-Peak Charges:")
                    Spacer()
                    Text("$\(onPeakCharges, specifier: "%.2f")")
                }
                HStack{
                    Text("Off-Peak Charges:")
                    Spacer()
                    Text("$\(offPeakCharges, specifier: "%.2f")")
                }
                HStack{
                    Text("Mid-Peak Charges:")
                    Spacer()
                    Text("$\(midPeakCharges, specifier: "%.2f")")
                }
                
                HStack{
                    Text("Total Consumption Charges:")
                    Spacer()
                    Text("$\(totalConsumptionCharges, specifier: "%.2f")")
                }.foregroundStyle(.blue)
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
    TOUPricingView()
}
