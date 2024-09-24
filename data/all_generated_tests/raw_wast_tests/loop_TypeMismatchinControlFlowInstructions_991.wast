;; 2. **Incorrect Type Propagation After Loop Block**:    - A sequence where a loop exhales a value of one type but the following instructions presume another type.    - This tests the correct propagation of types out of a loop's scope.    - Specific Constraint: Verification of consistent type propagation post-loop.

(assert_invalid
  (module (func $incorrect-type-propagation
    (loop (result i32) 
      (i32.const 10)
    ) 
    (f32.add) 
  ))
  "type mismatch"
)