;; Test 8: Establish an if-else structure with each branch returning different types (e.g., int and float). Use br to jump out from one branch to another, checking for type mismatches.

(assert_invalid
  (module
    (func $test
      (block
        (if (result i32)
          (then (br 0 (i32.const 2)))
          (else (br 0 (f32.const 3.14)))
        )
      )
    )
  )
  "type mismatch"
)