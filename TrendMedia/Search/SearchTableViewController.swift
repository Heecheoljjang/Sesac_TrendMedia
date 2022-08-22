//
//  SearchTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/19.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var movieList = MovieInfo()

    
    //MARK: 생명주기
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "처음으로", style: .plain, target: self, action: #selector(resetBtnClicked))


    }
    override func viewWillAppear(_ animated: Bool) {
        print(#function)
    }
    override func viewDidAppear(_ animated: Bool) {
        print(#function)
    }
    /// 리셋버튼
    @objc func resetBtnClicked() {
        
        // iOS 13 이상, scenedelegate를 쓸 때 동작하는 코드
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene // 앱을 다시 처음부터 실행해주는 코드
        let sceneDelegate = windowScene?.delegate as? SceneDelegate // 신딜리게이트 클래스에 접근
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "StartViewController") as? StartViewController else { return }
        
        sceneDelegate?.window?.rootViewController = vc
        sceneDelegate?.window?.makeKeyAndVisible()
    }


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.movie.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identity, for: indexPath) as? SearchTableViewCell else { return UITableViewCell() }
        
        let data = movieList.movie[indexPath.row]
        
        cell.configureCell(data: data)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //return CGFloat(120)
        return UIScreen.main.bounds.height / 8
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(#function)
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        
        guard let vc = sb.instantiateViewController(withIdentifier: RecommandCollectionViewController.identity) as? RecommandCollectionViewController else { return }
        
        // 2. 값 전달 - vc가 가지고 있는 프로퍼티에 데이터 추가
        vc.movieData = movieList.movie[indexPath.row]
        
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
