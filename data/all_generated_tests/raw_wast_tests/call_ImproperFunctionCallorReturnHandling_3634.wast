;; Construct a series of nested function calls with mixed valid and invalid indices, observing if the WebAssembly implementation throws appropriate errors upon encountering an invalid index during any nested call's execution.

(assert_invalid
  (module
    (func $nested-call-1 (call 2))
    (func $nested-call-2 (call 3))
    (func $nested-call-3 (call 4))
    (func $valid-func)
  )
  "unknown function"
)