;; Test 1: Invalid Function Type in Table - **Constraint/Issue**: Verifies dynamic type checking mismatch between function type in the table and the expected type index. - **Test Description**: Create a module with a table that includes a function with a type different from the function type referenced by the `typeidx`. Use `call_indirect` to call this function. This should result in a trap due to type mismatch.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f32) (result i32)))
    (table funcref (elem (ref.func 1)))
    (func $type-mismatch-expect-i32-call-f32
      (call_indirect (type 0) (i32.const 0) (i32.const 42))
    )
  )
  "type mismatch"
)