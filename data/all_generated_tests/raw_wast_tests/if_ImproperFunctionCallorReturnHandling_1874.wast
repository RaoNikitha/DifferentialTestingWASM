;; 5. Construct an `if` block where a function call is present that modifies the operand stack in ways that may affect the calling return point, thereby ensuring the control flow returns correctly.

(assert_invalid
  (module
    (func $differential-test
      (if (result i32) (i32.const 1)
        (then (call $modifying-function))
        (else (call $non_modifying_function))
      )
    )
    (func $modifying-function (result i32)
      ;; this function pops one more value than it pushes
      (drop)
      (i32.const 1)
    )
    (func $non_modifying_function
      ;; this function just pushes one value
      (i32.const 1)
    )
  )
  "type mismatch - incorrect stack balance in modifying function"
)