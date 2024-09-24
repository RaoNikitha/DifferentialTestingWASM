;; 4. **Test br_if with Mixture of blocks and loops**:    Create a mix of `block`, `loop`, and `br_if` instructions to see if the control flow is managed correctly. This will test whether nested structures are properly interpreted and whether control is transferred correctly when conditions are met.

(assert_invalid
  (module
    (func $test
      (block (result i32)
        (loop
          (br_if 0 (i32.const 1))
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)