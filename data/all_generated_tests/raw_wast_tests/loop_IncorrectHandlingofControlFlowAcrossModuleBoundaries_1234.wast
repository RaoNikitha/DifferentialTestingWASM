;; 5. **Test Case 5**: Implement a loop that makes use of a `br_table` instruction to create indirect branches to various parts of an imported function. This test will ensure that both implementations accurately handle the look-up and execution flow, preserving the integrity of the control flow when crossing module boundaries.

(assert_invalid
  (module
    (func $test_loop_br_table
      (i32.const 0)
      (loop $L1
        (block $B0
          (block $B1
            (block $B2
              (br_table $L1 $B0 $B1 $B2)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)