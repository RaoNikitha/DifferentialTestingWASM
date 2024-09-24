;; 1. **Test Description 1:** Create a nested block structure with an inner `br` instruction that targets an outer label and ensure that control correctly flows to the exported function's context. Import a function that performs a conditional call and ensure the control flow respects module boundaries.

(assert_invalid
  (module
    (func (export "test") (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (br 1) 
        )
        (i32.const 1)
      )
      (i32.const 2)
    )
    (func (import "env" "external_func") (param i32) (result i32))
  )
  "type mismatch"
)