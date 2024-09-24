;; 4. **Test Description:**    Call a function in the main module that contains a `call_indirect` to an imported function with an `unreachable` instruction. Ensure that the indirect call leads directly to a trap, checking for consistent behavior across both implementations.

(assert_invalid
  (module
    (type $sig (func))
    (func $imported_fn (import "env" "imported_fn") (type $sig))
    (func $tester
      (call_indirect (type $sig) (i32.const 0) (i32.const 1))
      (unreachable)
    )
  )
  "type mismatch"
)