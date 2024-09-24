;; 10. **Test Description:**     - Define a `block` that handles result types in sequence: `[i32, f64]`.     - Inside the block, execute a mismatched `br` that only places `[f64, i32]` upon exit.     - The final differential test should validate strict type sequence before and after using control structures and branches.

(assert_invalid
  (module
    (func $mismatched-br
      (block (result i32 f64)
        (f64.const 0.0) (i32.const 0)
        (br 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)