;; 7. **Multiple Indirect Calls with Conditional Branching**:    - Use multiple `call_indirect` instructions within nested `br_if` conditions.    - Include a mixture of correct and mismatched signatures.    - Confirm if the branch conditions and mismatched signatures lead to correct trapping in OCaml but incorrect in Java.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i32 i32)))
    (func $f1 (param i32))
    (func $f2 (param i32 i32))
    (table funcref (elem $f1 $f2))
    (func $test
      (local i32)
      (local.set 0 (i32.const 0))
      (block
        (br_if 0
          (call_indirect (type 0) (local.get 0) (i32.const 1))
        )
        (call_indirect (type 1) (local.get 0) (i32.const 1) (i32.const 2))
      )
    )
  )
  "type mismatch"
)