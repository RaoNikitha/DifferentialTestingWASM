;; 7. **Test Description**: Create a series of nested `block` structures with a `br_if` targeting the outermost `block`. Use a `br_table` to continuously change target indices. Verify if `wizard_engine` accurately fetches the correct result types for `br_if` and handles `br_table`'s bounds, unlike WASM.

(assert_invalid
  (module 
    (func 
      (block (block (block (block (block
        (i32.const 0)
        (br_if 4 (br_table 0 1 2 3 4 (i32.const 0)))
      )))))
    )
  )
  "unknown label"
)