;; 5. **Test 5**: Design a function containing multiple nested control structures (`loop` inside `block`). A `br_if` within the innermost loop should conditionally branch to `unreachable` in the outer block. Push the appropriate value to validate proper control flow and stack management.

(assert_invalid
  (module
    (func $nested-br_if
      (block (result i32)
        (loop (result i32)
          (block $outer
            (i32.const 1)
            (br_if $outer (i32.const 1))
            (unreachable)
          )
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)