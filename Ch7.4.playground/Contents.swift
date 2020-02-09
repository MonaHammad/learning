import UIKit

// Can't be used as a type

struct Folder {}
struct Clee {}

protocol Listable {
    associatedtype FileType
    func getFileType() -> String
}

class FolderCell: Listable {
    typealias FileType = Folder
    func getFileType() -> String {
        return "FolderCell with \(FileType.self) type"
    }
}
print(FolderCell().getFileType())

//let cell: Listable = FolderCell()
class AnyCell<T>: Listable {
    typealias FileType = T
    private let _getFileType: () -> String
    
    init<U: Listable>(_ enterAnyCell: U) where U.FileType == T  {
        _getFileType = enterAnyCell.getFileType
    }
    
    func getFileType() -> String {
        return _getFileType()
    }
}

