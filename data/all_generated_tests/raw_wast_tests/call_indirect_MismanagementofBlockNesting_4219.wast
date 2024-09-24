;; 8. **Test Description**:     Develop a double-nested `if-else` structure within a loop. Each branch contains `call_indirect` instructions calling functions of different signatures. Use `br_if` to conditionally branch out of the nested branches based on results from `call_indirect`.    **Constraint**: Confirm that nested `if-else` branches retain their integrity, and conditional branches correctly evaluate without leading to type mismatches in `call_indirect`.    **Relation to Mismanagement of Block Nesting**: Ensures that conditional branching within nested structures functions correctly, retaining accurate type checking for function calls.

(assert_invalid
  (module
    (type $sig1 (func))
    (type $sig2 (func (param i32) (result i32)))
    (func $f1 (type $sig1))
    (func $f2 (type $sig2) (param i32) (result i32) (i32.const 42))
    (table funcref (elem $f1 $f2))
    (func (param i32) (result i32)
      (loop
        (if (i32.const 1)
          (then
            (call_indirect (type $sig1) (i32.const 1))
          )
          (else
            (call_indirect (type $sig2) (i32.const 0) (param.get 0))
          )
        )
        (br_if 0 (i32.eqz (i32.const 0)))
      )
    )
  )
  "type mismatch"
)