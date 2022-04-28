//
//  Todo.swift
//  ToDoApp
//
//  Created by Didar on 28.04.2022.
//

import Foundation
import RealmSwift

class Todo: NSObject {
    
    static var sharedInstance = Todo()
     
    var tasks = [Task]()
    
    typealias completionHandler = () -> Void
    
    let realm = try! Realm()
    
    func addTask(task: Task, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.add(task)
        
        try! self.realm.commitWrite()
        
        print("Task saved!")
        
        completion()
    }
    
    func editTask(task: Task, updatedTask: Task, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.delete(task)
        self.realm.add(updatedTask)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
    func deleteTask(task: Task, taskIndex: Int, completion: completionHandler) {
        
        self.realm.beginWrite()
        
        self.realm.delete(task)
        
        try! self.realm.commitWrite()
        
        tasks.remove(at: taskIndex)
        
        completion()
    }
    
    func loadTasks(completion: completionHandler) {
        
        self.realm.beginWrite()
        
        let savedTasks = self.realm.objects(Task.self)
        self.tasks.removeAll()
        self.tasks.append(contentsOf: savedTasks)
        
        try! self.realm.commitWrite()
        
        completion()
    }
    
}
