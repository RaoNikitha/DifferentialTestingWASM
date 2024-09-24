;; 9. **Misinterpreted Function Return Types in Loop Contexts**:    - Develop loops that expect certain function return types, but interleave different function calls with mismatched return types. The CFG would not correctly validate the result type propagation, leading to faults.

(assert_invalid
  (module (func $return-mismatch-loop (param i32) (result i32)
    (loop (result f32) (i32.const 0) (br 0))
  ))
  "type mismatch"
)