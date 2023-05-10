//
//  NewViewController.swift
//  LearningSwift
//
//  Created by Thangam on 05/05/23.
//

import UIKit

class NewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var animals = ["Cat","Dog","Lion","Tiger","Beer","Zebra","Elephant","Cow","Deer"]

    @IBOutlet weak var animalTableView: UITableView!
    
    struct Names {
        var image : String
        var name : String
    }
    var apiDatas = [ToDo]()
    
    let data: [Names] = [
    Names(image: "image1", name: "Image1"),
    Names(image: "image2", name: "Image2"),
    Names(image: "image3", name: "Image3"),
    Names(image: "image4", name: "Image4"),
    Names(image: "image5", name: "Image5"),
    Names(image: "image6", name: "Image6")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchApi {
            self.animalTableView.reloadData()
            print("Success")
        }
        postData()
        animalTableView.delegate = self
        animalTableView.dataSource = self
    }
    
    func fetchApi(completed: @escaping () -> ()) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        URLSession.shared.dataTask(with: url!) { data, response, error in
            if error == nil {
                do {
                    self.apiDatas = try JSONDecoder().decode([ToDo].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                    
                } catch {
                    print("Error")
                }
            }
        }.resume()
    }
    
    func postData() {
        // Prepare URL
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos")
        guard let requestUrl = url else { fatalError() }

        // Prepare URL Request Object
        var request = URLRequest(url: requestUrl)
        request.httpMethod = "POST"
         
        // HTTP Request Parameters which will be sent in HTTP Request Body
        let postString = "userId=301&title=My task&completed=false";

        // Set HTTP Request Body
        request.httpBody = postString.data(using: String.Encoding.utf8);

        // Perform HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                // Check for Error
                if let error = error {
                    print("Error took place \(error)")
                    return
                }
         
                // Convert HTTP Response Data to a String
                if let data = data, let dataString = String(data: data, encoding: .utf8) {
                    print("Response data string:\n \(dataString)")
                }
        }
        task.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apiDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let values = data[indexPath.row]
        let apiValues = apiDatas[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
//        let cell = animalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
        cell.textLabel?.text = apiValues.title
//        cell.imageView?.image = UIImage(named: values.image)
//        cell.textLabel?.text = data[indexPath.row]
//        cell.textLabel?.textAlignment = .center
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected \(data[indexPath.row].name)")
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
//extension NewViewController : UITableViewDelegate, UITableViewDataSource {
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return animals.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = animalTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customTableViewCell
//        cell.textLabel?.text = animals[indexPath.row]
//        cell.textLabel?.textAlignment = .center
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You selected \(animals[indexPath.row])")
//    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 100
//    }
//}
