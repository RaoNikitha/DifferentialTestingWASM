;; 8. **Test Description**: Create a sequence where an indirect call within a `select` instruction has branches with different types, but the function referenced by `call_indirect` returns another type, say `i64`.    - **Constraint**: Ensures `select` instructions correctly handle type compliance on indirect calls.    - **Relation**: Differential test focused on mismatches in `select` branches involving indirect calls.

(assert_invalid
  (module
    (type $sig1 (func (result i64)))
    (type $sig2 (func (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) funcref (ref.func $func1))
    (func $func1 (result i64) (i64.const 42))
    (func (param i32)
      (select
        (i32.const 0)
        (call_indirect (type $sig2) (i32.const 0))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)