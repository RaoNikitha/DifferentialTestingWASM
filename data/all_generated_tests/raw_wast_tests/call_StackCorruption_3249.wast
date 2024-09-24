;; 8. **Test Description**: Define multiple functions with similar signatures and call them interchangeably.    - **Constraint**: Verifies proper function indexing and switching within call sequences.    - **Relation to Stack Corruption**: Ensures stack integrity is maintained when rapidly changing contexts among similar functions.

(assert_invalid
  (module
    (type (func (param i32 i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (func $func1 (type 0) (local i32)
      (i32.add (local.get 0) (local.get 1)))
    (func $func2 (type 1) (local i32)
      (i32.sub (local.get 0) (local.get 1)))
    (table 2 funcref)
    (elem (i32.const 0) $func1 $func2)
    (func $test 
      (call_indirect (type 0) (i32.const 3) (i32.const 2) (i32.const 0))
      (call_indirect (type 1) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)