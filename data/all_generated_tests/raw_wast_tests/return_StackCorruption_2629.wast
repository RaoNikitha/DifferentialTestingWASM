;; 8. A test that employs recursive function calls with `return` instructions, verifying that the stack unwinding process correctly handles multiple function call/return cycles without stack corruption.

(assert_invalid
  (module
    (func $recursive_return (param $n i32) (result i32)
      (if (result i32) (i32.eqz (local.get $n))
        (then (i32.const 0))
        (else 
          (return (call $recursive_return (i32.sub (local.get $n) (i32.const 1))))
        )
      )
    )
  )
  "type mismatch"
)