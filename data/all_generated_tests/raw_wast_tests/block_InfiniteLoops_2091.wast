;; Test a nested block structure with a `loop` inside the inner block and a `br_if` targeting the outer block, ensuring correct label shifting and stack management to prevent an infinite loop.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (br_if 1 (i32.const 0))  ;; Target the outer block with br_if.
          )
        )
      )
    )
  )
  "type mismatch"
)