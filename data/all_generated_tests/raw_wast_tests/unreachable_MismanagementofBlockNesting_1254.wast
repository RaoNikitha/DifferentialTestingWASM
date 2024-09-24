;; 5. **Test 5:** Design nested `block` and `loop` structures where a `br_table` and `unreachable` are mixed within these, ensuring incorrect handling will expose mismanagement:    - **Check:** Verify that each `unreachable` immediately traps and the `br_table` manages the jump as expected.    - **Constraint:** Assesses mismanagement of block and loop depth recognition.

(assert_invalid
  (module
    (func $type-br_table-num-after-unreachable (result i32)
      (block (loop (br_table 0 1 (unreachable) (i32.const 0)) (i32.const 0)))
    )
  )
  "type mismatch"
)