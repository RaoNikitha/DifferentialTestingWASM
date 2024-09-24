;; 9. Create a scenario with mixed nested `block`, `loop`, and `if` constructs and use `br` within the innermost block to target an outer block. This checks if the `br` correctly references the outer block and unwinds the operand stack accurately. Constraints checked: precise control flow handling, stack consistency.

(assert_invalid
  (module
    (func $nested-mixed-blocks
      (i32.const 0)
      (block (result i32)
        (i32.const 1)
        (block (result i32)
          (i32.const 2)
          (if (result i32)
            (i32.const 3)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)