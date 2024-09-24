;; 6. **Stack Manipulation with Br_If**: Construct a loop using `br_if` inside that evaluates multiple conditions, which may only pop values conditionally. This test ensures that operand stack remains accurate regardless of conditional branches, checking `Wizard Engine`'s stack management with `checkAndPopArgs`.

(assert_invalid
  (module
    (func $stack-manipulation-br_if
      (block (result i32)
        (loop (result i32)
          (i32.const 1)
          (i32.const 2)
          (br_if 0
            (i32.eqz (i32.const 0))
          )
          (i32.const 3)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)