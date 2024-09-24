;; 3. **Test Description**: A nested `loop` where the inner loop contains a `call_indirect` which conditionally returns out of the inner loop but not the outer loop.    - **Constraint**: Tests if nested loops with indirect function calls maintain separate control contexts and return correctly.    - **Improper Handling**: Mismanagement of context extension and return types causing invalid loop termination behavior. -

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) func $callee)
    (func $callee (param i32) (result i32) (i32.const 0))
    (func $outer
      (result i32)
      (loop (result i32)
        (loop (result i32)
          (call_indirect (type $sig) (i32.const 0) (i32.const 1))
          (br_if 1 (i32.eqz (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)