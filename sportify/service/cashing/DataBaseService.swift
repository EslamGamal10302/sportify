//
//  DataBaseService.swift
//  sportify
//
//  Created by Eslam gamal on 25/05/2023.
//

import Foundation
import UIKit
import CoreData

class DataBaseService:DataBaseServiceProtocol{
    let context: NSManagedObjectContext?
    static let getInstance=DataBaseService()
   private init() {
       print("single object created")
       let appDelegate=UIApplication.shared.delegate as! AppDelegate
       context=appDelegate.persistentContainer.viewContext
    }
    func insert(data:StoredTeam,completion : @escaping (Bool)-> Void){
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TeamDetail")
        let predicate = NSPredicate(format: "teamId == %d", data.teamId)
        fetchRequest.predicate=predicate
        do{
            let existingTeams = try context?.fetch(fetchRequest)
            if existingTeams?.isEmpty ?? true {
                let entity=NSEntityDescription.entity(forEntityName: "TeamDetail", in: context!)
                let team=NSManagedObject(entity: entity!, insertInto: context)
                team.setValue(data.teamName, forKey: "teamName")
                team.setValue(data.teamImage, forKey: "teamImage")
                team.setValue(data.leagueId, forKey: "leagueId")
                team.setValue(data.teamId, forKey: "teamId")
                try  context?.save()
                print("added successfully")
                completion(true)
            }else{
                print("The item already exists")
                completion(false)
            }
            
            }catch{
                print("an error occured in add")
                completion(false)
            }
    }
    
    
    
    
    
    
    
    func delete(data:StoredTeam){
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TeamDetail")
        let predicate=NSPredicate(format: "teamId == %d",data.teamId)
        fetchRequest.predicate=predicate
        do {
            let teams=try context!.fetch(fetchRequest)
             context!.delete(teams[0])
             try context!.save()
             print("deletedSuccessfully")
        } catch {
            print("eroor in delete")
        }
   
    }
    func deleteAllTableItems(){
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TeamDetail")
        do {
            let teams=try context!.fetch(fetchRequest)
            print("hereeeeee")
            for item in teams {
                context!.delete(item)
                try context!.save()
                print("deletedSuccessfully")
            }
           
        } catch {
            print("eroor in delete all data")
        }
   
    }
    func getAllTeams(completion : @escaping ([StoredTeam]?)-> Void){
        var retrievedArray=[StoredTeam]()
        let fetchRequest=NSFetchRequest<NSManagedObject>(entityName: "TeamDetail")
        do{
            let teams=try context!.fetch(fetchRequest)
            for team in teams {
                var teamsaved=StoredTeam()
                teamsaved.teamId=team.value(forKey: "teamId") as! Int
                teamsaved.teamName=team.value(forKey: "teamName") as! String
                teamsaved.leagueId=team.value(forKey: "leagueId") as! Int
                teamsaved.teamImage=team.value(forKey: "teamImage")as! String
                retrievedArray.append(teamsaved)
                print(teamsaved.teamName)
            }
            print(retrievedArray.count)
            // if empty will return []
            print("data retrived succsessfully")
          //  print(retrievedArray)
            completion(retrievedArray)
        }catch{
            print("error")
            completion(nil)
            
        }
    }
    
}
