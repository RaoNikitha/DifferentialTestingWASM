;; 9. **Test 9: `nop` in Complex Loop Conditions**    - **Constraint Check**: Confirm that `nop` within complex loop conditions (with multi-level breaks/continues) does not introduce incorrect control paths.    - **Description**: Create loops with complex conditions including multiple break and continue statements interspersed with `nop` and check loop correctness.

(assert_invalid
  (module
    (func $complex-loop
      (loop $outer
        (loop $inner
          (br_if $inner
            (i32.const 0)
          )
          (nop)
          (br $outer)
        )
        (nop)
        (br_if $outer
          (i32.const 1)
        )
      )
    )
  )
  "invalid control path"
)