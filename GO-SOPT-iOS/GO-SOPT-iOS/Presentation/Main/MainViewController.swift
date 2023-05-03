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
    private var dataVCs: [UIViewController] = []
    
    // MARK: - Properties
    
    var nowIndex: Int = 0 {
        didSet {
            bind(oldValue: oldValue, newValue: nowIndex)
        }
    }
    
    // MARK: - View Life Cycle
    
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
        nowIndex = 0
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
            $0.backgroundColor = .clear
            $0.registerCell(PageCollectionViewCell.self)
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
        view.addSubviews(tvingLogo, myPageButton, pageCollectionView)
        
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
        if let firstVC = dataVCs.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    private func setPageViewController() {
        dataVCs += [HomeViewController()]
        dataVCs += [RealTimeViewController()]
        dataVCs += [TVProgramViewController()]
        dataVCs += [MovieViewController()]
        dataVCs += [ParamountViewController()]
        dataVCs += [KidsViewController()]
    }
    
    private func bind(oldValue: Int, newValue: Int) {
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward : .reverse
        pageViewController.setViewControllers([dataVCs[nowIndex]], direction: direction, animated: true, completion: nil)
        pageCollectionView.selectItem(at: IndexPath(item: nowIndex, section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
    private func didTapCell(at indexPath: IndexPath) {
        nowIndex = indexPath.item
    }
    
    func labelWidthSize(index: Int) -> Int {
        let size = pageNameModel[index].list.size(
            withAttributes: [NSAttributedString.Key.font : UIFont.pretendard(.regular, size: 17)]).width
        return Int(size)
    }
    
    private func cellUnderLineSetting(cell: PageCollectionViewCell?, indexPath: IndexPath, selected: Bool) {
        cell?.isSelected = selected
        cell?.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
        if selected {
            cell?.pageLabel.font = UIFont.pretendard(.bold, size: 18)
        } else {
            cell?.pageLabel.font = UIFont.pretendard(.regular, size: 17)
        }
    }
    
    private func pushToMyPage() {
        navigationController?.pushViewController(MyPageViewController(), animated: true)
    }
    
    // MARK: - @objc Methods
    
    @objc private func myPageButtonDidTapped() {
        pushToMyPage()
    }
}

// MARK: - UICollectionViewDataSource

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
        let currentVC = dataVCs[indexPath.row]
        let currentIndex = dataVCs.firstIndex(of: currentVC)!
        bind(oldValue: currentIndex, newValue: nowIndex)
        didTapCell(at: indexPath)
        
        let cell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? PageCollectionViewCell
        cellUnderLineSetting(cell: cell, indexPath: indexPath, selected: false)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if let myCell = cell as? PageCollectionViewCell {
            myCell.underlineView.isHidden = !myCell.isSelected
            myCell.setUnderLineWidth(size: labelWidthSize(index: indexPath.row))
        }
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = labelWidthSize(index: indexPath.row)
        let height = 41
        return CGSize(width: width + 30, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - UIPageViewControllerDelegate

extension MainViewController: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = dataVCs.firstIndex(of: currentVC) else { return }
        nowIndex = currentIndex
        print(currentIndex)
    }
}

// MARK: - UIPAgeViewControllerDataSource

extension MainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataVCs.firstIndex(of: viewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return dataVCs[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataVCs.firstIndex(of: viewController) else { return nil }
        let nextIndex = index + 1
        if nextIndex == dataVCs.count {
            return nil
        }
        return dataVCs[nextIndex]
    }
}
