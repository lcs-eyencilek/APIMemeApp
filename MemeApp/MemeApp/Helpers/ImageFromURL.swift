//
//  ImageFromURL.swift
//  MemeApp
//
//  Created by Efe Yencilek on 2021-10-10.
//

import SwiftUI

extension String {
    
    func loadUIImage() -> UIImage {
        
        // String -> UIImage conversion
        do {
            // Try to convert string to url
            guard let url = URL(string: self) else {
                return UIImage()
            }
            
            // Convert url content to data
            let data = try Data(contentsOf: url)
            
            // Convert data to UIImage
            return UIImage(data: data) ?? UIImage()
        } catch {
            return UIImage()
        }
        
    }
}
