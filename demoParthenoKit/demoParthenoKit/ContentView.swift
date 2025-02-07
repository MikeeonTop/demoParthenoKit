//
//  ContentView.swift
//  demoParthenoKit
//
//  Created by Michele Vassallo Todaro on 07/02/25.
//

import SwiftUI

struct ContentView: View {
    
    private let peopleService = PeopleService()
    
    @State var user: Person?
    @State var search: String = ""
    @State var error: String? = ""
    
    
    var body: some View {
        VStack {
            
            Text("ParthenoKit DEMO")
                .font(.title)
                .padding()
            Text("Come salvare e legere dati remoti utilizzando il framework ParthenoKit")
                .font(.headline)
                .padding()
                .foregroundColor(Color(.gray))
            
            Spacer()
            
            if let user{
                Text (user.firstName + " " + user.lastName)
                    .font(.title)
                    .foregroundColor(.green)
                    .padding(.vertical, 40)
                    .padding(.horizontal, 30)
                    .background (
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.white)
                            .cornerRadius(10)
                            .shadow(
                                color: Color.black.opacity(0.3), radius: 10,
                                x: 0.0, y: 10)
                    )
            }
                if let error {
                Text(error)
                        .font(.headline)
                        .foregroundColor(.red)
            }
            HStack (spacing: 10) {
                TextField("Cerca per id", text: $search)
                    .textFieldStyle(.roundedBorder)
                Button(action: {
                    searchPerson()
                }, label: {
                    Text("Cerca")
                })
                .buttonStyle(.borderedProminent)
            }
            .padding(.top, 200)
            .padding(.bottom, 20)
        }
        Button(action: {
            resetValues()
        }) {
            Text("Azzera valori")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.red)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
        Button(action: {
            fillValues()
        }) {
            Text("Inizializza valori")
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}

extension ContentView {
    private
    func resetValues(){
        peopleService.reset(id: "80")
        peopleService.reset(id: "81")
        peopleService.reset(id: "82")
        peopleService.reset(id: "83")
    }
    private func fillValues (){
        peopleService.setPerson(person: Person(id: "80", firstName: "Mario", lastName: "Rossi"))
        peopleService.setPerson(person: Person(id: "81", firstName: "Giuseppe", lastName: "Verdi"))
        peopleService.setPerson(person: Person(id: "82", firstName: "Alberto", lastName: "Bianchi"))
        peopleService.setPerson(person: Person(id: "83", firstName: "Luca", lastName: "Neri"))
    }
    private func searchPerson (){
        
        if let person = peopleService.getPerson(id: self.search) {
            self.user = person
            self.error = ""
        } else {
            self.error = "Persona non trovata"
            self.user = nil
        }
    }
}
#Preview {
    ContentView()
}
