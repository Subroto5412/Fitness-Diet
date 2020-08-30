//
//  FADDietPlanDataManager.swift
//  Fitness&Diet
//
//  Created by Subroto Mohonto on 17/7/20.
//  Copyright © 2020 Sumon Opu. All rights reserved.
//

import UIKit

class FADDietPlanDataManager: NSObject {

    private static var dataManager = FADDietPlanDataManager()
    
    class var shared:FADDietPlanDataManager{
        return dataManager
    }
    
    func getAllDietPlan()->[FADDietPlanModel]
    {
        var DietPlan = [FADDietPlanModel]()
        let dietPlan1 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. Basically, you have to avoid most sugars and starches. Whole grains like oatmeal don't even make the cut!", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "breakfast-WD-1.jpg")
        
        let dietPlan2 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. ", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "healthy-weight-gain-1.jpg")
        let dietPlan3 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. Basically, you have to avoid most sugars and starches. !", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "checkup-1.jpg")
        
        let dietPlan4 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. Basically, you have to avoid most sugars and starches. Whole grains like oatmeal don't even make the cut!", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "eat-well-wd-1.jpg")
        
        let dietPlan5 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. Basically, you have to avoid most sugars and starches. Whole grains like oatmeal don't even make the cut!", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "")
        
        let dietPlan6 = FADDietPlanModel.init(id: "1", title: "Keto Diet", subTitle: "It's a pretty exhaustive list, and probably includes some of your favorites: Bread, rice, pasta, fruit, corn, potatoes, beans, baked goods, sweets, juice, and beer all get the axe. Basically, you have to avoid most sugars and starches. Whole grains like oatmeal don't even make the cut!", details: "If you've recently thought about trying a new diet to shed some pounds, the keto diet is probably the first thing that's come to mind. The idea of maintaining ketosis has taken over the weight loss space ever since celebrities like Kourtney Kardashian and Halle Berry touted the keto diet in years past, pushing an extremely high-fat (and nearly zero-carb!) diet plan to the forefront of the discussion. Being curious about the keto diet is only natural, as there's very few other diets where copious amounts of bacon and cheese are on the menu.\n\nSimply listing the different ingredients you can and can't eat while working your way through the keto diet won't explain how exactly it works. The diet's main principle is maintaining ketosis, a metabolic state that pushes your body to burn fat for daily fuel rather than glucose sourced from carbohydrates. Originally designed to help patients fight epilepsy, the keto diet guides you into ketosis by eliminating a significant amount of food groups that you normally interact with everyday; mainly, items containing sugars and carbohydrates, as these don't allow your metabolism to use fat as a main energy source.",picture: "sleep-wd-1.jpg")
        
        DietPlan.append(contentsOf: [dietPlan1,dietPlan2,dietPlan3,dietPlan4,dietPlan5,dietPlan6])
        return DietPlan
    }
    
}
