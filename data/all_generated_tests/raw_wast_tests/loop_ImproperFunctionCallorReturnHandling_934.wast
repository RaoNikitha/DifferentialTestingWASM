;; 5. **Test Description:**    Using `br_if` to conditionally branch within a loop to a block containing an indirect function call where the table types do not match the function signature. This checks conditional branching with function types.

(assert_invalid
  (module
    (type $sig_i (func (result i32)))
    (type $sig_vv (func))
    (table 1 funcref)
    (elem (i32.const 0) $sig_i)
    (func $sig_i (loop (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 1))
      (call_indirect (type $sig_vv) (i32.const 0))))
  )
  "type mismatch"
)