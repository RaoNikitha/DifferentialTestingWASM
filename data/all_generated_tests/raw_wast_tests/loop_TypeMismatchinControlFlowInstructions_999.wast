;; 10. **Type Enforcement Failures in `br_if` within Loop**:    - A conditional branch (`br_if`) within a loop structured to push mismatching type results conditional on various runtime states.    - Tests if `br_if` correctly enforces branch target type matching within the loop’s block type constraints.    - Specific Constraint: Validation of type checking in conditional branches within loop bodies.

(assert_invalid
 (module (func $type-enforcement-fail-br_if
   (block (loop (br_if 0 (f64.const 1.0)) (drop)))
 ))
 "type mismatch"
 )