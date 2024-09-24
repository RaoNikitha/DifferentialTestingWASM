;; 2. **Test 2**:    - **Description**: A nested `loop` structure where the inner loop expects `f32` values and a conditional `br_if` is used with a `i32` operand.    - **Constraint**: Ensures that the conditional branch with `br_if` respects the inner loop's `f32` type expectation.    - **Relation to Type Mismatch**: Validates whether the `br_if` handles stack unwinding and type matching correctly within nested loops.

(assert_invalid
 (module
   (func $nested-loop-br_if
     (loop (f32.const 0.0)
       (loop
         (br_if 0 (i32.const 1))
       )
     )
   )
 )
 "type mismatch"
)