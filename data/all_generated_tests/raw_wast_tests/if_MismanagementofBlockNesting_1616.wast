;; 7. **Test with Backward Branch within Nested `if`**: Define backward branches within nested `if` blocks to check if control correctly jumps backward within the currently valid block context and depth.

(assert_invalid
  (module
    (func $nested-backward-branch
      (block
        (if (i32.const 1)
          (then
            (if (i32.const 1)
              (then (br 1))
              (else (nop))
            )
          )
          (else (nop))
        )
      )
    )
  )
  "invalid jump target"
)