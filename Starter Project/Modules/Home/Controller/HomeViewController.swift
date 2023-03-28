//
//  HomeViewController.swift
//  Starter Project
//
//  Created by MOHAMED ABD ELHAMED AHMED on 27/03/2023.
//

import UIKit

class HomeViewController: BaseWireFrame {
    
    @IBOutlet private var tableView: UITableView!{
        didSet {
            tableView.registerCellNib(cellClass: HomeTableViewCell.self)
        }
    }
    
    var PhotosAlbum = [PhotosAlbumElement]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        networkCall()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func networkCall() {
        showActivityIndicator()
        NetworkClient.networkClient.dataRequest(with: Constant.baseURl.url, objectType: [PhotosAlbumElement].self) { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let object):
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                    self.PhotosAlbum = object
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.hideActivityIndicator()
                    self.alertView(error: error.localizedDescription)
                }
            }
        }
    }
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.PhotosAlbum.count)
        return self.PhotosAlbum.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as? HomeTableViewCell  else { return UITableViewCell ()}
        if let photoURL = self.PhotosAlbum[indexPath.row].urls?.small {
            cell.setup(url: photoURL)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = AlbumDetailsViewController()
        if let photoURL = self.PhotosAlbum[indexPath.row].urls?.full {
            vc.photoUrl = photoURL
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
