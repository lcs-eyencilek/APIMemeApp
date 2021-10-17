//
//  CaptureView.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-16.
//

import SwiftUI

struct CaptureView: View {
    
    var captureMeme: Meme
    
    var CaptureScreen: some View  {
        Image(uiImage: captureMeme.url.loadUIImage())
    }
    
    var body: some View {
        CaptureScreen
        
        Button("Save to image") {
            let image = CaptureScreen.snapshot()
            
            UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
        }
    }
}

extension View {
    
}

//struct CaptureView_Previews: PreviewProvider {
//    static var previews: some View {
//        CaptureView()
//    }
//}
