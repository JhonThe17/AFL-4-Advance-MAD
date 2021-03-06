//
//  AddView.swift
//  TodoList
//
//  Created by Jhon The on 27/5/22.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var todoviewmodel: TodoViewModel
    @State var textFieldText: String = ""
    @State var date : Date = Date()
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        ScrollView {
            VStack {
                TextField("Type something here...", text: $textFieldText)
                    .padding(.horizontal)
                    .frame(height:70)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                DatePicker("Deadline :", selection: $date)
                    .padding()
                
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(15)
        }
        .navigationTitle("Add to Your List 🖊")
        .alert(isPresented: $showAlert, content: getAlert)
    }
    
    func saveButtonPressed() {
        if textIsAppropriate(){
            let dateformat = DateFormatter()
            dateformat.dateStyle = .medium
            dateformat.timeStyle = .short
            
            todoviewmodel.addItem(title: textFieldText, date : dateformat.string(from: date))
            presentationMode.wrappedValue.dismiss()
        }
    }
    
    func textIsAppropriate() -> Bool {
        if textFieldText.count < 3 {
            alertTitle = "Item must be at least 3 characters !!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
    
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                AddView()
            }
        }
    }
}
