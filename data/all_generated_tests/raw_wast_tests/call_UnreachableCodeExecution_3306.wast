;; 5. **Test Description**: Chain multiple function calls, ensuring one of the calls at a deeper level points to an `unreachable` instruction, verifying if stack management correctly unwinds upon a trap.

(assert_invalid
  (module
    (type (func))
    (type (func (result i32)))
    (type (func))
    (func $unreachable (unreachable))
    (func $nested2 (call $unreachable))
    (func $nested1 (call $nested2) (i32.const 0))
    (func $main (call $nested1) (call $nested1))
  )
  "type mismatch"
)