;; 3. **Type Mismatch in Nested Block**:    Write a nested block structure where the outer block expects `i32` results, but the inner block's call returns `f64`. Check how the type enforcement is handled in such a scenario.

(assert_invalid
  (module
    (type (func (result f64)))
    (type (func (param i32) (result i32)))
    (func $nested-blocks 
      (block (result i32)
        (block
          (call 0)
        )
      )
    )
  )
  "type mismatch"
)