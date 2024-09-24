;; Set up a scenario where `br` has to target a `block` deeply nested in several `if` statements with operand types mismatching the target's requirement. Check for correct operand stack and CFG consistency. Testing for: Operand type matching and CFG correctness when branching out of deeply nested conditional structures.

(assert_invalid
  (module
    (func
      (block (result i32)
        (if (i32.const 1) (then
          (block (result i32)
            (if (i32.const 1) (then
              (block (result i32)
                (br 2 (i64.const 1))
              )
            ))
          )
        ))
      )
    )
  )
  "type mismatch"
)