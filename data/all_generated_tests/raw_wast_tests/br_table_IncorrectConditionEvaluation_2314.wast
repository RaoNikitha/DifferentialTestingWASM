;; 4. Construct a `br_table` with an operand condition placed at the beginning of a loop. Ensure improper handling of operand stack conditions does not lead to an unintended loop re-entry.

(assert_invalid
  (module
    (func $improper-loop-reentry
      (loop (param i32) (result i32)
        (block
          (br_table 0 1 (i32.const 0))
        )
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)