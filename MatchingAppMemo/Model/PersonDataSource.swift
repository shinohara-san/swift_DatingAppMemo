//
//  PersonDataSource.swift
//  MatchingAppMemo
//
//  Created by Yuki Shinohara on 2020/07/22.
//  Copyright © 2020 Yuki Shinohara. All rights reserved.
//

import Foundation
import RealmSwift

class PersonDataSource {
    var allPeople = [Person]()
    
    func getData(reload tableView: UITableView){
        let realm = try! Realm()
        let data = realm.objects(Person.self)
        allPeople = Array(data)
        DispatchQueue.main.async {
            tableView.reloadData()
        }
    }
    
    func saveData(of newMatch: Person){
        let realm = try! Realm()
        try! realm.write {
            realm.add(newMatch)
        }
    }
    
    func count() -> Int{
        return allPeople.count
    }
    
    func data(at index: Int)-> Person?{
        if allPeople.count > index {
            return allPeople[index]
        }
        return nil
    }
    
    func delete(at index: Int, tableView: UITableView){
        let realm = try! Realm()
        let people = realm.objects(Person.self)
        let person = people[index]
        guard let index = allPeople.firstIndex(of: person) else { return }
         
         try! realm.write({
             allPeople.remove(at: index)
             realm.delete(person)
         })
        
        tableView.reloadData()
    }
    
    func printPath(){
        let realm = try! Realm()
        let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
        print(folderPath)
    }
}
