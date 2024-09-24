;; A test where an `if-else` condition within a block uses `br` to exit based on a condition, ensuring the else's final instructions are correctly executed if the condition is false. This checks label and stack management in conditional branching.

(assert_invalid
  (module (func $conditional-br-block (result i32)
    (block (result i32)
      (i32.const 1)
      (if (result i32)
        (then
          (br 0 (i32.const 2))
        )
        (else
          (i32.const 3)
        )
      )
    )
  ))
  "type mismatch"
)