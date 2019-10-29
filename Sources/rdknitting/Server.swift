import Foundation


class Server {

  public var clients: Queue<Client>
  var threadCounter: Int = 0
  var threads: Array<pthread_t> = Array<pthread_t>()

  init(numberOfClients: Int) {
    clients = Queue<Client>()
    for clientId in 1...numberOfClients {
      clients.enqueue(Client(id: clientId))
    }
  } 

  func createThread() {
    var myThread: pthread_t? = nil

    var threadParameter = ThreadParameter(threadIdentifier: ThreadIdentifier(id: "myThread-\(threadCounter)"), server: self)
    var pThreadParameter = UnsafeMutablePointer<ThreadParameter>.allocate(capacity:1)
    pThreadParameter.pointee = threadParameter
    let result = pthread_create(&myThread, nil, threadedFunction, pThreadParameter)

    if result != 0 {
      print("Error creating thread--")
      exit(EXIT_FAILURE)
    }
    threadCounter += 1
    threads.append(myThread!)
  }

  func start(numberOfThreads: Int = 1) {
    for _ in 1...numberOfThreads {
      createThread()
    }
    for thread in threads {
      pthread_join(thread,nil)
    }
  }

  func processClient(client: Client, thread: String) {
    print("Processing client: \(client) in Thread: \(thread)")
    sleep(1)
    print("Done processing client: \(client) in Thread: \(thread)")
  }
}

