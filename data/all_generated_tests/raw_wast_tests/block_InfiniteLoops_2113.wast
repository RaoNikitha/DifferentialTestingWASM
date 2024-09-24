;; 4. **Test 4: Mixed Type Operand Handling in Loop**    - A loop within a `block` handles mixed operand types (e.g., integers and floats) with multiple `br_if` conditions checking different operand types.    - Tests if the stack correctly manages mixed type operands and branches accurately prevent infinite loops.

(assert_invalid
  (module 
    (func $mixed-type-operand-handling-loop
      (block (result i32)
        (loop 
          (i32.const 10)
          (f32.const 5.0)
          (br_if 0 (i32.const 1))
          (br_if 0 (f32.const 1.0))
        )
      )
    )
  )
  "type mismatch"
)