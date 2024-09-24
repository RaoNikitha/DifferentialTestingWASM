;; 5. **Test Description:** Embed a `br_table` beneath an `if-else` branch within nested loops. Perform checks for arity and operand stack consistency, ensuring the branch targets correctly re-enter the innermost block, and do not step out of loop boundaries.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if (i32.const 1)
            (then (block (br_table 0 1 2 (i32.const 0))))
            (else (block (br_table 0 1 2 (i32.const 1))))
          )
        )
      )
    )
  )
  "unknown label"
)