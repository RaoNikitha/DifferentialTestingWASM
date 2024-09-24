;; 7. **Test Description:**    Place an `if` instruction inside an imported function, and call this function within another `if` statement's `then` block. Check for correct handling of stack changes and nested control flow conditions across the module boundary transitions.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func $type-imported-func-in-then (result i32)
      (if (result i32) (i32.const 1)
        (then
          call $external_func
          if (result i32) (i32.const 1)
            (then (i32.const 42))
          end
        )
      )
    )
  )
  "type mismatch"
)