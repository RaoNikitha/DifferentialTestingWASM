;; 3. **Test Description:** Create a WASM module with `br_if` inside a `block` and call an imported function which performs another `br_if` leading to a return.    **Constraint Checked:** Accurate stack transition and control flow handling between module calls with nested blocks.    **Relation:** Checks for clean stack state transitions and properly executed returns after `br_if`.

(assert_invalid
  (module
    (import "env" "externalFunc" (func $externalFunc))
    (func $testFunc
      (block $outer
        (block $inner
          (i32.const 1)
          (br_if 1) 
          call $externalFunc
          (if (br_if 0))
        )
        (i32.const 0)
        (br_if $outer)
      )
      (return)
    )
  )
  "type mismatch"
)