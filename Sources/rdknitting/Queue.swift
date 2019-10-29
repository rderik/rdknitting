struct Queue<T> {
    var clients = [T]()
    
    mutating func enqueue(_ client: T) {
        clients.append(client)
    }
    
    mutating func dequeue() -> T? {
        guard !clients.isEmpty else { return nil }
        return clients.removeFirst()
    }
    
    func peek() -> T? {
        guard !clients.isEmpty else { return nil }
        return clients[0]
    }

    func count() -> Int {
      return clients.count
    }
    
    func isEmpty() -> Bool {
        return clients.isEmpty
    }
}
