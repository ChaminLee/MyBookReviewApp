//
//  ViewController.swift
//  BookReviewApp
//
//  Created by 이차민 on 2020/12/10.
//

import UIKit
import Firebase


class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
    
    let identifier: String = "cellID"

    
    let headerColor = UIColor(hexString: "#117893")
    let navAppearance = UINavigationBarAppearance()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            
            vc?.modalPresentationStyle = .popover
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    public func randomColor() -> String {
        let colorList = ["#eaac9d","f0daa4","#117893", "#fd823e","4ec5a5"]
        let index = Int.random(in: 0..<colorList.count)
         
        return colorList[index]
    }
    
    // if you made collectionview programmatically, you can use collectionview just call "collectionView"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addTopTitle()
        addCollectionView()
        fetchJson()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // collectionView init
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
        addTopTitle()
//        view.backgroundColor = CustomColor().defaultBackgroundColor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    var sections = [Section]()
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        
        // CustomCell 크기
        let height = CGFloat(300)
        
        return CGSize(width: width, height: height)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! CustomCell
        
        cell.section = sections[indexPath.item]
        cell.collectionView.reloadData()
        
        return cell
    }
    
    
    // body ~ body 사이 간격
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(5)
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("sss : \(indexPath.row)")
        // move view
        
    }
    
    
    
    func fetchJson(){
        print("attempt to fetch Json")
        if let path = Bundle.main.path(forResource: "data", ofType: "json") {
            print(path)
            do {
                  let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                  let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? [ Any] {
                            // do stuff
                    jsonResult.forEach { (item) in
                      
                        let section = Section(dictionary: item as! [String : Any])
                       // print("FEtching",section.playlists)
                        self.sections.append(section)
                    }
                    
                 
                  self.collectionView.reloadData()
                  }
              } catch {
                   // handle error
              }
        }
    }
    
    @objc func didTapButton() {
        print("HHsdfHH")
    }

    
}
    
    
// Header View
extension ViewController  {
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView", for: indexPath) as! HeaderCollectionReusableView
        
        header.configure()
        header.backgroundColor = headerColor
        
        return header
    }
 
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 180)
    }
    
    // header ~ body
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 30, left: 50, bottom: 30, right: 50)
    }

    
}

class stretchHeaderFlowLayout: UICollectionViewFlowLayout {
    
    let idealCellWidth: CGFloat = 100
    let margin: CGFloat = 10
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder : NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
            
        let layoutAttributes = super.layoutAttributesForElements(in: rect)
        guard let offset = collectionView?.contentOffset.y, let stLayoutAttributes = layoutAttributes else {
            return layoutAttributes
        }
        if offset < 0 {
            
            for attributes in stLayoutAttributes {
                
                if let elmKind = attributes.representedElementKind, elmKind == UICollectionView.elementKindSectionHeader {
                    
                    let width = collectionView?.frame.width
                    let height = attributes.frame.height - offset
                    
                    attributes.frame = CGRect(x: 0, y: offset, width: width ?? 0, height: height)
                }
            }
        }
        return layoutAttributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
}

// collectionView 추가

extension ViewController {
    func addCollectionView() {
        
//        let layout = UICollectionViewFlowLayout()
        let flowLayout = stretchHeaderFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 200, width: self.view.frame.width, height: self.view.frame.height), collectionViewLayout: flowLayout)
        collectionView.backgroundColor = CustomColor().defaultBackgroundColor
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        collectionView.register(HeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderCollectionReusableView")
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: identifier)
        
        self.view.addSubview(collectionView)
    }
}

extension ViewController {
    
    func addTopTitle() {
        let label : UILabel = {
            let lb = UILabel()
            lb.text = "기억"
//            lb.font = UIFont(name: "Sweetheat-GOvoG", size: 20)
            lb.textColor = CustomColor().defaultBackgroundColor
            
            return lb
        }()
        
        self.navigationController?.navigationBar.backgroundColor = headerColor
        self.navigationController?.navigationBar.barTintColor = headerColor
        self.navigationController?.setStatusBar(backgroundColor: headerColor)
        
        self.navigationController?.navigationBar.topItem?.title = label.text
        
        self.navigationController?.navigationBar.isTranslucent = false
        
        
    }
}

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<16 | (Int)(g*255)<<8 | (Int)(b*255)<<0
        return String(format:"#%06x", rgb)
    }
}

extension UINavigationController {

    func setStatusBar(backgroundColor: UIColor) {
        let statusBarFrame: CGRect
        if #available(iOS 13.0, *) {
            statusBarFrame = view.window?.windowScene?.statusBarManager?.statusBarFrame ?? CGRect.zero
        } else {
            statusBarFrame = UIApplication.shared.statusBarFrame
        }
        let statusBarView = UIView(frame: statusBarFrame)
        statusBarView.backgroundColor = backgroundColor
        view.addSubview(statusBarView)
    }

}
