;; 3. Check multiple `br_if` instructions in sequence with alternating true and false conditions. Inconsistent branching will reveal errors in conditions handling.

(assert_invalid
  (module
    (func $multiple-br_if (result i32)
      (i32.const 0)
      (i32.const 1)
      (i32.const 2)
      (block
        (br_if 0 (return) (i32.const 1))
        (br_if 0 (return) (i32.const 0))
        (br_if 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)