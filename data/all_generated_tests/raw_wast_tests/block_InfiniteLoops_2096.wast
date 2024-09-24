;; Create a block with stack value manipulation performed within nested `loops` and conditional breaks (`br_if`), ensuring the finite loop's stack state matches expectations and label stack shifts correctly in both implementations.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (i32.const 0)
        (loop (result i32)
          (i32.const 1)
          (br_if 0)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)