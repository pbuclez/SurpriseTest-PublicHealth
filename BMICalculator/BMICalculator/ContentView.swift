//
//  ContentView.swift
//  BMICalculator
//
//  Created by David Cormell on 23/02/2022.
//

import SwiftUI


struct ContentView: View {
    @State private var weight: String = ""
    @State private var height: String = ""
    @State private var bmi: String = ""
    @State private var bmiCatagory: String = ""
    @State var bmiCalculations = BMICalculations()

    var body: some View {
        VStack{
            Image("PublicHealth")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Form{
                TextField("Enter weight in kg: ",
                          text: $weight)
                TextField("Enter height in cm: ",
                          text: $height)
            }
            Form{
                Text("Your BMI is: \(bmi)" )
                Text("You are: \(bmiCatagory)")
                
            }
            Button("Calculate BMI", action: {
                if Double(weight) == nil || Double(height) == nil {
                    print("That is not an integer")
                    print("Please try again")
                } else {
                    bmi = String(bmiCalculations.calculateBMI(weight: Double(weight)!, height: Double(height)!))
                    bmiCatagory = bmiCalculations.lookUpBmiClassification(bmi: Double(bmi)!)
                }
                })
            
            
            
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(bmiCalculations: BMICalculations())
    }
}
