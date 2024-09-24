;; 5. **Test: Polymorphic Function Call Across Modules**    - Description: The importing module has multiple functions with varying signatures. The `call_indirect` instruction attempts to call a function through polymorphic signatures, ensuring strict type conformity.    - Constraint Checked: Polymorphic cases and dynamic type checking.    - Related to Control Flow: Validates correct function selection from a polymorphic set across module boundaries.

(assert_invalid
  (module
    (type $func1 (func (param i32)))
    (type $func2 (func (param f32)))
    (import "env" "table" (table 1 funcref))
    (import "env" "f1" (func $f1 (type $func1)))
    (import "env" "f2" (func $f2 (type $func2)))
    (func $test
      (call_indirect (type $func1) (i32.const 0) (f32.const 0.0))
    )
  )
  "type mismatch"
)