;; 4. **Test Description**: Test a `br_if` in a function with an inner `block` and an outer `block`. Use a false condition to ensure the execution stays within the inner block, without exiting to the outer block.

(assert_invalid
  (module
    (func (result i32)
      (block
        (block
          (i32.const 0)
          (br_if 1 (i32.const 0))
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)