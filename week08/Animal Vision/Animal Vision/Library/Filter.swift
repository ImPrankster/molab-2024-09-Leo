//
//  Filter.swift
//  Animal Vision
//
//  Created by Ruofan Wang on 2024/10/30.
//

import CoreImage
import CoreImage.CIFilterBuiltins

class AnimalVisionFilters {
    
    func applyDogVisionFilter(image: CIImage) -> CIImage? {
        let colorMatrix = CIFilter.colorMatrix()
        colorMatrix.inputImage = image
        
        // Reduce red sensitivity, enhance blues
        colorMatrix.rVector = CIVector(x: 0.3, y: 0.0, z: 0.0, w: 0)
        colorMatrix.gVector = CIVector(x: 0.4, y: 0.0, z: 0.0, w: 0)
        colorMatrix.bVector = CIVector(x: 0.3, y: 0.03, z: 1.0, w: 0)
        colorMatrix.aVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        colorMatrix.biasVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 0.0)
        
        return colorMatrix.outputImage
    }
    
    func applyCatVisionFilter(image: CIImage) -> CIImage? {
        let saturation = CIFilter.colorControls()
        
        saturation.inputImage = image
        saturation.setValue(0.4, forKey: kCIInputSaturationKey) // Reduce saturation
        saturation.setValue(1.1, forKey: kCIInputContrastKey)   // Slightly increase contrast
        saturation.setValue(0.0, forKey: kCIInputBrightnessKey)
        
        // Add slight blur to simulate lower visual acuity
        let blur = CIFilter.gaussianBlur()
        blur.setValue(saturation.outputImage, forKey: kCIInputImageKey)
        blur.setValue(1.0, forKey: kCIInputRadiusKey)
        
        return blur.outputImage
    }
    
    func applyFishVisionFilter(image: CIImage) -> CIImage? {
        // Create fish eye distortion effect
        let fishEye = CIFilter.bumpDistortion()
        
        fishEye.inputImage = image
        fishEye.center = CGPoint(x: image.extent.midX, y: image.extent.midY)
        fishEye.radius = 1000
        fishEye.scale = 2
        
        // Add slight color adjustment for underwater effect
        let colorMatrix = CIFilter.colorMatrix()
        colorMatrix.inputImage = fishEye.outputImage
        
        // Matrix values to add slight blue tint
        colorMatrix.rVector = CIVector(x: 0.8, y: 0.0, z: 0.0, w: 0.0)
        colorMatrix.gVector = CIVector(x: 0.0, y: 0.9, z: 0.0, w: 0.0)
        colorMatrix.bVector = CIVector(x: 0.0, y: 0.0, z: 1.2, w: 0.0)
        colorMatrix.aVector = CIVector(x: 0.0, y: 0.0, z: 0.0, w: 1.0)
        colorMatrix.biasVector = CIVector(x: 0.0, y: 0.0, z: 0.1, w: 0.0)
        
        return colorMatrix.outputImage
    }
}
