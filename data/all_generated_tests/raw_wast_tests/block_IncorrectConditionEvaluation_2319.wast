;; 10. Test a `block` where a `br_if` condition involves values manipulated by previous `block` entries and exits, verifying that the condition correctly evaluates the current stack state and performs or skips the branch accordingly.

(assert_invalid
  (module (func $test_br_if_block (result i32)
    (block (result i32)
      (i32.const 1)
      (block (result i32)
        (i32.const 2)
        (br_if 0 (i32.const 0))
        (i32.add)
      )
      (i32.add)
    )
  ))
  "type mismatch"
)