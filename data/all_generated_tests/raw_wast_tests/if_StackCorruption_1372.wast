;; 3. **Test Description**:    Inside the `if` block, the `then` block passes through a function adding two integers. The `else` block calculates a sum and then subtracts a value, ensuring the stack result type conforms to `[i32]`.

(assert_invalid
  (module
    (func $test-if-then-else (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (i32.add (i32.const 2) (i32.const 3))
        )
        (else
          (i32.sub (i32.add (i32.const 5) (i32.const 4)) (i32.const 3))
        )
      )
    )
  )
  "type mismatch"
)