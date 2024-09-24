;; 3. **Test Description**: Create a `loop` containing a `call_indirect` that mismatches function signature types, confirming a trap is triggered mid-loop.    - *Constraint Checked*: Function type conformity during `call_indirect`.    - *Infinite Loop Context*: Trap on type mismatch must break the loop.

(assert_invalid
  (module
    (type $sig-i32 (func (param i32)))
    (type $sig-i64 (func (param i64)))
    (func $f (param i64))
    (table funcref (elem $f))
    (func $loop-with-call-indirect
      (loop
        (call_indirect (type $sig-i32) (i32.const 0))
        (br 0)
      )
    )
  )
  "type mismatch"
)