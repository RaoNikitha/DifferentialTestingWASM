;; 9. **Br in Try-Catch Function Sequence:**    Implement a function sequence with try-catch blocks and include `br` instructions inside the `try` blocks targeting outside labels. This tests if the `br` manages to correctly handle exceptions and ensures proper function return.

(assert_invalid
  (module
    (func (export "test")
      (try (result i32)
        (do (block $label (br $label)))
        (catch_all (i32.const 0))
      )
    )
  )
  "invalid branch target"
)