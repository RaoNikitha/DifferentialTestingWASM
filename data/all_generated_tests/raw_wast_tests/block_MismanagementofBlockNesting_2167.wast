;; 8. **Test 8**:    Create a structure with `block`, `loop`, and multiple nested `if` constructs. Check if a `br` from the innermost `if` targets the correct block, verifying that blocks and loops are identified correctly in their nested state.

(assert_invalid
  (module
    (func (result i32)
      (block (result f32)
        (loop (result f32)
          (if (result f32)
            (then (block (result f32) (br 2 (f64.const 1.0))))
            (else (block (result f32) (br 2 (f32.const 1.0))))
          )
        )
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)