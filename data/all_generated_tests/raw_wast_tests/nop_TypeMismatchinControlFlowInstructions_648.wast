;; 9. A nested `if` and `block` sequence where `nop` is included but results in type mismatches due to discrepancies in expected operand stack values before and after `nop`.

(assert_invalid
  (module
    (func $nested-if-block
      (block
        (if (i32.const 1)
          (block
            (nop)
            (i32.const 0)
          )
        )
        (i32.const 1)
      )
      (nop)
      (i32.const 2)
    )
  )
  "type mismatch"
)