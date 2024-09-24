;; 10. Compose an `if` block that inadvertently branches into another structured control instruction that isn’t properly terminated, causing the control flow graph to have incomplete paths leading to potential unreachable code traps.

(assert_invalid
  (module
    (func $incorrect-branch-structure
      (block
        (if
          (i32.const 1)
          (then
            (block (br 1))
          )
          (else
            (block (br 1))
          )
        )
      )
    )
  )
  "type mismatch"
)