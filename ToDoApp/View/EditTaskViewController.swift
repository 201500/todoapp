//
//  EditTaskViewController.swift
//  ToDoApp
//
//  Created by Didar on 28.04.2022.
//

import UIKit

class EditTaskViewController: UIViewController {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBAction func saveButton(_ sender: Any){
        print("Saving task ...")
        
        let newTask = Task(name: name.text ?? "", time: datePicker.date)
        vm.editTask(task: self.task!, updatedTask: newTask){
            print("Task updated successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        print("Deleting task ...")
        vm.deleteTask(task: self.task!, taskIndex: self.index!) {
            print("Task deleted successfully")
            navigationController?.popViewController(animated: true)
        }
    }
    
    var task: Task?
    var index: Int?
    
    let vm = Todo.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if let myTask = self.task {
            name.text = myTask.name
            datePicker.date = myTask.time
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
