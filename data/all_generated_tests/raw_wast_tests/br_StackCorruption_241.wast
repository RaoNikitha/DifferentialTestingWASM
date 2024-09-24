;; 2. **Test Description**: Use a `block` containing a simple arithmetic operation and attempt a `br` to a surrounding block labeled with mismatched operands to verify if operand counts are correctly managed, checking for stack overflow/underflow.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (i32.const 10)
          (br 1 (i32.const 20))
        )
      )
    )
  )
  "type mismatch"
)