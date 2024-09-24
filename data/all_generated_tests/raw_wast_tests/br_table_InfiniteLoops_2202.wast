;; 2. **Test Description:** Design a loop where `br_table` targets a label inside the loop and includes more labels than required. Verify if `wizard_engine` raises `BrTableArityMismatch` when arity does not match, whereas WebAssembly properly handles the stack unwinding.

(assert_invalid
  (module
    (func (param i32)
      (loop
        (block
          (block
            (block
              (br_table 0 1 2 3 (local.get 0))
            )
          )
        )
      )
    )
  )
  "arity mismatch"
)