//
//  ChartDataView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 25.07.2024.
//

import SwiftUI

struct ChartDataView: View {
    @State var average: Int
    @State var total: Int
    
    
    var body: some View {
        HStack {
            Spacer()
            
            VStack(spacing: 16) {
                Text("Average")
                    .font(.title2)
                
                Text("\(average)")
                    .font(.title2)
            }
            .frame(width: 90)
            .foregroundStyle(.black)
            .padding()
            .background(.gray.opacity(0.07))
            .cornerRadius(10)
            
            Spacer()
            
            VStack(spacing: 16) {
                Text("Total")
                    .font(.title2)
                
                Text("\(total)")
                    .font(.title2)
            }
            .frame(width: 90)
            .foregroundStyle(.black)
            .padding()
            .background(.gray.opacity(0.07))
            .cornerRadius(10)
            
            Spacer()
        }
    }
}

#Preview {
    ChartDataView(average: 1321, total: 13550)
}
