//
//  SignInVC.swift
//  demoProject
//
//  Created by prashant on 09/05/22.
//

import UIKit
import GoogleSignIn
import Firebase

class SignInVC: UIViewController {
    
    @IBOutlet weak var googleSignInBtn: GIDSignInButton!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        googleSignInBtn.addTarget(self, action: #selector(onGoogleLoginTap), for: .touchUpInside)
    }

    @objc func onGoogleLoginTap() {
        guard let clientID = FirebaseApp.app()?.options.clientID else {return}
        
        let config = GIDConfiguration(clientID:clientID)
        
        GIDSignIn.sharedInstance.signIn(with: config, presenting: self) {user, error in
            if let error = error {
                print("Error in Google Login\(error.localizedDescription)")
            }
            
            guard let authetication = user?.authentication, let idToken = authetication.idToken else {
                print("Error in getting Token")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken, accessToken: authetication.accessToken)
            
            Auth.auth().signIn(with:credential){ authReslt, error in
                if let error = error {
                    print("Error in firebase Auth\(error.localizedDescription)")
                    return
                }

                let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            
        }
    }

}
