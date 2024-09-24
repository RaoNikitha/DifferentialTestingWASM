;; 7. **Test 7: `br_table` With Immediate `nop` And Boundary Index**    - Place a `nop` immediately following a `br_table` using boundary indices to verify that the execution flow is not disrupted by the `nop`.    - Constraint: Check that the `nop`'s no-op behavior is preserved and the boundary index in `br_table` retains expected behavior.

(assert_invalid
  (module
    (func $test-7
      (block $outer
        (loop $inner
          block $label_1
            (br_table $label_1 $outer (i32.const 0))
            nop
          )
        )
      )
    )
  )
  "br_table out of bounds"
)