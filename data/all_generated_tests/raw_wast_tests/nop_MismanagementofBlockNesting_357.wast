;; 8. **Test Description**:    We'll embed `nop` instructions within deeply nested block-local variable usage and control structures, examining if the blocks are exited properly and variables' scope remains well-defined and unaltered.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block
              (local $x i32)
              (nop)
              (set_local $x (i32.const 0))
              (nop)
            )
            (nop)
          )
          (nop)
        )
        (nop)
      )
      (i32.eqz (get_local $x))
    )
  )
  "type mismatch"
)