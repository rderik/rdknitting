class ThreadParameter {

  var threadIdentifier: ThreadIdentifier
  var server: Server

  init(threadIdentifier: ThreadIdentifier, server: Server) {
    self.threadIdentifier = threadIdentifier
    self.server = server
  }
}
