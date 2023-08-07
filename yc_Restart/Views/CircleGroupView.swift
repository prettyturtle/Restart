//
//  CircleGroupView.swift
//  yc_Restart
//
//  Created by yc on 2023/08/06.
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOpacity),
                    lineWidth: 40
                )
                .frame(width: 260, height: 260)
            
            Circle()
                .stroke(
                    ShapeColor.opacity(ShapeOpacity),
                    lineWidth: 80
                )
                .frame(width: 260, height: 260)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        .animation(.easeInOut(duration: 1), value: isAnimating)
        .onAppear {
            isAnimating = true
        }
    }
}

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
