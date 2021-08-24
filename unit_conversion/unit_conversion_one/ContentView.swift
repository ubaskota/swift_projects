//
//  ContentView.swift
//  unit_conversion_one
//
//  Created by Ujjwal Baskota on 6/3/21.
//

import SwiftUI

struct ContentView: View {
	
	let allFields = ["Temperature", "Length", "Time", "Volume"]
	let temp_units = ["Celsius", "Fahrenheit", "Kelvin"]
	let length_units = ["meters", "Kilometers","Miles"]
	let time_units = ["seconds", "minutes", "hours"]
	let volume_units = ["milliliters", "liters", "gallons"]
//	let temperature = ["1", "2"]
	
	// temperature
	@State private var currentField = "Temperature"
	@State private var currentTempUnit = "Celsius"
	
	@State private var inKelvin = ""
	@State private var inCelsius = ""
	@State private var inFahrenheit = ""
	
	
	func celsius_to_kelvin(temperature: Double) -> Double {
		return temperature + 273.15
	}
	
	func celsius_to_fahrenheit(temperature: Double) -> Double {
		let fahrenheit = Double((temperature * 1.80) + 32)
		return fahrenheit
	}
	
	func fahrenheit_to_kelvin(temperature: Double) -> Double {
		let kelvin = Double((temperature + 459.67) * 0.555555)
		return kelvin
	}
	
	func fahrenheit_to_celsius(temperature: Double) -> Double {
		let celsius = Double((temperature - 32) * 0.555555)
		return celsius
	}
	
	func kelvin_to_celsius(temperature: Double) -> Double {
		return temperature - 273.15
	}
	
	func kelvin_to_fahrenheit(temperature: Double) -> Double {
		let fahrenheit = Double(((temperature - 273.15) * 1.8) + 32)
		return fahrenheit
	}
	
	var body: some View {
		
		NavigationView {
			Form {
				Section(header : Text("Choose the field of conversion.")) {
					Picker("Choose", selection : $currentField) {
						ForEach(allFields, id: \.self) { field in
							Text("\(field)")
						}
					}.pickerStyle(SegmentedPickerStyle())
				}
				
				if currentField == "Temperature" {
					
					Section(header : Text("Choose the unit to convert")) {
						Picker("Unit_choose", selection : $currentTempUnit) {
							ForEach(temp_units, id: \.self) { field in
								Text("\(field)")
							}
						}.pickerStyle(SegmentedPickerStyle())
					}
					
					if currentTempUnit == "Celsius" {
						
						Section (header : Text("Temperature in celsius")) {
							TextField("Celsius: Type here", text: $inCelsius)
								.keyboardType(.decimalPad)
						}
						
						Section (header : Text("Temperature in Kelvin")) {
							Text("\(celsius_to_kelvin(temperature: Double(inCelsius) ?? 0), specifier: "%.2f")")
						}
						
						Section (header : Text("Temperature in fahrenheit")) {
							Text("\(celsius_to_fahrenheit(temperature: Double(inCelsius) ?? 0), specifier: "%.2f")")
						}
					}
					
					if currentTempUnit == "Fahrenheit" {
						Section (header : Text("Temperature in fahrenheit")) {
							TextField("Fahrenheit: Type here", text: $inFahrenheit)
								.keyboardType(.decimalPad)
						}
						
						Section (header : Text("Temperature in Kelvin")) {
							Text("\(fahrenheit_to_kelvin(temperature: Double(inFahrenheit) ?? 0), specifier: "%.2f")")
						}
						
						Section (header : Text("Temperature in celsius")) {
							Text("\(fahrenheit_to_celsius(temperature: Double(inFahrenheit) ?? 0), specifier: "%.2f")")
						}
					}
					
					if currentTempUnit == "Kelvin" {
						Section (header : Text("Temperature in Kelvin")) {
							TextField("Kelvin: Type here", text: $inKelvin)
								.keyboardType(.decimalPad)
						}
						
						Section (header : Text("Temperature in fahrenheit")) {
							Text("\(kelvin_to_fahrenheit(temperature: Double(inKelvin) ?? 0), specifier: "%.2f")")
						}
						
						Section (header : Text("Temperature in celsius")) {
							Text("\(kelvin_to_celsius(temperature: Double(inKelvin) ?? 0), specifier: "%.2f")")
						}
					}
					
					
				}
				
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
