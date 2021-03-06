import RxSwift
import UIKit

class ReusableUIView: UIView {
    lazy var disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.internalInit()
    }
    
    required init() {
        super.init(frame: CGRect.zero)
        self.internalInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.internalInit()
    }
    
    private func internalInit() {
        self.styleUI()
        self.setupUI()
        self.makeConstraints()
        self.configUI()
        self.makeBindings()
    }
    
    func styleUI() {} // Setting up view specific properties 
    func makeConstraints() {} // Define auto-layout constraints
    func makeBindings() {} // Any view specifix Rx bindings
    func setupUI() {} // Add views to superView
    func configUI() {} // Config UI with Specific properties
}
