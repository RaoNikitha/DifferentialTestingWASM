;; 4. **Test for Outer Block Type Consistency**: Use nested `block` instructions where the outer `block` expects an `i64` as a result, but a branch to an inner block exits with an `i32` on the stack. Verifying if the type consistency between blocks is enforced or results in a runtime error.

(assert_invalid
  (module
    (func $outer-block-type-consistency
      (block (result i64)
        (block
          (br 1 (i32.const 10))
        )
      )
    )
  )
  "type mismatch"
)