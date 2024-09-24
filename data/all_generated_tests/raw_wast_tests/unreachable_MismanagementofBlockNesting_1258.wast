;; 9. **Test 9:** Create an edge case where an `unreachable` instruction is placed within a complex nested structure where the inner blocks are inside a loop, and conditional branches lead to outer blocks using `br_table`:    - **Check:** Evaluate if the `unreachable` instruction instantly traps while maintaining correct control flow through `br_table`.    - **Constraint:** Tests the interaction between nested loops, blocks, and `unreachable` handling.

(assert_invalid
  (module (func $type-complex-nested-br_table-unreachable
    (loop (block (if (i32.const 1)
      (then
        (block (br_table 0 1 2 (unreachable)))
        (loop (block (br_table 0 1 (i32.const 0)))))
      (else (unreachable))))
    ))
  )
  "type mismatch"
)