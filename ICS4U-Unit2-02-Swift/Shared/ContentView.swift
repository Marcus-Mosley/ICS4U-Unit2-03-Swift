//
// ContentView.swift
// ICS4U-Unit2-02-Swift
//
// Created by Marcus A. Mosley on 2021-05-28
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAlert = false
    @State private var astack: MrCoxallStack = MrCoxallStack()
    @State private var anumber: String = ""
    @State private var text: String = ""
    @State private var tmp: Int = 0

    var body: some View {
        VStack {
            TextField("Enter a number: ", text: $anumber)
                .padding()
            Button("Enter", action: {
                if Int(anumber) != nil {
                    astack.push(Int(anumber)!)
                    text = "\nPushed \(anumber) to Stack"
                    text += "\nStack: \(astack.showStack())"
                    tmp = astack.pop()
                    text += "\nPopped \(String(tmp)) from Stack"
                    text += "\nStack: \(astack.showStack())"
                } else {
                    showingAlert = true
                }
            }).padding().alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"),
                      dismissButton: .default(Text("Got It!")))
            }
            Text("\(text)")
        }
    }
}

struct MrCoxallStack {
    var stackAsArray = [Int]()

    // Pushes an integer to the array
    mutating func push(_ pushNumber: Int) {
        stackAsArray.append(pushNumber)
    }

    // Pops an integer from the array
    mutating func pop() -> Int {
        let tmp: Int = stackAsArray[stackAsArray.count - 1]
        stackAsArray.removeLast()
        return tmp
    }

    // Outputs the array
    func showStack() -> String {
        var text: String = ""

        for count in 0..<stackAsArray.count {
            text += "\(String(stackAsArray[count])), "
        }
        return text
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
