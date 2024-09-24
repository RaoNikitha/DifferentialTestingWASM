;; 5. **Test Description:**    Import a function containing an `unreachable` instruction and use it in a conditional statement in the main module. Test if the execution traps immediately when the condition triggers the function call in both engines.

(assert_invalid
  (module
    (import "env" "unreachable_func" (func $unreachable_func))
    (func $invoke_unreachable
      (if (i32.const 1)
        (then (call $unreachable_func))
      )
    )
  )
  "unexpected end of section or function"
)