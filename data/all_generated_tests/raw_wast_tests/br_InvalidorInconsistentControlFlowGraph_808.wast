;; 9. **Misinterpreted Label Index in Deep Nest Test:**    Construct deeply nested blocks and loops, and use `br` instructions targeting different depths. This checks the correct interpretation of label indices and prevents misaligned branches.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (block (result i32)
              (br 5)
              (i32.const 0)
            )
          )
        )
      )
    )
  )
  "unknown label"
)