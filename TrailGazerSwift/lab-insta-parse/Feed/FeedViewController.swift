import UIKit
import CoreLocation
import ParseSwift


class FeedViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    private var posts = [Post]() {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        queryPosts()
    }

    private func queryPosts() {
         
        let yesterdayDate = Calendar.current.date(byAdding: .day, value: (-1), to: Date())!
        
        let query = Post.query()
            .include("user")
            .order([.descending("createdAt")])
            .where("createdAt" >= yesterdayDate) // <- Only include results created yesterday onwards
            .limit(10) // <- Limit max number of returned posts to 10

        query.find { [weak self] result in
            switch result {
            case .success(let posts):

                self?.posts = posts
            case .failure(let error):
                self?.showAlert(description: error.localizedDescription)
            }
        }



    }

    @IBAction func onLogOutTapped(_ sender: Any) {
        showConfirmLogoutAlert()
    }

    private func showConfirmLogoutAlert() {
        let alertController = UIAlertController(title: "Log out of your account?", message: nil, preferredStyle: .alert)
        let logOutAction = UIAlertAction(title: "Log out", style: .destructive) { _ in
            NotificationCenter.default.post(name: Notification.Name("logout"), object: nil)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        alertController.addAction(logOutAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }

    private func showAlert(description: String? = nil) {
        let alertController = UIAlertController(title: "Oops...", message: "\(description ?? "Please try again...")", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default)
        alertController.addAction(action)
        present(alertController, animated: true)
    }
    
    
    

}

extension FeedViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as? PostCell else {
            return UITableViewCell()
        }
        cell.configure(with: posts[indexPath.row])
        
        
        return cell
        
        
    }
}
    
    extension FeedViewController: UITableViewDelegate{
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let post = posts[indexPath.row]
            
        }
        
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let cell = sender as? UITableViewCell,
               let indexPath = tableView.indexPath(for: cell),
               let postDetailViewController = segue.destination as? PostDetailViewController {
                let post = posts[indexPath.row]
                postDetailViewController.post = post

                if let geoPoint = post.location {
                    let location = CLLocation(latitude: geoPoint.latitude, longitude: geoPoint.longitude)
                    postDetailViewController.location = location
                }
            }
        }

        
    }


