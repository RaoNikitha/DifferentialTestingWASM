;; 9. **Test Description**:    Generate a nested structure featuring multiple intertwined `block` and `loop` instructions, where contextual `br` instructions should reset and manage the label stack repeatedly. The goal is to test if resetting and managing the label indices in deep nesting is correctly performed.

(assert_invalid
  (module (func $nested-blocks (result i32)
    (block (result i32)
      (block (result i32)
        (block
          (br 2 (i32.const 42))
        )
        (i32.const 1)  ; Type mismatch: br 2 expected (i32)
      )
    )
  ))
  "type mismatch"
)