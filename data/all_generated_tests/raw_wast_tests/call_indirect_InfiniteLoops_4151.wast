;; 10. **Test Description 10**:    - Set up a `loop` that performs `call_indirect` calls with alternating valid and invalid index operands. Lengthy validations for function types result in an infinite loop due to inconsistent handling of function indices.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (table funcref (elem $f1 $f2))
    (func $f1 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func $f2 (param i64) (result i64) (i64.add (local.get 0) (i64.const 1)))
    (func
      (loop $exit
        (i32.const 0)
        (call_indirect (type 0) (i32.const 0)) ;; valid index, correct type
        (drop)
        (i32.const 1)
        (call_indirect (type 1) (i32.const 1)) ;; valid index, incorrect type
        (drop)
        (br $exit)
      )
    )
  )
  "type mismatch"
)