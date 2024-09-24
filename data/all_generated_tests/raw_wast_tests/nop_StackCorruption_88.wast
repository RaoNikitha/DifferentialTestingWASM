;; 9. Sequencing `nop` with control instructions that involve stack manipulation, such as `drop` and `select`, to check that `nop` does not corrupt the stack state required by these control instructions.

(assert_invalid
  (module
    (func $drop-nop (nop) (drop))
  )
  "drop requires an operand"
)