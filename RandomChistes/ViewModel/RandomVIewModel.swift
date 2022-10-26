//
//  RandomVIewModel.swift
//  RandomChistes
//
//  Created by Brandon Alexis Martinez Cortes on 25/10/22.
//

import Foundation

class RandomViewModel: ObservableObject{
    
    @Published var getItem: RandomOutput?
    @Published var getItems = [RandomOutput]()

    @Published var viewList = true

    ///Valid number of items
    func getRandomItems(){
        self.viewList = false
        
        if getItems.isEmpty{
            getMoreItems()

        }else if getItems.count<=14{
            getMoreItems()

        }else{

        }


    }
    ///Get Item for services
    func getMoreItems(){
        WebService().Random(){result in
            switch result{
            case .success(let allItems): DispatchQueue.main.async {
                ///check same item
                let checkItem = self.getItems.contains(where: { $0.value == allItems.value})
                if checkItem{
                    ///same item
                    self.getRandomItems()

                }else{
                    ///No same item
                    self.getItem = allItems
                    self.getItems.append(allItems)
                    self.getRandomItems()
                }
        
            }
            case .failure(let error): print(error.localizedDescription)
                
                
            }
            
        }
    }
    
}
