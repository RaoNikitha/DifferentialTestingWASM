;; 9. **Test Description: Conditional Branch Creating Dangling Else Paths**    - Create nested `if-else` blocks with `br_if` creating scenarios where dangling `else` paths can be incorrectly executed or skipped.    - **Constraint Check**: Ensure CFG maintains the correct condition paths and does not misinterpret dangling branches.    - **CFG Relevance**: Verifies correct interpretation and handling of conditional paths in CFG.

(assert_invalid
  (module
    (func $dangling_else_path
      (if (i32.const 1)
        (then
          (br_if 0 (i32.const 1))
        )
        (else
          (br_if 1 (i32.const 0))
          (i32.const 0)
        )
      )
    )
  )
  "invalid branch target"
)