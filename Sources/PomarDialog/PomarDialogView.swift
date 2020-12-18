//
//  PomarDialogView.swift
//
//  Created by Renato Gonçalves, for Roger - Habit Tracker on 18/12/20.
//

import SwiftUI

extension View {
    public func pDialog<Item, Content>(item: Binding<Item?>, showCloseButton: Bool = true, hideOnTapOutside: Bool = true, @ViewBuilder content: @escaping (Item) -> Content) -> some View where Item: Identifiable, Content: View {
        PomarDialogView(item: item, showCloseButton: showCloseButton, hideOnTapOutside: hideOnTapOutside, presenter: { self }, content: content)
    }
    
}

struct PomarDialogView<Item, Presenting, Content>: View where Item: Identifiable, Presenting: View, Content: View {
    
    @Binding var item: Item?
    var showCloseButton: Bool = true
    var hideOnTapOutside: Bool = true
    let presenter: () -> Presenting
    let content: (Item) -> Content

    let zIndexView: Double = 1
    let zIndexOverlay: Double = 9
    let zIndexDialog: Double = 10
    
    var body: some View {
        return ZStack(alignment: .topLeading) {
            presenter()
                .zIndex(zIndexView)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
            
            if item != nil {
                VStack{
                    EmptyView()
                }
                .zIndex(zIndexOverlay)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.black.opacity(0.9).ignoresSafeArea(.all))
                .transition(.opacity)
                .onTapGesture {
                    if hideOnTapOutside {
                        withAnimation{
                            item = nil
                        }
                    }
                }
            }
            
            if item != nil {
                VStack(alignment: .leading){
                    if showCloseButton {
                        Button(action: {withAnimation{item = nil}}){
                            HStack{
                                Spacer()
                                Image(systemName: "xmark")
                                    .foregroundColor(.white)
                                    .padding(.bottom)
                            }
                        }
                    } else {
                        // I don't know why, but without this the view is being center aligned
                        HStack{
                            Spacer()
                            EmptyView()
                        }
                    }
                    content(item!)
                }
                .padding()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .transition(AnyTransition.move(edge: .leading).combined(with: .opacity))
                .zIndex(zIndexDialog)
            }
        }
    }
}
