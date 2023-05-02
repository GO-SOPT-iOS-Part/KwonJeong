//
//  HomeViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/04/30.
//

import UIKit

import SnapKit
import Then

final class MainViewController: BaseViewController {
    
    // MARK: - UI Components
    
    var currentPage: Int = 0 {
        didSet {
            bind(oldValue: oldValue, newValue: currentPage)
        }
    }
    
    private let tvingLogo = UIImageView()
    private let myPageButton = UIButton()
    private let pageCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return collectionView
    }()
    private var pageNameModel: [PageNameModel] = PageNameModel.pageNamedummyData()
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        return vc
    }()
    private var dataViewControllers: [UIViewController] = []
    
    // MARK: - Properties
    
    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        currentPage = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setAddTarget()
        setDelegate()
        setViewControllersInPageVC()
        setPageViewController()
    }
}

extension MainViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        tvingLogo.do {
            $0.image = Image.tvingLogo
        }
    
        myPageButton.do {
            $0.setImage(Image.profileImage, for: .normal)
            $0.layer.cornerRadius = 15
            $0.clipsToBounds = true
        }
        
        pageCollectionView.do {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.isScrollEnabled = true
            $0.showsHorizontalScrollIndicator = false
            $0.backgroundColor = .systemGray
            $0.registerCell(PageCollectionViewCell.self)
        }
        
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        view.addSubviews(tvingLogo, myPageButton, pageCollectionView)
//        view.addSubview(pageCollectionView)
        
        tvingLogo.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(14)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(11)
            $0.width.equalTo(99)
            $0.height.equalTo(25)
        }
        
        myPageButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(11)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).inset(9)
            $0.width.height.equalTo(31)
        }
        
        pageCollectionView.snp.makeConstraints {
            $0.top.equalTo(tvingLogo.snp.bottom).offset(11)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(44)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.bottom.equalToSuperview()
        }

    }
    
    // MARK: - Methods
    
    private func setAddTarget() {
        myPageButton.addTarget(self, action: #selector(myPageButtonDidTapped), for: .touchUpInside)
    }
    
    private func setDelegate() {
        pageCollectionView.dataSource = self
        pageCollectionView.delegate = self
        
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    private func setViewControllersInPageVC() {
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setPageViewController() {
        
        dataViewControllers += [HomeViewController()]
        dataViewControllers += [RealTimeViewController()]
        dataViewControllers += [TVProgramViewController()]
        dataViewControllers += [MovieViewController()]
        dataViewControllers += [ParamountViewController()]
        dataViewControllers += [KidsViewController()]
    }
    
    private func bind(oldValue: Int, newValue: Int) {
        
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([dataViewControllers[currentPage]], direction: direction, animated: true, completion: nil)
        
        pageCollectionView.selectItem(at: IndexPath(item: currentPage, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    func didTapCell(at indexPath: IndexPath) {
        currentPage = indexPath.item
    }
    
    private func pushToMyPage() {
        navigationController?.pushViewController(MyPageViewController(), animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func myPageButtonDidTapped() {
        pushToMyPage()
    }
}

extension MainViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pageNameModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(type: PageCollectionViewCell.self, indexPath: indexPath)
        cell.setDataBind(model: pageNameModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let nextVC = dataViewControllers[indexPath.row]
        let currentIndex = dataViewControllers.firstIndex(of: nextVC)!
        pageViewController.setViewControllers([nextVC], direction: currentIndex > currentPage ? .forward : .reverse, animated: true, completion: nil)
        print(currentIndex)
        
        let cell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell
        cell?.isSelected = true
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell
        cell?.isSelected = false
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let myCell = cell as? PageCollectionViewCell
        myCell?.underlineView.isHidden = !myCell!.isSelected
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: pageNameModel[indexPath.row].list.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.pretendard(.regular, size: 17)]).width + 30,
                      height: 41)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension MainViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = dataViewControllers.firstIndex(of: currentVC) else { return }
        currentPage = currentIndex
        print(currentIndex)
    }
}

extension MainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataViewControllers.count {
            return nil
        }
        return dataViewControllers[nextIndex]
    }
}
