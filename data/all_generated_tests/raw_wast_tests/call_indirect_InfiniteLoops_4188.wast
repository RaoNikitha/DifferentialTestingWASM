;; 7. **Test for Continuous Invalid Type Index in Loop**:    Create a scenario where `call_indirect` is used with an invalid `typeidx` within a loop. If the invalid type index doesn't cause a trap, and the loop continues infinitely due to a continuous invalid type check.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $continuous-invalid-type-in-loop
      (loop
        (call_indirect (type 1) (i32.const 0))
      )
    )
  )
  "unknown type"
)