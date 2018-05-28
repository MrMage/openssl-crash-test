import Foundation
import NIOOpenSSL

do {
    print("foo"); fflush(stdout)
    let x = try SSLContext(configuration: TLSConfiguration.forClient())
    print("bar"); fflush(stdout)
}
// bar2 will not be printed because the Segmentation Fault occurs before.
print("bar2"); fflush(stdout)

struct openssl_crash_test {
    var text = "Hello, World!"
}
