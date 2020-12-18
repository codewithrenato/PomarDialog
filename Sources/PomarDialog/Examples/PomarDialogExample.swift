//
//  ContentView.swift
//  Dialog
//
//  Created by Renato Gonçalves on 01/12/20.
//

import SwiftUI

enum PomarDialogEnum
{
    case first
    case second
}

extension PomarDialogEnum: Identifiable {
    var id: PomarDialogEnum { self }
}

struct PomarDialogExample: View {
    @State private var isPresented: PomarDialogEnum? = nil
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation{
                    self.isPresented = .first
                }
            }){
                Text("Show dialog 1")
                    .padding()
            }
            
            Button(action: {
                withAnimation{
                    self.isPresented = .second
                }
            }){
                Text("Show dialog 2")
                    .padding()
            }
            
            Spacer()
        }
        .pDialog(item: $isPresented, showCloseButton: false){ item in
            switch item {
            case .first:
                    Text("First screen")
                        .foregroundColor(.white)
                
            case .second:
                Text("Second screen")
                    .foregroundColor(.white)
            }
        }
    }
}
