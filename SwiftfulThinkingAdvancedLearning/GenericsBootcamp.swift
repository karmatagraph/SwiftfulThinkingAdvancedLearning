//
//  GenericsBootcamp.swift
//  SwiftfulThinkingAdvancedLearning
//
//  Created by karma on 6/30/22.
//

import SwiftUI

struct StringModel {
    let info: String?
    
    func removeInfo() -> StringModel {
        StringModel(info: nil)
    }
}

struct GenericModel<T> {
    let info: T?
    func removeInfo() -> GenericModel {
        GenericModel(info: nil )
    }
}

class GenericViewModel: ObservableObject {
    
    @Published var stringModel = StringModel(info: "hello world")
    
    @Published var genericStringModel = GenericModel(info: "hello world ")
    @Published var genericBoolModel = GenericModel(info: true)
    
    
    func removeData() {
        stringModel = stringModel.removeInfo()
        genericBoolModel = genericBoolModel.removeInfo()
        genericStringModel = genericStringModel.removeInfo()
    }
    
}

struct GenericView<T: View>: View {
    let content: T
    let title: String
    
    var body: some View {
        VStack {
            Text("hola mi gente")
            content
        }
    }
}

struct GenericsBootcamp: View {
    @StateObject private var vm = GenericViewModel()
    var body: some View {
        VStack{
            GenericView(content: Text("custom content"), title: "newView")
            Text(vm.stringModel.info ?? "no Data")
        }
        .onTapGesture {
            vm.removeData()
        }
    }
}

struct GenericsBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        GenericsBootcamp()
    }
}
