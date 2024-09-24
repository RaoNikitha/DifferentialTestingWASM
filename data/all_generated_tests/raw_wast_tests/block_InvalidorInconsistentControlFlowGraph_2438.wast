;; 9. **Test for Incorrect Type Use Inside Block**:    - Use operations within a block that are incompatible with the declared `blocktype`, such as applying arithmetic operations on incompatible data types. This ensures type consistency.    - Constraint: Type validation within block instructions.    - CFG Impact: CFG inconsistencies due to operations on mismatched types, leading to invalid execution paths.

(assert_invalid
  (module (func $type-arithmetic-incompatible (result i32)
    (block (result i32) (i32.const 5) (i64.add (i64.const 10))))
  )
  "type mismatch"
)