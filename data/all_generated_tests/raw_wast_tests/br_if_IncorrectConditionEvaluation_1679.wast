;; 10. A deeply nested stack of control instructions (`block`, `loop`, `if`) with a `br_if` where the condition involves multiple dependencies. The test verifies that the stack unwinding and condition handling result in correct branching or continuing behavior.

(assert_invalid
  (module
    (func $deeply_nested_stack
      (block
        (loop
          (if (i32.eqz (i32.const 0))
            (block
              (block
                (br_if 3 (i32.and (i32.const 1) (i32.or (i32.const 0) (i32.const 0))))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)