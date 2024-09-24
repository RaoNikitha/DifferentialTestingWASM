;; 1. **Test Description:** Create a WASM module that imports a function from another module. Inside the imported function, have deeply nested control structures (`block`, `loop`, `if`). Use the `br` instruction to branch back to a loop in the imported function.    **Specific Constraint:** This test checks if the `br` instruction correctly interprets the label indexing across module boundaries.    **Relation to Control Flow Boundaries:** Calling a function from another module and using `br` to control nested structures tests the integrity of stack and label indexing across module transitions.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func (export "test")
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (if (result i32)
              (then
                (call $imported_func)
                (br 2)
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)