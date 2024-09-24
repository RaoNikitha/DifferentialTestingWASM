;; 10. **Test Description 10**:     - **Test**: Loop that branches using `br_if` based on evaluating a compound condition involving both arithmetic and logical operations.     - **Constraint**: Check that compound conditions are evaluated correctly and the branch behaves as expected.     - **Reason**: Mis-evaluation can stem from improperly handled compound conditions.  These test descriptions target the core aspect of condition evaluation within loops to differentiate correct from incorrect implementations in WebAssembly and Wizard Engine contexts.

(assert_invalid
  (module
    (func $complex-loop-condition
      (local $i i32)
      (local.set $i (i32.const 0))
      (loop $loop (result i32)
        (local.set $i (i32.add (local.get $i) (i32.const 1)))
        (br_if $loop (i32.and (i32.lt_s (local.get $i) (i32.const 10)) (i32.eqz (i32.rem_s (local.get $i) (i32.const 2)))))
      )
    )
  )
  "type mismatch"
)