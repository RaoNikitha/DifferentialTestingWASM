;; 2. **Test Description**:    Implement a nested block structure with different block types for the inner and outer blocks. Perform multiple nested pushes and pops on the stack and branch out of the inner block. Test whether the `blocktype` is correctly interpreted at different nesting depths, ensuring stack alignment during complex control flows.

(assert_invalid
  (module (func $type-nested-blocks (result f64)
    (block (result i32)
      (block (result f64) (br 1 (f64.const 3.0))) (br 1 (i32.const 1))
    )
  ))
  "type mismatch"
)