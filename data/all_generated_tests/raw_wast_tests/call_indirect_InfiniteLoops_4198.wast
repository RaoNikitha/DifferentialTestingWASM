;; 7. **Test Description**: Create a function that implements a `loop` with a `call_indirect` instruction, where the called function has the responsibility to recursively invoke the caller with an updated state to escape the initial loop. This checks whether improper function signature matching and returns trap conditions result in infinite recursion or loop.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (func $f (param i32) (result i32)
      (call_indirect (type $sig) (local.get 0))
    )
    (table funcref (elem $f))
    (func (export "start") (param i32) (result i32)
      (local.get 0)
      (loop (result i32)
        (call_indirect (type $sig) (local.get 0))
        (local.get 0)
      )
    )
  )
  "type mismatch"
)