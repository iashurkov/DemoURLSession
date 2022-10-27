//
//  ServiceLocator.swift
//  DemoURLSession
//
//  Created by iashurkov on 27.10.2022.
//

import UIKit

protocol ServiceLocating: AnyObject {
    func register<T>(_ type: T.Type, _ factory: @escaping (ServiceLocating) -> T)
    func resolve<T>(_ type: T.Type) -> T?
}

/// Реализация SL.
/// Плюсы:
/// - Можно получить любую необходимую зависимость, скрывая детали создания.
/// - Избавляет от необходимости использовать сервисы-синглтоны..
/// - Удобство тестирования — можно подменить зависимости на моки.
/// Минусы:
/// - Является god-объектом, который знает слишком много и имеет доступ к любому объекту. А значит, все, кто имеет к нему доступ, получают те же возможности.
/// - Способствует созданию внутренних неявных зависимостей, что приводит к неявной связанности, которая приводит к неявной сложности.
/// - Ошибки в рантайме: если не зарезолвить зависимость, которая не регистрирована, то произойдет краш приложения.
/// - Не потокобезопасен.
final class ServiceLocator {
    
    // MARK: Private Properties
    
    private var factories: [String: Any] = [:]
    
    // MARK: Init
    
    init() {
        print("INIT : ✅ : ServiceLocator")
    }
    
    // MARK: Deinit
    
    deinit {
        print("DEINIT : ❌ : ServiceLocator")
    }
    
    // MARK: Private Methods
    
    private func typeName(_ some: Any) -> String {
        (some is Any.Type)
        ? "\(some)"
        : "\(type(of: some))"
    }
    
    private func _resolve<T, Arguments>(key: String, invoker: @escaping ((Arguments) -> T) -> Any) -> T? {
        guard
            let factory = self.factories[key],
            let factory = factory as? ((Arguments) -> T)
        else { return nil }
        
        return invoker(factory) as? T
    }
}

// MARK: - ServiceLocating

extension ServiceLocator: ServiceLocating {
    
    func register<T>(_ type: T.Type, _ factory: @escaping (ServiceLocating) -> T) {
        let key = self.typeName(T.self)
        assert(!self.factories.keys.contains(where: { $0 == key }))
        self.factories[key] = factory
    }
    
    func resolve<T>(_ type: T.Type) -> T? {
        let key = self.typeName(T.self)
        return self._resolve(key: key) { (factory: (ServiceLocating) -> T) in
            factory(self)
        }
    }
}
