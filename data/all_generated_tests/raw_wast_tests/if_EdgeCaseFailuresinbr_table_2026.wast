;; 7. Test a deeply nested `if` structure where a `br_table` in the innermost `else` block has indices that resolve correctly only if the outer `if` conditions are handled accurately, to observe stack and flow control management.

(assert_invalid
  (module
    (func $deep-nesting-br_table 
      (block $outer (result i32)
        (if (result i32) (i32.const 1)
          (then
            (block $middle (result i32)
              (if (result i32) (i32.const 0)
                (then (br_table 0 1 2 (i32.const 1)) (i32.const 0))
                (else (br_table 1 (i32.const 2)) (i32.const 0))
              )
            )
          )
          (else (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)