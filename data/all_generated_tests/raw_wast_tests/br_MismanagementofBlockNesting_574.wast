;; Test 5: Place an `if-else` structure inside a `block`, and utilize `br` to jump out of the `else` to the end of the outer block. This tests the correct unwinding of the stack and the branch behavior from conditional constructs.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (if (i32.const 1)
          (then (i32.const 10))
          (else (br 1))
        )
        (i32.const 20)
      )
    )
  )
  "type mismatch"
)