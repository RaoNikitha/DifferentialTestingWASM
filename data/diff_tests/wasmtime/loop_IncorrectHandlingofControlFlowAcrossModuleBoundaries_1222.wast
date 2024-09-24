;; 3. **Test Description**: Construct a module exporting a function that contains nested `loop` instructions, and import a function that is called within the loops. Use `br_table` in the loops to branch to different loop levels based on conditions. The test checks for correct index handling and stack restoration when branching within nested loops across module boundaries.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (param i32) (result i32)))
    (func $nested_loops (param i32) (result i32)
      (local i32)
      (loop (result i32)
        (local.set 0 (i32.const 0))
        (loop (result i32)
          (br_table 0 1 (local.get 0))
          (call $imported_func (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)