//
//  ContentView.swift
//  Wallet
//
//  Created by alex on 2022/10/21.
//

import SwiftUI

struct WalletView: View {
    @State var cards: [Card] = testCards
    @State private var isCardPresented = false
    
    private static let cardOffset: CGFloat = 50.0
    
    @State var isCardPressed = false
    @State var selectedCard: Card?
    
    @GestureState private var dragState = DragState.inactive
    
    var body: some View {
        VStack {
            TopNavBar().padding(.bottom)
            Spacer()
        
            ZStack {
                if isCardPresented {
                    ForEach(cards) { card in
                        CardView(card: card)
                            .offset(self.offset(for: card))
                            .padding(.horizontal, 35)
                            .zIndex(self.zIndex(for: card))
                            .transition(AnyTransition.slide.combined(with: .move(edge: .leading)).combined (with: .opacity))
                            .animation(self.transitionAnimation(for: card))
                            .gesture(
                                TapGesture()
                                    .onEnded({ _ in
                                        withAnimation(.easeOut(duration: 0.15).delay(0.1)) {
                                            self.isCardPressed.toggle()
                                            self.selectedCard = self.isCardPressed ? card : nil
                                        }
                                    })
                                    .exclusively(before: LongPressGesture(minimumDuration: 0.05)
                                        .sequenced(before: DragGesture())
                                        .updating(self.$dragState, body: { (value, state, transaction) in
                                            switch value {
                                            case .first(true):
                                                state = .pressing(index: self.index(for: card))
                                            case .second(true, let drag):
                                                state = .dragging(index: self.index(for: card), translation: drag?.translation ?? .zero)
                                            default:
                                                break
                                            }
                                            
                                        })
                                        .onEnded({ (value) in
                                            guard case .second(true, let drag?) = value else {
                                                return
                                            }
                                            // Rearrange the cards
                                            self.rearrangeCards(with: card, dragOffset: drag.translation)
                                        })
                                    )
                            )
                    }
                }
            }
            .onAppear {
                self.isCardPresented.toggle()
            }
            
            if isCardPressed {
                TransactionHistoryView(transactions: testTransactions)
                    .padding(.top, 10)
                    .transition(.move(edge: .bottom))
            }
                        
            Spacer()
        }
    }
    
    private func zIndex(for card: Card) -> Double {
        guard let cardIndex = index(for: card) else {
            return 0.0
        }
        
        // The default z-index of a card is set to a negative value of the card's index,
        // so that the first card will have the largest z-index.
        let defaultZIndex = -Double(cardIndex)
        
        // If it's the dragging card
        if let draggingIndex = dragState.index,
           cardIndex == draggingIndex {
            // we compute the new z-index based on the translation's height
            return defaultZIndex + Double(dragState.translation.height/Self.cardOffset)
        }
        
        // Otherwise, we return the default z-index
        return defaultZIndex
    }
    
    private func index(for card: Card) -> Int? {
        guard let index = cards.firstIndex(where: { $0.id == card.id }) else { return nil }
        return index
    }
    
    private func offset(for card: Card) -> CGSize {
        guard let cardIndex = index(for: card) else {
            return CGSize()
        }
        
        if isCardPressed {
            guard let selectedCard = self.selectedCard,
                  let selectedCardIndex = index(for: selectedCard) else {
                return .zero
            }
            
            if cardIndex >= selectedCardIndex {
                return .zero
            }
            
            let offset = CGSize(width: 0, height: 1400)
            return offset
        }
        
        // Handle dragging
        var pressedOffset = CGSize.zero
        var dragOffsetY: CGFloat = 0.0
        
        if let draggingIndex = dragState.index, cardIndex == draggingIndex {
            pressedOffset.height = dragState.isPressing ? -20 : 0
            
            switch dragState.translation.width {
            case let width where width < -10: pressedOffset.width = -20
            case let width where width > 10: pressedOffset.width = 20
            default: break
            }
            
            dragOffsetY = dragState.translation.height
        }
        return CGSize(width: 0 + pressedOffset.width, height: -50 * CGFloat(cardIndex) + pressedOffset.height + dragOffsetY)
    }
    
    private func rearrangeCards(with card: Card, dragOffset: CGSize) {
        guard let draggingCardIndex = index(for: card) else {
            return
        }
        
        var newIndex = draggingCardIndex + Int(-dragOffset.height / Self.cardOffset)
        newIndex = newIndex >= cards.count ? cards.count - 1 : newIndex
        newIndex = newIndex < 0 ? 0 : newIndex
        
        let removedCard = cards.remove(at: draggingCardIndex)
        cards.insert(removedCard, at: newIndex)
    }
    
    private func transitionAnimation(for card: Card) -> Animation {
        var delay = 0.0
        if let index = index(for: card) {
            delay = Double(cards.count - index) * 0.1
        }
        return Animation.spring(response: 0.1, dampingFraction: 0.8, blendDuration: 0.02).delay(delay)
    }
}
