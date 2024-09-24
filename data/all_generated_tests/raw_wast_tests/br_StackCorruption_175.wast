;; 6. **Test Description:**    - Create nested `block`, `loop`, and `if` statements containing several `br` instructions that jump across different structured control instructions. Confirm that stack unwinding matches the expected operand consumption and placement post-branch to avoid stack corruption.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (if (i32.eq (i32.const 1) (local.get 0))
            (then (br 1))
          )
          (loop (result i32)
            (if (i32.eq (i32.const 0) (local.get 0))
              (then (br 2))
            )
            (i32.const 42)
          )
        )
      )
    )
  )
  "type mismatch"
)