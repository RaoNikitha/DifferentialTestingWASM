;; 3. **Test Description**: An `if` construct where the condition involves a call to an imported function returning complex types. Mismanagement of the return type could lead to execution errors.    **Constraint**: Verifies that control flow transitions involving imported function calls as conditions are conducted properly.    **Goal**: Highlights potential issues in type and stack management related to control flow boundaries.

(assert_invalid
  (module
    (import "env" "complexCondition" (func $complexCondition (result f64 f32)))
    (func $test
      (if (result f64 f32) 
          (call $complexCondition) 
          (then (f64.const 1.0) (f32.const 2.0)) 
          (else (f64.const 3.0))))
  )
  "type mismatch"
)