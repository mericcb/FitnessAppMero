//
//  TermsView.swift
//  FitnessAppMero
//
//  Created by Meriç Cem Baysar on 28.07.2024.
//

import SwiftUI

struct TermsView: View {
    @Environment(\.dismiss) var dissmis
    @AppStorage("username") var username: String?
    @State var name = ""
    @State var acceptedTerms = false
    
    var body: some View {
        VStack {
            Text("Leaderboard")
                .font(.largeTitle)
                .bold()
            
            Spacer()
            
            TextField("Username", text: $name)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                )
            
            HStack(alignment: .top) {
                Button {
                    withAnimation {
                        acceptedTerms.toggle()
                    }
                } label: {
                    if acceptedTerms{
                        Image(systemName: "square.inset.filled")
                    } else {
                        Image(systemName: "square")
                    }
                }
                
                Text("By checking you agree to the terms and enter into the leaderboard competition.")
            }
            
            Spacer()
            
            Button {
                if acceptedTerms && name.count > 2 {
                    username = name
                    dissmis()
                }
            } label: {
                Text("Continue")
                    .foregroundStyle(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                    )
            }
            
        }
        .padding(.horizontal)
    }
}

#Preview {
    TermsView()
}
