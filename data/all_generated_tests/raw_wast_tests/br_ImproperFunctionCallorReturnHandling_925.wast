;; 6. **Test Description:** Arrange a `block` enclosing an `if` statement with a condition that invokes a function (`call`) returning a flag. Follow with a `br` targeting the block containing the `if`. Verify if the conditional logic and function return values are correctly maintained.

(assert_invalid
  (module
    (func $flag (result i32)
      (i32.const 1)
    )
    (func
      (block
        (i32.const 0)
        (if (result i32) (then (call $flag) (br 1)) (else (i32.const 1)))
      )
      (drop)
    )
  )
  "type mismatch"
)