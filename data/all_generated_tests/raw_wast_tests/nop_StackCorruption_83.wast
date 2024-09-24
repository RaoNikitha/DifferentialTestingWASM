;; 4. Implementing a series of nested function calls, each containing `nop` instructions, to ensure that the call stack and return addresses are preserved correctly, identifying any stack corruption between function boundaries.

(assert_invalid
  (module
    (func $inner (nop) (nop) (nop))
    (func $middle (call $inner) (nop) (call $inner))
    (func $outer (call $middle) (nop) (call $middle))
  )
  "type mismatch"
)