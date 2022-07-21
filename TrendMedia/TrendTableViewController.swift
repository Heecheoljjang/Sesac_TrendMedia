//
//  TrendTableViewController.swift
//  TrendMedia
//
//  Created by HeecheolYoon on 2022/07/21.
//

import UIKit

class TrendTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func tapMovieBtn(_ sender: UIButton) {
        
        // 영화버튼 클릭 > BucketlistTableViewController Present
        // 화면전환: 1. 스토리보드 파일 2. 스토리보드 내의 뷰컨트롤러 2.5  띄우는 방식 3. 화면 전환
        
        // 1.
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as? BucketlistTableViewController else { return }
        
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func tapDramaBtn(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as? BucketlistTableViewController else { return }
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBAction func tapBookBtn(_ sender: UIButton) {
        
        let sb = UIStoryboard(name: "Trend", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: BucketlistTableViewController.identifier) as? BucketlistTableViewController else { return }
        
        //네비게이션 임베드해서 네비게이션바 보여지게하기
        let nav = UINavigationController(rootViewController: vc)
        
        //풀스크린이 동작하지않음. vc에 스타일을 맞췄기때문
        nav.modalPresentationStyle = .fullScreen
        
        self.present(nav, animated: true, completion: nil)
        
    }
}
