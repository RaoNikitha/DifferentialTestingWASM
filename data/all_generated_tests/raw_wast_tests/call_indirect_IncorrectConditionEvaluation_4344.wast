;; 3. Test Description 3: Use a `call_indirect` with a valid table index, but the table contains a function of an incorrect signature. The `br_if` condition is based on a falsy value, expecting the call to trap even though conditions technically shouldn't yet permit the execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table 1 funcref)
    (func $type-mismatch-func (param i32) (result i32) (i32.const 0))
    (elem (i32.const 0) $type-mismatch-func)
    (func (param i32) (result i32)
      block
        br_if 0 (i32.const 0)
        call_indirect (type 1) (local.get 0)
      end
    )
  )
  "type mismatch"
)