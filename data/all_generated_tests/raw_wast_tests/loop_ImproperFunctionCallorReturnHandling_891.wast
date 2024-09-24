;; 2. **Nested Loop with Function Return Handling**:    - Description: Define a nested loop where the inner loop returns a value that the outer loop uses in a `call_indirect` instruction. Some functions in the table should return different types to test return type validation.    - Constraint: Ensure the return value is correctly handled and validated against the function signatures.    - Relation: Mismatch in return values can cause improper function call sequences.

(assert_invalid
  (module
    (func $nest-loop-func-return
      (type $sig0 (func (param i32) (result i32)))
      (table 3 funcref)
      (elem (i32.const 0) $func1 $func2 $func3)
      (loop (result i32)
        (i32.const 0)
        (loop (result i32)
          (i32.const 1)
          (br 1)
        )
        (call_indirect (type $sig0) (i32.const 0))
      )
    )
    (func $func1 (param i32) (result i32)
      i32.const 10
    )
    (func $func2 (param i32) (result i64)
      i64.const 20
    )
    (func $func3 (param i32) (result i32)
      i32.const 30
    )
  )
  "type mismatch"
)