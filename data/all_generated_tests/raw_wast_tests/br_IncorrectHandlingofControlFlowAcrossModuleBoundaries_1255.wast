;; 6. **Test Description:**    Create a module with an `if` condition that calls an imported function. Inside the imported function, place a `br` instruction targeting the `if` block in the calling module. Test that the stack and control flow maintain integrity across the module boundary.

(assert_invalid
  (module
    (func $callee (import "env" "externalFunc"))
    (func (block (result i32)
      (if (result i32)
        (i32.const 1)
        (call $callee)
        (br 0)
      )
      (i32.const 0)
      (drop)
    ))
  )
  "unresolved label"
)