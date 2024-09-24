;; 7. **Test Mixed Type Blocks with Branch Outside If**:    Embed `if` instructions within different block types (`block`, `loop`) and issue a branch instruction within the `if` block aiming at the outermost block. Verify if the branch target label is correctly interpreted in all cases.

(assert_invalid
  (module
    (block $outer (result i32)
      (if (result i32)
        (i32.const 1)
        (then (br $outer (i32.const 0)))
        (else (i32.const 2))
      )
    )
  )
  "type mismatch"
)