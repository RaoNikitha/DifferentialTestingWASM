;; 6. Check a scenario where a function in one module calls an exported function from another module which then hits an `unreachable` instruction. Validate that the trap handling and return paths remain consistent across modules.

(assert_invalid
  (module
    (import "env" "funcWithUnreachable" (func $funcWithUnreachable))
    (func (call $funcWithUnreachable) (i32.const 1))
  )
  "type mismatch"
)