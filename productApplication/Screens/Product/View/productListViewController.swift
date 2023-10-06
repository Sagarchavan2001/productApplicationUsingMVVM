//
//  productListViewController.swift
//  productApplication
//
//  Created by STC on 06/10/23.
//

import UIKit

class productListViewController: UIViewController {

    
    @IBOutlet weak var productListTableView: UITableView!
    
    
    private var productViewModel = productViewModal()
    override func viewDidLoad() {
        super.viewDidLoad()
        configration()
        productListTableView.delegate = self
        productListTableView.dataSource = self
        productListTableView.register(UINib(nibName: "productTableViewCell", bundle: nil), forCellReuseIdentifier: "productTableViewCell")
        }
    }
    
extension productListViewController{
    func configration(){
        initViewModal()
        observeEvent()
    }
    func initViewModal(){
        productViewModel.fechProducts()
    }
    //data binding
    func observeEvent(){
        productViewModel.eventHandler = {[weak self] event in
            guard let self else{
                return
            }
            switch event {
            case .loading : print("Product Loading....")
            case .stopLoading : print("Product Loaded....")
            case .dataLoaded :
              //  print("product.......\(self.productViewModel.products1)")
                DispatchQueue.main.async {
                    self.productListTableView.reloadData()
                }
            case .error(_error: let error) :
                print(error)
                
            }
            
        }
    }
}
extension productListViewController : UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        productViewModel.products1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = productListTableView.dequeueReusableCell(withIdentifier: "productTableViewCell", for: indexPath) as? productTableViewCell
        else{
            return UITableViewCell()
        }
        let product = productViewModel.products1[indexPath.row]
        cell.Product12 = product
        return cell
    }
    
    
}

