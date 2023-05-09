//
//  HomeViewController.swift
//  GO-SOPT-iOS
//
//  Created by KJ on 2023/05/03.
//

import UIKit

import SnapKit
import Then

final class HomeViewController: BaseViewController {
    
    private typealias SectionType = Section
    
    private enum Section: CaseIterable {
        case poster
        case content
        case live
        case advertising
    }
    
    // MARK: - UI Components
    
    private lazy var homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: self.setSectionLayout())
    var movieModel: [MovieModel] = MovieModel.moviedummyData()
    private var tvingContentModel: [TvingContentModel] = TvingContentModel.tvingContentdummyData()

    // MARK: - Properties

    // MARK: - Initializer
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setDelegate()
        setRegister()
    }
}

extension HomeViewController {
    
    // MARK: - UI Components Property
    
    private func setUI() {
        
        view.backgroundColor = .clear
        
        homeCollectionView.do {
            $0.showsVerticalScrollIndicator = true
            $0.showsHorizontalScrollIndicator = false
            $0.isScrollEnabled = true
            $0.backgroundColor = .clear
            $0.clipsToBounds = true
            $0.contentInsetAdjustmentBehavior = .never
            $0.collectionViewLayout = self.setSectionLayout()
        }
    }
    
    // MARK: - Layout Helper
    
    private func setLayout() {
        view.addSubviews(homeCollectionView)
        
        homeCollectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    // MARK: - Methods
    
    private func setDelegate() {
        homeCollectionView.delegate = self
        homeCollectionView.dataSource = self
    }
    
    private func setRegister() {
        homeCollectionView.registerCell(MovieCollectionViewCell.self)
        homeCollectionView.registerCell(TvingContentCollectionViewCell.self)
        homeCollectionView.register(GalleryCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "GalleryCollectionReusableView")
    }
    
    private func setSectionLayout() -> UICollectionViewLayout {
        return UICollectionViewCompositionalLayout { section, env -> NSCollectionLayoutSection? in
//            let sectionType = Section.allCases[section]
            switch section {
            case 0:
                return self.getLayoutPosterSection()
            case 1, 3:
                return self.getLayoutContentSection()
            case 2:
                return self.getLayoutLiveSection()
            case 4:
                return self.getLayoutAdvertisingSection()
            default:
                let itemFractionalWidthFraction = 1.0 / 5.0
                let groupFractionalHeightFraction = 1.0 / 4.0
                let itemInset: CGFloat = 0
                
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(itemFractionalWidthFraction),
                    heightDimension: .fractionalHeight(1)
                )
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                
                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(groupFractionalHeightFraction)
                )
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = NSDirectionalEdgeInsets(top: itemInset, leading: itemInset, bottom: itemInset, trailing: itemInset)
                return section
            }
        }
    }
    
    private func getLayoutPosterSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(600)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .paging
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private func getLayoutContentSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.6),
            heightDimension: .absolute(170)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10)
        
        return section
    }
    
    private func getLayoutLiveSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.5),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 7, bottom: 0, trailing: 7)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.9),
            heightDimension: .absolute(80)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.contentInsets = NSDirectionalEdgeInsets(top: 14, leading: 10, bottom: 0, trailing: 10)
        return section
    }
    
    private func getLayoutAdvertisingSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .fractionalHeight(1.0)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(56)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 103, trailing: 0)
        return section
    }
    
    // MARK: - @objc Methods
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return movieModel.count
        case 1, 3:
            return tvingContentModel.count
        case 2:
            return movieModel.count
        case 4:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
        case 0:
            let cell = collectionView.dequeueCell(type: MovieCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        case 1, 3:
            let cell = collectionView.dequeueCell(type: TvingContentCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: tvingContentModel[indexPath.row])
            return cell
        case 2:
            let cell = collectionView.dequeueCell(type: MovieCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        case 4:
            let cell = collectionView.dequeueCell(type: MovieCollectionViewCell.self, indexPath: indexPath)
            cell.setDataBind(model: movieModel[indexPath.row])
            return cell
        default:
            let cell = UICollectionViewCell()
            return cell
        }
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
}
