;; 3. **Test 3: Type Mismatch on Loop Branching**    - **Description**: Create a loop expecting an `i32` operand but use `br_if` to branch with an `f32` operand.    - **Constraint Checked**: Verify that the type of operand provided by `br_if` matches the expected type of the loop.    - **Relation to Type Mismatch**: Directly relates as incorrect type leads to runtime type errors.

(assert_invalid
  (module (func $type-mismatch-loop (loop (br_if 0 (f32.const 0.0)))))
  "type mismatch"
)