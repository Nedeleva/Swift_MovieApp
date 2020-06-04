//
//  MovieNotesTableViewController.swift
//  Films
//
//  Created by Делитель нуля on 6/4/20.
//  Copyright © 2020 Делитель нуля. All rights reserved.
//

import UIKit
import CoreData

class MovieNotesTableViewController: UITableViewController {
    
    var tasks: [Task] = []

    @IBAction func saveTask(_ sender: UIBarButtonItem) {
       let alertController = UIAlertController(title: "New Task", message: "Please add a new task", preferredStyle: .alert)
                let saveAction = UIAlertAction(title: "Save", style: .default) { action in
                    let tf = alertController.textFields?.first
                    if let newTaskTitle = tf?.text {
                        self.saveTask(withTitle: newTaskTitle)
                        self.tableView.reloadData()
                    }
                }
                
                alertController.addTextField { _ in }
                let cancelAction = UIAlertAction(title: "Cancel", style: .default) { _ in }
                
                alertController.addAction(saveAction)
                alertController.addAction(cancelAction)
                
                present(alertController, animated: true, completion: nil)
            }
            
            private func saveTask(withTitle title: String) {
                let context = getContext()
                
                guard let entity = NSEntityDescription.entity(forEntityName: "Task", in: context) else { return }
                
                let taskObject = Task(entity: entity, insertInto: context)
                taskObject.title = title
                
                do {
                    try context.save()
                    tasks.append(taskObject)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
            private func getContext() -> NSManagedObjectContext {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                return appDelegate.persistentContainer.viewContext
            }
            
            override func viewWillAppear(_ animated: Bool) {
                super.viewWillAppear(animated)
                
                let context = getContext()
                let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
                let sortDescriptor = NSSortDescriptor(key: "title", ascending: false)
                fetchRequest.sortDescriptors = [sortDescriptor]
                
                do {
                    tasks = try context.fetch(fetchRequest)
                } catch let error as NSError {
                    print(error.localizedDescription)
                }
            }
            
            override func viewDidLoad() {
                super.viewDidLoad()
                
        //        let context = getContext()
        //        let fetchRequest: NSFetchRequest<Task> = Task.fetchRequest()
        //        if let objects = try? context.fetch(fetchRequest) {
        //            for object in objects {
        //                context.delete(object)
        //            }
        //        }
        //
        //        do {
        //            try context.save()
        //        } catch let error as NSError {
        //            print(error.localizedDescription)
        //        }
            }
            
            // MARK: - Table view data source
            
            override func numberOfSections(in tableView: UITableView) -> Int {
                // #warning Incomplete implementation, return the number of sections
                return 1
            }
            
            override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                // #warning Incomplete implementation, return the number of rows
                return tasks.count
            }
            
            override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
                
                let task = tasks[indexPath.row]
                cell.textLabel?.text = task.title
                
                return cell
            }

             override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
                 let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
                 if editingStyle == .delete{
                     self.tableView.setEditing(true, animated: true)
                     context.delete(tasks[indexPath.row])
                   (UIApplication.shared.delegate as! AppDelegate).saveContext()
                     do {
                         tasks = try context.fetch(Task.fetchRequest())
                     }catch let error as NSError {
                         print("error")
                     }
                     tableView.reloadData()
                 }
                 
             }
        }
