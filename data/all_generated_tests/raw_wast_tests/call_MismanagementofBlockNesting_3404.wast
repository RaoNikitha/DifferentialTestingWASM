;; 3. **Mixed Conditional Branches**: Design a test mixing `if`, `else`, and `block` instructions with embedded `call` instructions, testing for each branch's correct execution path. Confirm that each conditional sequence preserves the correct nesting and does not misinterpret the control flow after function calls.

(assert_invalid
  (module
    (func $f (param i32) (result i32)
      (if (i32.lt_s (local.get 0) (i32.const 10))
        (then
          (call $f (i32.add (local.get 0) (i32.const 1)))
        )
        (else
          (i32.const 0)
        )
      )
    )
    (func $test
      (if (i32.eqz (i32.const 1))
        (then
          (block
            (call $f (i32.const 5))
          )
        )
        (else
          (call $f (i32.const 15))
        )
      )
    )
  )
  "type mismatch"
)