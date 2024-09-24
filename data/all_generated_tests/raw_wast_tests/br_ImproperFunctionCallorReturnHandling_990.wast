;; 1. **Test Description:** A function contains multiple nested blocks and loops, with the innermost block making indirect function calls and ending with a `br` instruction targeting an outer block.    **Constraint Checked:** Ensure `br` correctly resolves the outer block label.    **Relation to Function Call/Return Handling:** Misplaced stack unwinding might corrupt the call stack if `br` doesn’t correctly jump outwards, leading to improper function call returns.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block
          (block
            (loop (result i32)
              (call $some_func)
              (br 2)
            )
          )
        )
      )
    )
    (func $some_func (result i32) (i32.const 42))
  )
  "type mismatch"
)