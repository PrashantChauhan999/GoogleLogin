//
//  HomeVC.swift
//  demoProject
//
//  Created by prashant on 09/05/22.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class HomeVC: UIViewController {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var usernameLbl: UILabel!
    @IBOutlet var emailAddressLbl: UILabel!
    
    static func loadFromNib() -> HomeVC {
        HomeVC(nibName: "HomeVC", bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDesign()
        updateData()
    }
    
    func setDesign(){
        self.usernameLbl.font = AppFonts.nunitoSemiBold.withDefaultSize()
        self.emailAddressLbl.font = AppFonts.nunitoSemiBold.withDefaultSize()
    }
    
//MARK: - UIButton Action & Functions
    func updateData() {
        if let currentUser = Auth.auth().currentUser {
            usernameLbl.text = currentUser.displayName ?? ""
            emailAddressLbl.text = currentUser.email ?? ""
            
            if let profilePhoto = currentUser.photoURL {
                getData(from: profilePhoto) { [weak self] data, response, error in
                    if data != nil  {
                        DispatchQueue.main.async {
                            self?.profileImage.image = UIImage(data: data!)
                        }
                    }
                }
            } else {}
        }
    }
    
    func getData(from url: URL, completion: @escaping(Data?, URLResponse?, Error?)->()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    
}
