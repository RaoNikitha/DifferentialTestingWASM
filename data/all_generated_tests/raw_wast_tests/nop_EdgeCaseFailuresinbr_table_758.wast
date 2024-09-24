;; 9. Place a `nop` before a `br_table` within an `if-else` construct that branches differently based on runtime conditions, ensuring the `nop` has no side effect on the condition evaluation or branching logic.

(assert_invalid
  (module
    (func $br_table_if_else (param i32)
      (if (local.get 0)
        (then (nop) (br_table 0 (local.get 0)))
        (else (nop) (br_table 0 (local.get 0)))
      )
    )
  )
  "type mismatch"
)