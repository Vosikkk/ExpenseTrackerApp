//
//  LockView.swift
//  ExpenseTrackerApp
//
//  Created by Саша Восколович on 13.02.2024.
//

import SwiftUI

struct LockView<Content: View>: View {
    
    /// Lock Properties
    var lockType: LockType
    var lockPin: String
    var isEnabled: Bool
    var lockWhenAppGoesBackground: Bool = true
    
    @ViewBuilder var content: Content
    
    /// View Properties
    @State private var pin: String = ""
    
    
    var body: some View {
        GeometryReader {
            let size = $0.size
            
            content
                .frame(width: size.width, height: size.height)
            
            if isEnabled {
                Rectangle()
                
                ZStack {
                    if lockType == .both || lockType == .biometric {
                        
                    } else {
                        /// Custom Number Pad to type View Lock Pin
                        NumberPadPinView()
                    }
                }
                .ignoresSafeArea()
            }
        }
    }
    
    /// Numberpad Pin View
    @ViewBuilder
    func NumberPadPinView() -> some View {
        VStack(spacing: 15) {
            Text("Enter Pin")
                .font(.title.bold())
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 10) {
                ForEach(0..<4, id: \.self) { index in
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: 50, height: 55)
                }
            }
            .frame(maxHeight: .infinity)
            
            /// Custom Number Pin
        }
        .padding()
        .environment(\.colorScheme, .dark)
    }
    
    /// Lock Type
    enum LockType: String {
        case biometric = "Bio Metric Auth"
        case number = "Custom Number Lock"
        case both = "First preference will be biometric, and if it's not available, it will go for number lock."
    }
}

//#Preview {
//    LockView()
//}
