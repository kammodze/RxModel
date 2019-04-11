//
//  Single+Cache.swift
//  RxModel
//
//  Created by Grzegorz Sagadyn on 22/10/2018.
//

import RxSwift

extension Single {
    public func cached<T>(forType type: T, expiry: Expiry = .never) -> Single<E> {
        return asObservable().cached(forType: type, expiry: expiry).asSingle()
    }
    
    public func cached(forKey key: String, expiry: Expiry = .never) -> Single<E> {
        return asObservable().cached(forKey: key, expiry: expiry).asSingle()
    }
    
    public func cached<T, S: Storage>(on storage: S, forType type: T, expiry: Expiry = .never) -> Single<E> where S.Key == String {
        return asObservable().cached(on: storage, forType: type, expiry: expiry).asSingle()
    }
    
    public func cached<T: Storage>(on storage: T, forKey key: T.Key, expiry: Expiry = .never) -> Single<E> {
        return asObservable().cached(on: storage, forKey: key, expiry: expiry).asSingle()
    }
    
    public func removeCachedValue<T>(forType type: T) -> Single<E> {
        return asObservable().removeCachedValue(forType: type).asSingle()
    }
    
    public func removeCachedValue(forKey key: String) -> Single<E> {
        return asObservable().removeCachedValue(forKey: key).asSingle()
    }
    
    public func removeCachedValue<T, S: Storage>(from storage: S, forType type: T) -> Single<E> where S.Key == String {
        return asObservable().removeCachedValue(from: storage, forType: type).asSingle()
    }
    
    public func removeCachedValue<S: Storage>(from storage: S, forKey key: S.Key) -> Single<E> {
        return asObservable().removeCachedValue(from: storage, forKey: key).asSingle()
    }
}
