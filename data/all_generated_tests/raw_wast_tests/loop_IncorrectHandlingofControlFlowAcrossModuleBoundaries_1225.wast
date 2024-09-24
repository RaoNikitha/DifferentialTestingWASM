;; 6. **Test Description**: Generate a test where a module imports a function with nested loops and branching via `br_table`, and exports a function that interacts with the importing function, triggering the nested branch logic. This ensures correct loop indexing and stack management during complex branching scenarios across module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func (export "exported_func") (param i32) (result i32)
      (local.get 0)
      (block
        (loop (result i32)
          (br_table 1 0 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)