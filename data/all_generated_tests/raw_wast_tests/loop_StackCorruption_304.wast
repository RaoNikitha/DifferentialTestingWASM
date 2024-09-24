;; 5. **Complex Br_Table Usage in Loop**: Utilize a loop containing `br_table` instructions targeting various outer loops and blocks to validate indirect branching behavior. This helps identify errors in stack management due to improper indexing or mismatched branch targets in `Wizard Engine`.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (loop (result i32)
          (br_table 0 1 2) ;; 2 outer targets
          (i32.const 1)
        )
        (i32.const 0)
      )
    )
  )
  "indirect branch out of bounds"
)