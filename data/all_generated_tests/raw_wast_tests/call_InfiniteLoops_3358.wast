;; 7. Create a scenario where multiple interdependent functions call each other in a loop. Inject an invalid function index at random intervals. WebAssembly should catch and prevent the loop, but `wizard_engine` may fall into infinite looping.

(assert_invalid
  (module
    (func $funcA (call $funcB))
    (func $funcB (call $funcC))
    (func $funcC (call $funcD))
    (func $funcD (call 100))
  )
  "invalid function index"
)