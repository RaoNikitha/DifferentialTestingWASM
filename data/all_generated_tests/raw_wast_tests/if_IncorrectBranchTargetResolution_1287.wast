;; 8. **Test 8: Misbranching with Multiple Conditional Levels**    - Multiple `if` blocks in series with intermixed branches causing resolution errors where branches intended for the innermost conditions target the wrong `if` block.

(assert_invalid
  (module (func $multiple-conditional-levels
    (if (result i32) (i32.const 1)
      (then
        (if (result i32) (i32.const 0)
          (then (br 1))
          (else (i32.const 2))
        )
      )
      (else (i32.const 3))
    )
    (drop)
  ))
  "type mismatch"
)