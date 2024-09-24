;; A test involving an `else` block that calls an imported function, and this imported function invokes a callback defined in the original module, which includes another `if` instruction affecting the control flow unexpectedly.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $callback
      (if (i32.const 1) (then (nop)) (else (nop)))
    )
    (func (result i32)
      (if (result i32) (i32.const 0)
        (then (i32.const 42))
        (else (call $imported_func) (call $callback))
      )
    )
  )
  "type mismatch"
)