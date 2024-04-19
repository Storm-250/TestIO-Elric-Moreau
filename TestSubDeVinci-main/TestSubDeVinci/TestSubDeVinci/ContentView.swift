//
//  ContentView.swift
//  TestSubDeVinci
//
//  Created by Guillaume on 16/04/2024.
//


import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
   // @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    @State var users: [User] = []
    var body: some View {
        VStack {
            Form{
                TextField("Pseudo", text: $viewModel.pseudo) {
                    
                }
                TextField("Mot de passe", text: $viewModel.password) {
                    
                }
            }
            Divider()
            Form{
                TextField("Pseudo", text: $viewModel.pseudo) {
                    
                }
                TextField("firstName", text: $viewModel.firstName) {
                    
                }
                TextField("familyName", text: $viewModel.familyName) {
                    
                }
                TextField("Mot de passe", text: $viewModel.password) {
                    
                }
            }
                
            
            List(users) { user in
                Text(user.pseudo ?? "Inconnu")
                    .swipeActions {
                        Button(role: .destructive, action: {
                                remove(user: user)
                            }, label: {
                                Image(systemName: "trash")
                            })
                    }
            }
            .background(.blue)
            
            Button("Save") {
                viewModel.saveUser (pseudo: "Albert",familyName :"John",firstName : "TED",  isAdmin: true, password: "TEST")
                actualize()
            }
            
            
            Spacer()
        }
        .onAppear() {
            actualize()
        }
        .padding()
    }
    
    func remove(user: User) {
        viewModel.deleteUser(user: user)
    }
    func actualize() {
        users = viewModel.getAllUsers()
    }
}

#Preview {
    ContentView()
}

