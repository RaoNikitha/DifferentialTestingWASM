;; 6. **Test Description**: Perform a `call_indirect` with an index referring to a function requiring a `funcref` table but passing a table of objects, forcing a type mismatch trap.    - **Constraint Checked**: Table type and reference type conformity.    - **Relation to Improper Handling**: Ensures only tables with correct reference types (`funcref`) are accessed.

(assert_invalid
  (module
    (type (func))
    (table 10 externref)
    (func $call-indirect (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)
