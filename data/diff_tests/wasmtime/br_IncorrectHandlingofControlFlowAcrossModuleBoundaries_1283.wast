;; 4. **Test Description:** Construct a scenario where a WASM function uses `br` to break out of an `if` block and then immediately calls a function from another module which contains `br` instructions.    **Specific Constraint:** This ensures forward branches to `if` and operand handling are correctly executed before the module call.    **Relation to Control Flow Boundaries:** Tests interactions between module transitions and nested `if` blocks.

(assert_invalid
  (module
    (import "externalModule" "externalFunc" (func $externalFunc))
    (func $testFunc
      (block
        (if (i32.const 1)
          (then (br 1))
        )
        (call $externalFunc)
      )
    )
  )
  "type mismatch"
)