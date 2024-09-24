;; 7. **Test 7:** Construct an example where a loop contains an inner block with nested conditionals, each with `unreachable`, executed by `br_table`:    - **Check:** Confirm that the control flow correctly traps with `unreachable` and handles `br_table` as expected.    - **Constraint:** Evaluates nested combinations of conditionals, loops, and blocks managing control flow accurately.

(assert_invalid
  (module (func $type-loop-block-br-table-unreachable
    (loop
      (block
        (br_table 0 (unreachable))
        (br_table 0 0 (unreachable))
        (if (i32.const 1)
          (then (unreachable))
          (else (unreachable))
        )
      )
    )
  ))
  "type mismatch"
)