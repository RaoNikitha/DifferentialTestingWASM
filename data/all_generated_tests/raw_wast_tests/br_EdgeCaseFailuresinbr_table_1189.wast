;; - Create a `br_table` where indices are variables read from the stack and test if dynamic runtime values are correctly handled, checking stack polymorphism and runtime control flow.

(assert_invalid
  (module
    (func (param i32 i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br_table 0 1 (local.get 1) (local.get 0))
          )
          (i32.const 1)
        )
      )
    )
  )
  "type mismatch"
)