//
//  Model.swift
//  ModelPickerApp
//
//  Created by Роман Исламов on 17.05.2023.
//

import UIKit
import RealityKit
import Combine

class Model {
    var modelName: String
    var image: UIImage
    var modelEntity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.modelName = modelName
        
        self.image = UIImage(named: modelName)!
        
        let filename = modelName + ".usdz"
        self.cancellable = ModelEntity.loadModelAsync(named: filename)
            .sink(receiveCompletion: {
                loadComletion in
            //Handle our Error
            print("DEBUG: UnABLE to load modelEntity for modelName: \(self.modelName)")
        }, receiveValue:
        { modelEntity in
            //Get our modelEntity
            self.modelEntity = modelEntity
            print("DEBUG: Successfully loaded modelEntity for modelName: \(self.modelName)")
        })
        
    }
}
