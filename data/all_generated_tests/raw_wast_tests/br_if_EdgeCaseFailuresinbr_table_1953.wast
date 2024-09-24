;; Test 4: Execute a `br_table` with an index referring to a non-existent label while having another valid label index present, ensuring the `br_if` implementation properly handles conditional stack unwinding.

(assert_invalid
  (module
    (func
      (block (block (loop (br_table 1 2 (i32.const 1)) (br_if 1 (i32.const 1)))))
    )
  )
  "type mismatch"
)