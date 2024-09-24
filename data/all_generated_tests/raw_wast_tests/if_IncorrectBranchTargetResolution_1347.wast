;; 8. **Multiple Branch Targets in Single Block**:    - Setup an `if` block with multiple `br` instructions targeting various labels (including nested and sibling blocks). Confirm each `br` accurately jumps to its intended label, verifying correct interpretation among multiple targets.    - **Constraint**: Multi-target branching should ensure each branch jumps uniquely and appropriately.

(assert_invalid
  (module
    (func $test
      (block $outer (result i32)
        (block $inner (result i32)
          (if (result i32) (i32.const 1)
            (then
              (i32.const 10)
              (br $inner)
              (i32.const 20)
            )
            (else
              (i32.const 30)
              (br $outer)
              (i32.const 40)
            )
          )
          (unreachable)
        )
        (drop)
        (i32.const 50)
      )
    )
  )
  "type mismatch"
)