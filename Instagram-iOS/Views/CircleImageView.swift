//
//  CircleImageView.swift
//  Instagram-iOS
//
//  Created by Mattia Fasoli on 21/04/21.
//

import SwiftUI

struct CircleImageView: View {
    
    let uiImage: UIImage
    let size: CGFloat
    
    var body: some View {
        Image(uiImage: uiImage)
            .resizable()
            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            .frame(width: size, height: size)
            .clipped()
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
    }
}

struct CircleImageView_Previews: PreviewProvider {
    static var previews: some View {
        CircleImageView(uiImage: #imageLiteral(resourceName: "author2"), size: 60)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
