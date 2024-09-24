;; 8. **Test Description**: Create a module exporting a function with a `loop` instruction that conditionally calls an imported function using `br_if`. The imported function has its own loop with branching instructions. This checks the coordination and correct handling of branches and stack frames for conditional branches across module boundaries.

(assert_invalid
  (module
    (import "env" "func_import" (func $imported (result i32)))
    (func (export "test_func") (result i32)
      (local i32)
      (loop (result i32)
        (local.set 0 (call $imported))
        (br_if 0 (local.get 0))
      )
    )
  )
  "result type mismatch"
)