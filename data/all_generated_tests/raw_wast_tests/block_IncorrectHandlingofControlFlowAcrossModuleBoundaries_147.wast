;; 8. **Test Description**: Insert a `block` that branches to a nested `block` inside an imported function, which should end with a type mismatch.    **Constraint**: Verify consistency and correctness of block type validation across module boundaries.

(assert_invalid
  (module
    (import "env" "func" (func (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32) 
          (br 0 (call 0))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)