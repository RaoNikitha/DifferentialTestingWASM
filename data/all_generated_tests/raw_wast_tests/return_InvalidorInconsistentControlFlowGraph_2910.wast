;; 9. Create a function with cross block branching (`br_if` and `return`) where the return target is ambiguous due to complex CFG, observing if WebAssembly’s type mismatch detection catches issues that the Wizard Engine’s unreachable code marking might ignore.

(assert_invalid
  (module
    (func $cross_block_br_if_return (result i32)
      (block
        (block
          (br_if 0 (return) (i32.const 1))
        )
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)