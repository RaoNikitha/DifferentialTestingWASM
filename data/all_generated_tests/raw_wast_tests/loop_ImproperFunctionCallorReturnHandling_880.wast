;; Create a WebAssembly module containing a `loop` instruction with a nested `call` to an invalid function index. This will test whether the improper function index checking is managed differently in the context extension and control stack management.

(assert_invalid
  (module
    (type $ft (func (result i32)))
    (func $myFunc (result i32) (i32.const 0))
    (func (loop (call 99)))
  )
  "unknown function"
)