;; A test where an `if` instruction in a module calls a function defined in another module, which includes an `if` instruction, causing potential mismanagement when returning control back to the original module in complex branches.

(assert_invalid
  (module
    (import "other_mod" "other_func" (func $other_func (result i32)))
    (func $test_func
      (if (result i32) (call $other_func)
        (then (if (result i32) (i32.const 1) (then (i32.const 1)) (else (i32.const 0))))
        (else (if (result i32) (i32.const 0) (then (i32.const 0)) (else (i32.const 1))))
      )
    )
  )
  "type mismatch"
)